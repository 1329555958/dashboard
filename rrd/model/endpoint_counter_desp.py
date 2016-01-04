# coding:UTF-8
__author__ = 'weichunhe'
from rrd.store import graph_db_conn as db_conn

# 缓存描述信息
Desps = {}

sql = 'SELECT counter,desp FROM graph.endpoint_counter_desp LIMIT 0,1000'


# 刷新缓存
def refresh():
    cursor = db_conn.execute(sql, [])
    rows = cursor.fetchall()
    cursor and cursor.close()
    for row in rows:
        Desps[row[0]] = row[1]

    print 'counter descriptions'
    print(Desps)


refresh()


# 获取描述信息
def getDesp(counter):
    return Desps.get(counter, '')
