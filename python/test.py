import oracledb
oracledb.init_oracle_client(lib_dir=r"/home/ubuntu/")

connection = oracledb.connect(
    user='ADMIN', password='@Pasdf658215', dsn='junha_high'
)

cursor = connection.cursor()

try:
    sql = "insert into checking_account (ac_no, ac_name, user_seq, ac_passwd, status) values ('1111', '주계좌', 1, '1234', 1)"
    cursor.execute(sql)
    # connection.commit()
    print("커밋완료")
    print(sql)
except :
    print("에러발생")
finally:
    cursor.close()
    connection.close()