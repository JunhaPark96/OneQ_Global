from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
from datetime import datetime
import schedule
import oracledb
import logging
from decimal import Decimal

class WalletService:
    def __init__(self, connection):  
        self.connection = connection
    # 환전 진행
    def do_exchange(self, wallet_seq, currency_code, password, krw_amount, foreign_amount, source_currency_name):
        try:
            from_wallet = self.get_wallet_by_seq(wallet_seq)
            account = self.get_account_by_ac_no(from_wallet[2])
            target_wallet = self.get_wallet_by_user_and_currency(from_wallet[1], currency_code)

            self.process_krw_deduction(from_wallet, account, krw_amount)
            self.process_foreign_addition(from_wallet, target_wallet, currency_code, foreign_amount, source_currency_name)

            # 모든 작업이 성공적으로 완료되면 트랜잭션을 커밋
            self.connection.commit()
        except Exception as e:
            # 오류가 발생하면 변경 사항을 롤백
            self.connection.rollback()
            raise e
    # wallet에 외화 충전
    def process_foreign_addition(self, from_wallet, target_wallet, currency_code, foreign_amount, source_currency_name):
        cursor = self.connection.cursor()
        # 해당 외화가 wallet에 없을 시
        if target_wallet is None:
            self.add_wallet_new_cur(from_wallet, currency_code, source_currency_name, foreign_amount)
        # 해당 외화가 wallet에 있을 시
        else:
            cursor.execute("UPDATE HANA_WALLET SET BALANCE=BALANCE+:1 WHERE USER_SEQ=:2 AND CURRENCY_CODE=:3", 
                                (foreign_amount, from_wallet[1], currency_code))

        # 환전 입금 내역 transaction
        deposit_dto = self.create_deposit_dto(target_wallet if target_wallet else from_wallet, currency_code, foreign_amount, source_currency_name)
        cursor.execute("INSERT INTO HANA_WALLET_HIST (WALLET_TRANS_NO, WALLET_SEQ, BALANCE, TRANSACTION_AMOUNT, TRANSACTION_TYPE, DEPOSIT_CUR, DEPOSIT_NAME) VALUES (HANA_WALLET_SEQ.NEXTVAL, :1, :2, :3, 'E', :4, :5)",
                            deposit_dto)
        print("환전 입금 내역 추가:", deposit_dto)

    # 환전 입금 내역 추가
    def create_deposit_dto(self, target_wallet, currency_code, foreign_amount, source_currency_name):
        return (
            target_wallet[0],
            Decimal(target_wallet[4]) + Decimal(foreign_amount),  # Assuming Balance is at index 4
            foreign_amount,
            currency_code,
            source_currency_name
        )
    # 원화 차감
    def process_krw_deduction(self, from_wallet, account, krw_amount):
        cursor = self.connection.cursor()
        if Decimal(from_wallet[4]) < Decimal(krw_amount):  # from_wallet[4] = balance
            shortage = Decimal(krw_amount) - Decimal(from_wallet[4])
            self.deduct_from_account(account, int(shortage))
            cursor.execute("UPDATE HANA_WALLET SET BALANCE=BALANCE+:1 WHERE USER_SEQ=:2 AND CURRENCY_CODE='KRW'", 
                            (shortage, from_wallet[1]))

        cursor.execute("UPDATE HANA_WALLET SET BALANCE=BALANCE-:1 WHERE USER_SEQ=:2 AND CURRENCY_CODE='KRW'", 
                            (krw_amount, from_wallet[1]))

        withdraw_dto = self.create_withdraw_dto(from_wallet, krw_amount)
        cursor.execute("INSERT INTO HANA_WALLET_HIST (WALLET_TRANS_NO, WALLET_SEQ, BALANCE, TRANSACTION_AMOUNT, TRANSACTION_TYPE, WITHDRAW_CUR, WITHDRAW_NAME) VALUES (HANA_WALLET_SEQ.NEXTVAL, :1, :2, :3, 'E', 'KRW', 'won')",
                            withdraw_dto)
        print("환전 출금 내역 추가:", withdraw_dto)

    def create_withdraw_dto(self, from_wallet, krw_amount):
        return (
            from_wallet[0],
            Decimal(from_wallet[4]) - Decimal(krw_amount), 
            krw_amount
        )

    def deduct_from_account(self, account, amount):
        cursor = self.connection.cursor()
        # 계좌의 현재 잔액
        ac_no = account[0]
        cursor.execute("SELECT BALANCE FROM CHECKING_ACCOUNT WHERE AC_NO=:1", (ac_no,))
        # account_balance = self.cursor.fetchone()[0]
        account_balance = account[4]
        
        # 출금하려는 금액이 현재 잔액보다 많으면 예외를 발생.
        if account_balance < amount:
            raise ValueError("계좌 잔액이 부족합니다.")
        
        # 충분한 잔액이 있으면, 해당 금액을 계좌에서 차감.
        cursor.execute("UPDATE CHECKING_ACCOUNT SET BALANCE = BALANCE - :1 WHERE AC_NO=:2", (amount, ac_no))
        
        print(f"{amount} 금액이 계좌 {ac_no}에서 차감되었습니다.")
        self.connection.commit()


    
    def add_wallet_new_cur(self, wallet, currency_code, source_currency_name, foreign_amount):
        cursor = self.connection.cursor()
        new_wallet_currency_dto = (
            wallet[1],  # USER_SEQ
            wallet[2],  # AC_NO
            wallet[3],  # WALLET_PW
            foreign_amount,
            currency_code,
            source_currency_name
        )
        cursor.execute("INSERT INTO HANA_WALLET (WALLET_SEQ, USER_SEQ, AC_NO, WALLET_PW, BALANCE, CURRENCY_CODE, CURRENCY, PRIME_RATE) VALUES (HANA_WALLET_SEQ.NEXTVAL, :1, :2, :3, :4, :5, :6, 100)", new_wallet_currency_dto)
        print("월렛 외화 추가:", new_wallet_currency_dto)
        cursor.close()

    # wallet번호로 wallet 조회
    def get_wallet_by_seq(self, wallet_seq):
        cursor = self.connection.cursor()
        sql = "SELECT * FROM HANA_WALLET WHERE Wallet_Seq=:1"
        cursor.execute(sql, (wallet_seq,))
        result = cursor.fetchone()
        cursor.close()
        return result
    # 계좌번호로 계좌 조회
    def get_account_by_ac_no(self, ac_no):
        cursor = self.connection.cursor()
        cursor.execute("SELECT * FROM CHECKING_ACCOUNT WHERE AC_NO=:1", (ac_no,))
        result = cursor.fetchone()
        cursor.close()
        return result
    # 유저번호와 통화코드로 WALLET 조회
    def get_wallet_by_user_and_currency(self, user_seq, currency_code):
        cursor = self.connection.cursor()
        cursor.execute("SELECT * FROM HANA_WALLET WHERE USER_SEQ=:1 AND CURRENCY_CODE=:2", (user_seq, currency_code))
        result = cursor.fetchone()
        cursor.close()
        return result


class AutoExchange:
    def __init__(self, connection):
        self.connection = connection

    def connect_to_oracle(self):
        logging.info("Connecting to Oracle database...")
        # oracledb.init_oracle_client(lib_dir=r"C:\Users\kopo\exchange\instantclient_19_20")
        oracledb.init_oracle_client(lib_dir=r"C:\Users\kopo\exchange\instantclient_19_20")
        self.connection = oracledb.connect(user='ADMIN', password='@Pasdf658215', dsn='junha_high')
        logging.info("Connected to Oracle database")
    
    def close_oracle_connection(self):
        if self.connection is not None:
            self.connection.close()

    def perform_exchange(self, amount, rate):
        exchanged_amount = amount * rate
        total_with_fee = exchanged_amount * 1.01  # 1%의 수수료를 더합니다.
        return round(total_with_fee)  # 반올림하여 정수로 변환

    
    def _get_latest_exchange_rates(self):
        cursor = self.connection.cursor()
        sql = "SELECT CURRENCY_CODE, BASE_RATE FROM EXCHANGE_RATE"
        cursor.execute(sql)
        result = cursor.fetchall()
        rates = {row[0]: row[1] for row in result}
        cursor.close()
        return rates
    
    def get_waiting_auto_exchanges(self):
        cursor = self.connection.cursor()
        sql = "SELECT * FROM AUTO_EXCHANGE WHERE status = 'W'"
        result = cursor.execute(sql).fetchall()
        cursor.close()
        return result
    
    def get_wallet_by_auto_exchange_seq(self, ae_seq):
        cursor = self.connection.cursor()
        sql = """
        SELECT W.* 
        FROM HANA_WALLET W
        JOIN AUTO_EXCHANGE AE ON W.WALLET_SEQ = AE.WALLET_SEQ
        WHERE AE.AE_SEQ = :1
        """
        cursor.execute(sql, (ae_seq,))
        result = cursor.fetchone()
        cursor.close()
        return result

    # 유저번호와 통화코드로 WALLET 조회
    def get_wallet_by_user_and_currency(self, user_seq):
        cursor = self.connection.cursor()
        sql = """
        SELECT * 
        FROM HANA_WALLET 
        WHERE USER_SEQ = :1 AND CURRENCY_CODE = :2
        """
        cursor.execute(sql, (user_seq, "KRW"))
        result = cursor.fetchone()
        cursor.close()
        return result

    
    def check_and_exchange(self):
        exchange_rates = self._get_latest_exchange_rates()
        pending_requests = self.get_waiting_auto_exchanges()

        wallet_service = WalletService(self.connection)

        for request in pending_requests:
            ae_seq = request[0]
            wallet_seq = request[1]
            base_cur_code = request[2]
            target_cur_code = request[3]
            exchange_amount = request[4]
            exchange_date = request[5]
            lower_bound = request[6]
            status = request[7]

            wallet_info = self.get_wallet_by_auto_exchange_seq(ae_seq)
            krw_wallet_info = self.get_wallet_by_user_and_currency(wallet_info[1])
            print("월렛정보는 ", wallet_info)
            print("원화 월렛정보는 ", krw_wallet_info)
            # 날짜가 만료되면 status 'F'로 변환
            if exchange_date.date() <= datetime.today().date():
                self.update_status(ae_seq, 'F')
                continue
            
            target_rate = lower_bound
            print("환율정보 총: ", exchange_rates)
            print("환율은 ", exchange_rates[target_cur_code])
            if target_cur_code in exchange_rates and exchange_rates[target_cur_code]:
                print(target_cur_code)
                exchanged_amount = self.perform_exchange(exchange_amount, exchange_rates[target_cur_code])
                print("환전할 금액은 ", exchanged_amount)
                print("출금할월렛의번호", krw_wallet_info[0], "환전할외화코드", target_cur_code, "월렛비밀번호", wallet_info[3], "결제할원화금액", exchanged_amount, "환전될외화금액", exchange_amount, "외화통화이름", wallet_info[7])
                wallet_service.do_exchange(krw_wallet_info[0], target_cur_code, wallet_info[3], exchanged_amount, exchange_amount, wallet_info[7])
                # 출금할월렛의번호, 환전할외화코드, 월렛비밀번호, 결제할원화금액, 환전될외화금액, 외화통화이름
                self.update_status(ae_seq, 'S')
                print("자동환전 상태 변환", status)

    # 자동환전에 성공하면 상태 update
    def update_status(self, ae_seq, status):
        cursor = self.connection.cursor()
        sql = "UPDATE AUTO_EXCHANGE SET status = :1 WHERE AE_SEQ = :2"
        cursor.execute(sql, [status, ae_seq])
        self.connection.commit()
        cursor.close()
def main():
    logging.basicConfig(level=logging.INFO)  # 로깅을 활성화하려면 이 줄이 필요합니다.
    logging.info("Starting the program...")
    
    connection = None
    auto_exchange = AutoExchange(connection)
    auto_exchange.connect_to_oracle()
    auto_exchange.check_and_exchange()
    auto_exchange.close_oracle_connection()

if __name__ == "__main__":
    main()
