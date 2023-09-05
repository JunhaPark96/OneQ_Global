import requests
import oracledb
from selenium import webdriver
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.keys import Keys
import time
from bs4 import BeautifulSoup
import os
from selenium.webdriver.common.by import By
from datetime import datetime

# 오늘 날짜 구하기
today = datetime.today().strftime("%Y%m%d")
today = int(today)

# 셀레니움 연결설정
options = webdriver.ChromeOptions()
# options.add_argument('headless')
# options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36")
# path = "C:\crawling\chromedriver.exe"
driver = webdriver.Chrome(options=options)
driver.implicitly_wait(10)
driver.get("https://www.kebhana.com/cms/rate/index.do?contentUrl=/cms/rate/wpfxd651_07i.do")
# cx_Oracle.init_oracle_client(lib_dir=r"C:\crawling\instantclient_21_6")
oracledb.init_oracle_client(lib_dir=r"C:\Users\kopo\exchange\instantclient_19_20")
#####################
## 8월 24, 26일 따로 해야함
#####################
search_date = 20230801
# today = 20220809


while(search_date < today):
    # 검색할 날짜 입력
    elem = driver.find_element(By.XPATH, r'//*[@id="tmpInqStrDt_d"]')
    elem.clear()
    print("검색한날짜:" + str(search_date))
    elem.send_keys(search_date) 
    time.sleep(3)

    # 조회할 통화 선택
    select = Select(driver.find_element(By.ID, "curCd"))

    ccy_list = {"USD","JPY","EUR","CNY","HKD","THB","TWD","PHP","SGD","AUD","VND","GBP","CAD","MYR","RUB"
    ,"ZAR","NOK","NZD","DKK","MXN","MNT","BHD","BDT"
    ,"BRL","BND","SAR","LKR","SEK","CHF","AED","DZD"
    ,"OMR","JOD","ILS","EGP","INR","IDR","CZK","CLP","KZT"
    ,"QAR","KES","COP","KWD","TZS","TRY","PKR","PLN","HUF"}
    
    num = 1
    for ccy_code in ccy_list:
        select.select_by_value(ccy_code)

        time.sleep(3)

        # 조회 버튼 클릭
        btn = driver.find_element(By.XPATH, r'//*[@id="HANA_CONTENTS_DIV"]/div[2]/a')
        btn.send_keys(Keys.ENTER)

        time.sleep(4)

        # BeautifulSoup으로 html 데이터 파싱
        html = driver.page_source
        soup = BeautifulSoup(html, 'lxml')

        date = soup.select_one('#searchContentDiv > div.printdiv > p > span.fl > strong:nth-child(2)').text # 조회 날짜
        # date = soup.select_one('#searchContentDiv > div.printdiv > p > span.fl > strong:nth-of-type(2)').text
        currency = soup.select_one('#searchContentDiv > div.printdiv > p > span.fl > strong:nth-child(4)').text # 조회 통화
        print("날짜는: " + date)
        print("통화는: " + currency)
        time.sleep(3)

        rows = soup.select('#searchContentDiv > div.printdiv > table > tbody > tr')
        oneNations = []
        rows.reverse()
        cols = rows[len(rows) - 1].select('td')

        # rate_date = str(search_date) + " " + cols[1].text  # 기준일시
        rate_date = str(search_date)[:4] + "-" + str(search_date)[4:6] + "-" + str(search_date)[6:8] + " " + cols[1].text
        print("환율 날짜: " + rate_date)
        buy_rate = cols[2].text
        buy_rate = float(buy_rate.replace(",", ""))
        # buy_rate = buy_rate.replace(",", "")
        print("살 때: " + str(buy_rate))
        sell_rate = cols[3].text
        sell_rate = float(sell_rate.replace(",", ""))
        # sell_rate = sell_rate.replace(",", "")
        print("팔 때: " + str(sell_rate))
        remittance = cols[4].text
        remittance = float(remittance.replace(",", ""))
        # remittance = remittance.replace(",", "")
        print("송금 보낼 때: " + str(remittance))
        receiving = cols[5].text
        receiving = float(receiving.replace(",", ""))
        # receiving = receiving.replace(",", "")
        print("송금 받을 때: " + str(receiving))
        base_rate = cols[8].text
        # base_rate = base_rate.replace(",", "")
        base_rate = float(base_rate.replace(",", ""))
        print("매매기준율: " + str(base_rate))
        prev_rate = cols[9].text
        prev_rate = float(prev_rate.replace(",", ""))
        # prev_rate = prev_rate.replace(",", "")
        print("직전대비: " + str(prev_rate))
        usd_conversion_rate = cols[11].text
        usd_conversion_rate = float(usd_conversion_rate.replace(",", ""))
        # usd_conversion_rate = usd_conversion_rate.replace(",", "")
        print("미화환산율: " + str(usd_conversion_rate))
        oneNation_info = []

        oneNation_info.append(ccy_code)             #통화코드
        oneNation_info.append(rate_date)            #기준일시
        oneNation_info.append(buy_rate)             #현찰 사실때
        oneNation_info.append(sell_rate)            #현찰 파실때
        oneNation_info.append(remittance)           #송금 보낼때
        oneNation_info.append(receiving)            #송금 받을때
        oneNation_info.append(base_rate)            #매매 기준율
        oneNation_info.append(prev_rate)            #직전대비
        oneNation_info.append(usd_conversion_rate)   #미화 환산율

        oneNations.append(oneNation_info)
        print(oneNations)
        # 오라클 연결 및 데이터 삽입
        # connection = cx_Oracle.connect(user='admin', password='Wnsdud2260341008', dsn='semifinal_medium')
        connection = oracledb.connect(
            user='ADMIN', password='@Pasdf658215', dsn='junha_high'
        )
        cursor = connection.cursor() # 커서 생성

        try:
            # sql = "INSERT INTO EXC_RATE(CCY_CODE, BASIC_DATE, BUY_EXC_RATE, SELL_EXC_RATE, SEND_EXC_RATE, REC_EXC_RATE, BASIC_RATE, EXCHANGE_RATE, USD_RATE) VALUES (:1, TO_DATE(:2, 'YYYYMMdd HH24:MI:SS'), :3, :4, :5, :6, :7, :8, :9)"
            sql = "INSERT INTO EXCHANGE_RATE_HIST(CUR_HIST_SEQ, CURRENCY_CODE, RATE_DATE, BUY_RATE, SELL_RATE, REMITTANCE, RECEIVING, BASE_RATE, PREV_RATE, USD_CONVERSION_RATE) VALUES (EXCHANGE_RATE_HIST_SEQ.NEXTVAL, :1, TO_DATE(:2, 'YYYY-MM-dd HH24:MI:SS'), :3, :4, :5, :6, :7, :8, :9)"
            cursor.bindarraysize = len(oneNation_info)
            cursor.execute(sql, oneNation_info)
            connection.commit()
        except Exception as e:
            print("에러" + str(search_date))
            print(f"에러 {search_date}: {str(e)}")
            search_date += 1
        finally:
            cursor.close()
            connection.close()
    search_date += 1