<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="js/jquery-1.7.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


    <title>学生管理页面 - 编辑页面</title>
</head>

<body>
    <div class="container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">编辑学生</h3>
            </div>

            <div class="panel-body">
                <form method="post" action="/updateStudent" role="form">
                    <table class="table">
                        <tr>
                            <td>学号:</td>
                            <td>
                                <input type="text" name="student_id" id="student_id" value="${student.student_id}" placeholder="请输入学号">
                            </td>
                        </tr>
                        <tr>
                            <td>姓名：</td>
                            <td>
                                <input type="text" name="name" id="name" value="${student.name}" placeholder="请在这里输入名字">
                            </td>
                        </tr>
                        <tr>
                            <td>年龄：</td>
                            <td>
                                <input type="text" name="age" id="age" value="${student.age}" placeholder="请在这里输入年龄">
                            </td>
                        </tr>
                        <tr>
                            <td>性别:</td>
                            <td>
                                <input type="radio" <c:if test="${student.sex == '男'}">checked</c:if> class="radio radio-inline" name="sex" value="男">男
                                <input type="radio" <c:if test="${student.sex == '女'}">checked</c:if> class="radio radio-inline" name="sex" value="女">女
                            </td>
                        </tr>
                        <tr>
                            <td>出生日期:</td>
                            <td>
                                <input type="date" name="birthday" id="birthday" value="${student.birthday}" placeholder="请输入出生日期">
                            </td>
                        </tr>
                        <tr class="submitTR">
                            <td colspan="2" align="center">
                                <input type="hidden" name="id" value="${student.id}">
                                <button type="submit" class="btn btn-success">提交</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

</body>