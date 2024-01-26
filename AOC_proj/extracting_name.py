import pymysql
from pymysql.constants import CLIENT
import re
##################################################################################################################
'''
00. sql 서버

01. connect_db : db 연결하는 함수

03. fetchall_data : 쿼리에 맞는 데이터를 모두 가져와 return하는 함수
'''
##################################################################################################################

'''
00. sql 기본 서버
'''
host = 'kingsean.iptime.org'
port = 3000
user = 'root'
password = 'olive1004!'
charset = 'utf8mb4'
db = 'olivedb'


'''
01. db 연결하는 함수
'''
def connect_db(host=host, port=port, user=user, password=password, charset=charset, db=db):
    '''
    - host : str (default = "kingsean.iptime.org")
           : 연결할 db host
    - port : int (default = 3000)
           : 연결할 db port
    - user : str (default = "root")
           : db에 연결할 username
    - password : str (default = "olive1004!")
               : db에 연결할 username의 password
    - charset : str (default = "utf8mb4")
              : 연결할 db의 charset
    - db_name : str (default = "olivedb")
              : 연결할 db 이름
    
    ## return conn, cursor
    '''
    
    ####

  
    '''
    아래 conn변수 생성할 때 autocommit=False 로 해놨습니다! 
    필요시 변경해주세요.
    '''
    conn = pymysql.connect(host=host, port=port, user=user, password=password, charset=charset, db=db, client_flag=CLIENT.MULTI_STATEMENTS, autocommit=False)
    cur = conn.cursor()
    return conn, cur


##
conn, cur = connect_db()

get_full_name = f'SELECT pid, name, full_name, brand FROM tbl_product WHERE full_name IS NOT NULL ORDER BY pid;'
cur.execute(get_full_name)
full_names = cur.fetchall()


###
for pid, name, full_name, brand in full_names:
    prd_name = full_name
    
    if '[' in prd_name:
        prd_name = re.sub(r'\[.*?\]', '', prd_name)
    if '(' in prd_name:
        prd_name = re.sub(r'\([^)]*\)', '', prd_name)
    if brand in prd_name:
        brand_idx = prd_name.index(brand)
        p1 = prd_name[:brand_idx]
        p2 = prd_name[brand_idx:brand_idx+len(brand)]
        p3 = prd_name[brand_idx+len(brand):]
        prd_name = p1+p3
    if re.match(r'(차앤박.*옴므랩)', prd_name):
        prd_name = re.sub(r'(차앤박.*옴므랩)', '', prd_name)
    

    prd_name = re.sub('_', ' ', prd_name)
    
    delete = re.compile(r'(기획|한정|더블|리필|1[+]1|\S*\s?증정|어워즈|세트|대용량|[nN][eE][wW]|마스크팩|\d+\s?매|\d+\s?g|\d+\s?개?입|단품|단독|증량|\d+\s?종|화장솜|택\s?\d+)')
    d = delete.pattern
    keyword = re.compile(r'(스킨|로션|토너|에센스|토닝|앰플|쉐이브|오일|세럼|크림|젤|워터|토닉|스틱|에멀전)')
    k = keyword.pattern
    
    prd_name = re.sub(r'[+]*\d+[mM][lL][+]*', ' ', prd_name)
    prd_name = re.sub(r'[+]*\d+\s*[mM][lL][+]*', ' ', prd_name)
    prd_name = re.sub(r'\s*'+d+r'\s*', ' ', prd_name) 
    prd_name = re.sub(r'(?!\S*'+k+r'\S*)\S*'+d+r'\S*|\S*'+d+r'\S*(?!\S*'+k+r'\S*)', ' ', prd_name)  
    prd_name = re.sub(r'(?=\S*'+k+r'\S*)'+d+r'\S*|\S*'+d+r'(?=\S*'+k+r'\S*)', ' ', prd_name)

    prd_name = re.sub(r'[^%[.]\w\s]', '', prd_name)
    prd_name = prd_name.strip()
    prd_name = re.sub(r'\s{2,}', ' ', prd_name)
    
    update_sql = f"""UPDATE tbl_product_test
                    SET name = '{prd_name}'
                    WHERE pid = {pid};"""
    
    cur.execute(update_sql)


###
'''
autocommit=False 로 설정했을 시, 
수동 커밋'''

conn.commit()

conn.close()
