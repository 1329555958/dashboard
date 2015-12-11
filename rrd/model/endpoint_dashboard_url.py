# coding:UTF-8
__author__ = 'weichunhe'
from rrd.store import graph_db_conn as db_conn

# 缓存描述信息
DashBoardUrls = {}

sql = 'SELECT endpoint,url FROM graph.endpoint_dashboard_url LIMIT 0,1000'
cursor = db_conn.execute(sql, [])
rows = cursor.fetchall()
cursor and cursor.close()
for row in rows:
    DashBoardUrls[row[0]] = row[1]

print 'endpoint dashboard urls'
print(DashBoardUrls)



# 获取描述信息
def getDashboardUrl(endpoint):
    return DashBoardUrls[endpoint]
