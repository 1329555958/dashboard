function fn_list_endpoints() {
    var qs = $.trim($("input[name='endpoint_search']").val());
    var tags = $.trim($("input[name='tag_search']").val());
    var limit = $("#endpoint-limit").val();

    $(".loading").show();
    $.getJSON("/api/endpoints", {q: qs, tags: tags, limit: limit, _r: Math.random()}, function (ret) {
        $(".loading").hide();
        if (!ret.ok) {
            alert(ret.msg);
            return;
        }
        var hosts = ret.data;

        // display_endpoints
        var tbody_hosts = $("#tbody-endpoints");
        tbody_hosts.html("");
        for (var hidx in hosts) {
            var endpoint = hosts[hidx].split(';');
            var h = endpoint[0], url = endpoint[1];
            var line_html = '<tr>'
                + '<td><input type="checkbox" class="endpoint" name="endpoint" data-fullname="' + h + '"></input></td>'
                + '<td><a href="#" target="_blank" onclick="fn_show_all(\'h\',\'' + h + '\');">' + h + '</a></td>'
                + (url ? ('<td><a href="' + url + '" target="_blank" >查看实时监控</a></td>') : '')
                + '</tr>';
            tbody_hosts.append($(line_html));

        }
        //选中第一个
        setTimeout(function () {
            tbody_hosts.find('.endpoint').first().click();
        }, 100);
        fn_check_all_hosts();
    }).error(function (req, ret, errorThrown) {
        $(".loading").hide();
        alert(req.statusText)
    })
}

function fn_list_counters() {
    var qs = $.trim($("#counter-search").val());
    var hosts = new Array();
    $("#tbody-endpoints input:checked").each(function (i, o) {
        var name = $(o).attr("data-fullname");
        hosts.push(name);
    });
    if (hosts.length === 0) {
        alert("先选定一些endpoints");
        return false;
    }

    var limit = $("#counter-limit").val();
    $(".loading").show();
    $.ajax({
        method: "POST",
        url: "/api/counters",
        dataType: "json",
        data: {"endpoints": JSON.stringify(hosts), "q": qs, "limit": limit, "_r": Math.random()},
        success: function (ret) {
            $(".loading").hide();
            if (ret.ok) {
                var items = ret.data;
                // display counters
                var tbody_items = $("#tbody-counters");
                tbody_items.html("");

                for (var i in items) {
                    var c = items[i];
                    var display_counter_type = "计数器";
                    if (c[1] == "GAUGE") {
                        display_counter_type = "原始值";
                    }
                    var line_html = '<tr>'
                        + '<td><input type="checkbox" data-fullkey="' + c[0] + '"></input></td>'
                        + '<td><a href="javascript:void(0);" onclick="fn_show_chart(\'' + c[0] + '\')" >' + c[0] + '</a></td>'
                        + '<td>' + c[3] + '</td>'
                        + '<td>' + display_counter_type + '</td>'
                        + '<td>' + c[2] + 's</td>'
                        + '</tr>'
                    tbody_items.append($(line_html));
                }
            } else {
                alert("搜索失败：" + ret.msg);
                return false;
            }
        }
    });
}


function filter_endpoint() {
    var filter_text = $("#endpoint-filter").val().toLowerCase();
    var targets = $("#tbody-endpoints tr");
    if (!filter_text) {
        targets.each(function (i, obj) {
            $(obj).show();
        });
    } else {
        var filter_pattern = new RegExp(filter_text, "i");

        targets.each(function (i, obj) {
            var checkbox = $($(obj).find("input[type='checkbox']")[0]);
            var name = checkbox.attr("data-fullname");
            if (filter_pattern.exec(name) == null) {
                $(obj).hide();
            } else {
                $(obj).show();
            }
            if ($(obj).is(":visible")) {
                checkbox.prop("checked", true);
            } else {
                checkbox.prop("checked", false);
            }
        });
    }
};

function filter_counter() {
    var filter_text = $("#counter-filter").val().toLowerCase();
    var targets = $("#tbody-counters tr");
    if (!filter_text) {
        targets.each(function (i, obj) {
            $(obj).show();
        });
    } else {
        var filter_pattern = new RegExp(filter_text, "i");
        targets.each(function (i, obj) {
            var checkbox = $($(obj).find("input[type='checkbox']")[0]);
            var name = checkbox.attr("data-fullkey");
            if (filter_pattern.exec(name) == null) {
                $(obj).hide();
            } else {
                $(obj).show();
            }
            if ($(obj).is(":visible")) {
                checkbox.prop("checked", true);
            } else {
                checkbox.prop("checked", false);
            }
        });
    }
};

function fn_show_chart(counter) {
    var checked_hosts = new Array();
    $("#tbody-endpoints input:checked").each(function (i, o) {
        if ($(o).is(":visible")) {
            var hostfullname = $(o).attr("data-fullname");
            checked_hosts.push(hostfullname);
        }
    });
    if (checked_hosts.length === 0) {
        alert("先选endpoint：）");
        return false;
    }

    checked_items = new Array();
    checked_items.push(counter);
    var w = window.open();
    $.ajax({
        url: "/chart",
        dataType: "json",
        method: "POST",
        data: {"endpoints": checked_hosts, "counters": checked_items, "graph_type": "h", "_r": Math.random()},
        success: function (ret) {
            if (ret.ok) {
                setTimeout(function () {
                    w.location = '/chart/big?id=' + ret.id;
                }, 0);
            } else {
                alert("请求出错了");
            }
        },
        error: function () {
            alert("请求出错了");
        }
    });
    return false;
}
/**
 * 查看选中所有graph
 * @param graph_type 视角
 * @param [endpoint] 如果是传递了endpoint，就是查看这个主机上固定信息
 * @returns {boolean}
 */
function fn_show_all(graph_type, endpoint) {
    var checked_hosts = [];
    var checked_items = [];
    if (endpoint) {
        graph_type = 'h';
        checked_hosts.push(endpoint);
        checked_items = ['mem.memfree.percent', 'cpu.user','df.statistics.used.percent'];
    } else {
        $("#tbody-endpoints input:checked").each(function (i, o) {
            if ($(o).is(":visible")) {
                var hostfullname = $(o).attr("data-fullname");
                checked_hosts.push(hostfullname);
            }
        });
        if (checked_hosts.length === 0) {
            alert("先选endpoint：）");
            return false;
        }
        $("#tbody-counters input:checked").each(function (i, o) {
            if ($(o).is(":visible")) {
                var key_ = $(o).attr("data-fullkey");
                checked_items.push(key_);
            }
        });
        if (checked_items.length === 0) {
            alert("请选择counter");
            return false;
        }

    }

    var w = window.open();
    $.ajax({
        url: "/chart",
        dataType: "json",
        method: "POST",
        data: {"endpoints": checked_hosts, "counters": checked_items, "graph_type": graph_type, "_r": Math.random()},
        success: function (ret) {
            if (ret.ok) {
                setTimeout(function () {
                    w.location = "/charts?id=" + ret.id + "&graph_type=" + graph_type;
                }, 0);
            } else {
                alert("请求出错了");
            }
        },
        error: function () {
            alert("请求出错了");
        }
    });
    return false;
}

function fn_check_all_items() {
    var box = $("#check_all_counters");
    if (box.prop("checked")) {
        $("#tbody-counters").find("input:checkbox").each(function (i, o) {
            $(o).prop("checked", true);
        });
    } else {
        $("#tbody-counters").find("input:checkbox").each(function (i, o) {
            $(o).prop("checked", false);
        });
    }
}

function fn_check_all_hosts() {
    var box = $("#check_all_endpoints");
    if (box.prop("checked")) {
        $("#tbody-endpoints").find("input:checkbox").each(function (i, o) {
            $(o).prop("checked", true);
        });
    } else {
        $("#tbody-endpoints").find("input:checkbox").each(function (i, o) {
            $(o).prop("checked", false);
        });
    }
}

function fn_filter_group() {
    var filter_text = $("#group-filter").val().toLowerCase();
    var group_objs = $(".group");
    if (!filter_text) {
        group_objs.each(function (i, obj) {
            $(obj).show();
        });
    } else if (filter_text.length <= 2) {
    } else {
        group_objs.each(function (i, obj) {
            var groupname = $($(obj).children("a")[0]).attr("data-gname");
            if (groupname.toLowerCase().indexOf(filter_text) === -1) {
                $(obj).hide();
            } else {
                $(obj).show();
            }
        });
        fn_collapse_in_groups();
    }
};

function fn_collapse_in_groups() {
    $(".accordion-body").each(function (i, obj) {
        if (!$(obj).hasClass("in")) {
            $(obj).collapse("show");
        }
    });
};
