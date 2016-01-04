# coding:UTF-8
__author__ = 'weichunhe'
from rrd.store import graph_db_conn as db_conn

# 缓存描述信息
DashBoardUrls = {}

sql = 'SELECT endpoint,url FROM graph.endpoint_dashboard_url LIMIT 0,1000'
sync_sql = "INSERT INTO graph.endpoint_dashboard_url(ENDPOINT,url) SELECT DISTINCT hostname,CONCAT('http://',ip,':1988') FROM falcon_portal.host h WHERE NOT EXISTS (SELECT id FROM graph.endpoint_dashboard_url u WHERE u.endpoint = h.hostname)"


# 刷新缓存
def refresh():
    db_conn.execute(sync_sql, [])  # 同步主机ip数据
    db_conn.commit()
    cursor = db_conn.execute(sql, [])
    rows = cursor.fetchall()
    cursor and cursor.close()
    for row in rows:
        DashBoardUrls[row[0]] = row[1]

    print 'endpoint dashboard urls'
    print(DashBoardUrls)


refresh()


# 获取描述信息
def getDashboardUrl(endpoint):
    return DashBoardUrls.get(endpoint, '')
