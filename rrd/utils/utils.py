# coding:UTF-8
import random
import time
import json
from datetime import datetime, date

import base64

__author__ = 'weichunhe'
""" 一些工具方法 """


def _default(o):
    """
    json序列化时,自定义类型要调用的方法
    :param o:
    :return:
    """
    if isinstance(o, datetime):
        return o.strftime('%Y-%m-%d %H:%M:%S')
    if isinstance(o, date):
        return o.strftime('%Y-%m-%d')
    if hasattr(o, '__dict__'):
        return vars(o)
    if hasattr(o, '__str__'):
        return o.__str__()
    if hasattr(o, '__unicode__'):
        return o.__unicode__()
    return ""


jsonEncoder = json.JSONEncoder(skipkeys=True, default=_default)


def list_args(args):
    """
    1。将元组转换为list
    2。如果list为空，抛出异常
    3. 如果第一个参数是list类型，就忽略后面的参数，将第一个参数作为list
    4。返回list
    :param args: 函数中的元组参数
    :return:
    """
    e = Exception('至少需要一个参数')
    args = list(args)
    if len(args) == 0:
        raise e
    if isinstance(args[0], list):
        args = args[0]
    if len(args) == 0:
        raise e
    return args


def set_from_dict(dest, sourc):
    """
    从字典数据source中获取值来设置到对象dest中
    :param dest: 要设置属性的对象
    :param sourc: 提供属性值的字典
    :return: 设值后的对象 dest
    """

    attrs = vars(dest)
    for a in attrs:
        # 以下划线开头的是私有的就不进行设置了
        if a.startswith('_'):
            continue
        if a in sourc and sourc[a]:
            setattr(dest, a, sourc[a])
    return dest


def extend_dict(*args):
    """
    实现类似jQuery的extent方法
    :param args: 不定数量的字典列表
    :return: 返回扩展后的字典，如果没有传递参数就是返回空的字典
        返回的新字典可能包含之前参数中的引用
    """
    args = list_args(args)
    rt = args.pop(0)
    # 遍历参数
    for d in args:
        for k in d:
            rt[k] = d[k]
    return rt


def get_dicts_from_qry(qrySet):
    """
    将查询转换为字典数据
    :param qrySet:
    :return:
    """
    js = []
    for q in qrySet:
        js.append(vars(q))
    return js


def extend_list(*args):
    """
    将多个list合并到第一个上面,如果第一个不是list就返回一个新的list
    :param args: list或者单个参数
    :return: 合并后的list
    """
    rt = []
    args = list_args(args)
    a = args.pop(0)
    if isinstance(a, list):
        rt = a
    else:
        rt.append(a)
    # 如果是列表就连接，否则就追加
    for i in args:
        if isinstance(i, list):
            rt += i
        else:
            rt.append(i)
    return rt


def get_dict_from_req(req):
    """
    从请求信息中获取参数字典
    :param req: 请求
    :return:字典
    """
    dict = {}
    if req and req.method:
        if req.method == 'GET':
            try:
                dict = req.GET
            except Exception:
                pass
        elif req.method == 'POST':
            try:
                dict = req.POST
            except Exception:
                pass
    return dict


def make_id():
    """
    生成一个id
    :return:
    """
    return time.strftime('%Y%m%d%H%M%S') + str(random.randint(100, 999))


def cur_time_str():
    """
    返回当前时间的字符串类型
    :return:
    """
    return time.strftime('%Y-%m-%d %H:%M:%S')


def pick(obj, *args):
    """
    从字典obj中取部分属性
    :param dict 字典对象
    :args 属性名称
    """
    rt = {}
    if isinstance(obj, dict):
        for a in args:
            rt[a] = None
            if obj.has_key(a):
                rt[a] = obj[a]
        return rt
    return None


def base64_img(path):
    """
    对图片进行base64编码
    :param path 图片路径
    :return 编码后数据
    """
    img = open(path, 'rb')
    bs_f = base64.b64encode(img.read())
    start = path.rindex('.') + 1
    bs_f = 'data:image/' + path[start:] + ';base64,' + bs_f
    img.close()
    return bs_f


class MySessionJson(object):
    """
    自定义session序列化
    """

    def dumps(self, obj):
        return jsonEncoder.encode(obj)

    def loads(self, data):
        return json.loads(data.decode('latin-1'))


class MyJsonEncoder(json.JSONEncoder):
    def default(self, o):
        return _default(o)
