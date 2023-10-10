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


class ExchangeRealtime:
    def __init__(self):
        self.connection = None

    def connect_to_oracle(self):
        logging.info("Connecting to Oracle database...")
        oracledb.init_oracle_client(lib_dir=r"/home/ubuntu/instantclient_19_20")
        self.connection = oracledb.connect(user='ADMIN', password='@Pasdf658215', dsn='junha_high')
        logging.info("Connected to Oracle database")

    def drop_table_data(self):
        cursor = self.connection.cursor()
        sql = "DELETE FROM EXCHANGE_RATE"
        cursor.execute(sql)
        self.connection.commit()
        cursor.close()
    def isconnected(self):
        try:
            self.connection.ping()
            return True
        except:
            return False
    # 최신환율이 아닌 환율은 이동
    def move_data_to_history(self):
        if not self.connection or not self.isconnected():
            self.connect_to_oracle
        cursor = self.connection.cursor()
        # 기존의 EXCHANGE_RATE 데이터를 EXCHANGE_RATE_HIST 테이블로 복사합니다.
        sql = """
        INSERT INTO EXCHANGE_RATE_HIST
        (CUR_HIST_SEQ, CURRENCY_CODE, RATE_DATE, BUY_RATE, SELL_RATE, REMITTANCE, RECEIVING, BASE_RATE, PREV_RATE, USD_CONVERSION_RATE, ROUND)
        SELECT EXCHANGE_RATE_HIST_SEQ.NEXTVAL, CURRENCY_CODE, RATE_DATE, BUY_RATE, SELL_RATE, REMITTANCE, RECEIVING, BASE_RATE, PREV_RATE, USD_CONVERSION_RATE, ROUND
        FROM EXCHANGE_RATE
        """
        cursor.execute(sql)
        self.connection.commit()
        cursor.close()
    # 같은 회차의 환율은 제외
    def time_data_exists(self, currency_code, trade_time):
        cursor = self.connection.cursor()
        # sql = "SELECT COUNT(*) FROM EXCHANGE_RATE WHERE RATE_DATE = TO_DATE(:1, 'HH24:MI:SS')"
        sql = "SELECT COUNT(*) FROM EXCHANGE_RATE WHERE CURRENCY_CODE = :1 AND RATE_DATE = TO_DATE(:2, 'YYYY-MM-DD HH24:MI:SS')"
        count = cursor.execute(sql, [currency_code, trade_time]).fetchone()[0]
        print("통화코드: " + currency_code + ", 통화개수는:" + str(count))
        cursor.close()
        return count > 0
     # 데일리 데이터 구축
    def initExchangeRateDaily(self):
        self.connect_to_oracle()
        logging.info("Initializing daily exchange rate...")
        today = datetime.today().date()
        print(today)
        # 기존데이터 EXCHANGE_RATE_HIST로 이동
        self.move_data_to_history()
        # EXCHANGE_RATE 테이블의 데이터 삭제
        self.drop_table_data()
        # 셀레니움 연결
        # service_path = "/home/ubuntu/instantclient_19_8_2/chromedriver-linux64/chromedriver"
        # service_path = r"C:\Users\kopo\exchange"
        # service = Service(executable_path=service_path)
        # service = Service(service_path)
        options = webdriver.ChromeOptions()
        options.add_argument('headless') #headless 모드 설정
        # options.add_argument('--disable-dev-shm-usage')
        # options.add_argument('headless')
        # options.add_argument('no-sandbox')
        # driver = webdriver.Chrome(service=service_path, options=options)
        driver = webdriver.Chrome(options=options)

        driver.implicitly_wait(25)


        # 하나은행 환율 사이트 접속
        driver.get("https://www.kebhana.com/cms/rate/index.do?contentUrl=/cms/rate/wpfxd651_07i.do")
        time.sleep(2)

        # 검색할 날짜 입력
        a = "//*[@id='tmpInqStrDt_d']"
        elem = driver.find_element(By.XPATH, a)
        elem.clear()
        search_date = today
        elem.send_keys(search_date.strftime("%Y%m%d"))

        time.sleep(2)

        # 조회할 통화 선택
        select = Select(driver.find_element(By.ID, "curCd"))
        # codes = self.getCode()
        codes = ["USD","JPY","EUR","CNY","HKD","THB","TWD","PHP","SGD","AUD","VND","GBP","CAD","MYR","RUB"
                ,"ZAR","NOK","NZD","DKK","MXN","MNT","BHD","BDT"
                ,"BRL","BND","SAR","LKR","SEK","CHF","AED","DZD"
                ,"OMR","JOD","ILS","EGP","INR","IDR","CZK","CLP","KZT"
                ,"QAR","KES","COP","KWD","TZS","TRY","PKR","PLN","HUF"]
        # codes = ["USD","JPY","EUR"]

        for code in codes:
            select.select_by_value(code)
            time.sleep(2)

            b = "//*[@id='HANA_CONTENTS_DIV']/div[2]/a"
            btn = driver.find_element(By.XPATH, b)
            btn.send_keys(Keys.ENTER)
            time.sleep(2)

            html = driver.page_source
            soup = BeautifulSoup(html, 'lxml')
            time.sleep(2)
            date = soup.select_one('#searchContentDiv > div.printdiv > p > span.fl > strong:nth-child(2)').text # 조회 날짜
            print("날짜는: " + date)
            rows = soup.select('#searchContentDiv > div.printdiv > table > tbody > tr:nth-child(1)')
            rows.reverse()

            data_for_insertion = []

            for row in rows:
                cols = row.select('td')
                # rate_date = cols[1].text.strip()
                # rate_date = str(search_date)[:5] + "-" + str(search_date)[5:7] + "-" + str(search_date)[7:9] + " " + cols[1].text
                round = cols[0].text
                print("고시회차는: " + str(round))
                print("통화코드는: " + str(code))
                rate_date = search_date.strftime('%Y-%m-%d') + " " + cols[1].text
                print("환율 날짜: " + rate_date)
                buy_rate = float(cols[2].text.replace(",", ""))
                print("살 때: " + str(buy_rate))
                sell_rate = float(cols[3].text.replace(",", ""))
                print("팔 때: " + str(sell_rate))
                remittance = float(cols[4].text.replace(",", ""))
                print("송금 보낼 때: " + str(remittance))
                receiving = float(cols[5].text.replace(",", ""))
                print("송금 받을 때: " + str(receiving))
                base_rate = float(cols[8].text.replace(",", ""))
                print("매매기준율: " + str(base_rate))
                # prev_rate = float(cols[9].text.replace(",", ""))
                usd_conversion_rate = float(cols[11].text.replace(",", ""))

                try :
                    img_alt = cols[9].find('img')['alt']
                    if img_alt == '증가':
                        prev_rate = cols[9].text.strip()
                    elif img_alt == '감소':
                        prev_rate = '-' + cols[9].text.strip()
                except Exception as e:
                    prev_rate = '0'

                print("직전대비: " + str(prev_rate))
                row_data = [code, rate_date, buy_rate, sell_rate, remittance, receiving, base_rate, prev_rate, usd_conversion_rate, round]
                data_for_insertion.append(row_data)
            cursor = self.connection.cursor()
            for row_data in data_for_insertion:
                if not self.time_data_exists(row_data[0], row_data[1]):
                    sql = "INSERT INTO EXCHANGE_RATE(EXCHANGE_RATE_SEQ, CURRENCY_CODE, RATE_DATE, BUY_RATE, SELL_RATE, REMITTANCE, RECEIVING, BASE_RATE, PREV_RATE, USD_CONVERSION_RATE, ROUND) VALUES (EXCHANGE_RATE_SEQ.NEXTVAL, :1, TO_DATE(:2, 'YYYY-MM-dd HH24:MI:SS'), :3, :4, :5, :6, :7, :8, :9, :10)"
                    cursor.execute(sql, row_data)
                    self.connection.commit()
            cursor.close()
        driver.quit()
        logging.info("Finished initializing daily exchange rate")
        self.close_oracle_connection()
    def close_oracle_connection(self):
        if self.connection is not None:
            self.connection.close()

def job(exchange):
    exchange.initExchangeRateDaily()
    #exchange.close_oracle_connection()

def main():
    logging.basicConfig(level=logging.INFO)
    logging.info("Starting the program...")
    exchange = ExchangeRealtime()

    schedule.every(5).minutes.do(job, exchange=exchange)
    # schedule.every(3).seconds.do(job, exchange=exchange)

    while True:
        schedule.run_pending()
        time.sleep(1)

main()