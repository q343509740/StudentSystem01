<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>学生管理页面 - 首页</title>
    <%--<link href="css/style.css" rel="stylesheet">--%>
    <script src="js/jquery-1.7.1.min.js"></script>
    <%--<script src="js/bootstrap-3.3.7.min.js"></script>--%>
    <%--<link href="css/bootstrap-3.3.7.min.css" rel="stylesheet">--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
        });

        function del() {
            var msg = "您确定要删除吗?";
            if(confirm(msg) == true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">学生管理系统</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="/addStudentView">新增学生</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="form-group">
        <table class="table table-striped table-bordered">
            <caption>学生列表 - 共${page.total}人</caption>
            <thead>
                <tr class="success">
                    <th>学号</th>
                    <th>姓名</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>出生日期</th>

                    <th>编辑</th>
                    <th>删除</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${students}" var="s" varStatus="status">
                    <tr>
                        <td>${s.student_id}</td>
                        <td>${s.name}</td>
                        <td>${s.age}</td>
                        <td>${s.sex}</td>
                        <td>${s.birthday}</td>

                        <td><a href="/editStudent?id=${s.id}"><span class="glyphicon glyphicon-edit"></span> </a></td>
                        <td><a href="/deleteStudent?id=${s.id}" onclick="javascript:return del();"><span class="glyphicon glyphicon-trash"></span> </a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <nav style="text-align: center">
        <ul class="pagination">
            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                <a href="?page.start=0">
                    <span>«</span>
                </a>
            </li>

            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                <a href="?page.start=${page.start-page.count}">
                    <span>‹</span>
                </a>
            </li>

            <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
                <a href="?page.start=${page.start-page.count}">
                    <span>‹</span>
                </a>
            </li>

            <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

                <c:if test="${status.count*page.count-page.start<=30 && status.count*page.count-page.start>=-10}">
                    <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                        <a
                                href="?page.start=${status.index*page.count}"
                                <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                        >${status.count}</a>
                    </li>
                </c:if>
            </c:forEach>

            <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                <a href="?page.start=${page.start+page.count}">
                    <span>›</span>
                </a>
            </li>
            <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
                <a href="?page.start=${page.last}">
                    <span>»</span>
                </a>
            </li>
        </ul>
    </nav>
</body>
