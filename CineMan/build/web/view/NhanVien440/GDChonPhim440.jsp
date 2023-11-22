<%-- 
    Document   : GDChonPhim440
    Created on : Oct 30, 2023, 9:32:11 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="dao.Phim440DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Phim440"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Tìm Kiếm Phim</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin: 10px 0;
        }

        input[type="text"] {
            width: 80%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            padding: 10px;
            background: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Tìm Kiếm Phim</h1>
        <div class="form-group">
            <form action="GDChonPhim440.jsp" method="get">
                <input type="text" name="tenPhim" placeholder="Nhập tên phim">
                <button class="btn" type="submit">Tìm kiếm</button>
            </form>
        </div>
<%  
    if(request.getMethod().equalsIgnoreCase("get") && request.getParameter("tenPhim") != null){
        String tenPhim = request.getParameter("tenPhim");

        Phim440DAO phim440DAO = new Phim440DAO();
        List<Phim440> list = phim440DAO.getPhim(tenPhim);

        request.setAttribute("listP", list);
    }
%>
        

        
        <table>
            <tr>
                <th>Id</th>
                <th>Tên phim</th>
                <th>Đạo diễn</th>
                <th>Thời lượng</th>
                <th>Quốc gia</th>
                <th>Chọn phim</th>
            </tr>
            <c:forEach items="${listP}" var="phim">
                <tr>
                    <td>${phim.id}</td>
                    <td>${phim.tenPhim}</td>
                    <td>${phim.daoDien}</td>
                    <td>${phim.thoiLuong}</td>
                    <td>${phim.quocGia}</td>
                    <td>
                        <form action="GDSuatChieu440.jsp" method="post">
                            <input type="hidden" name="pid" value="${phim.id}">
                            <input type="hidden" name="tenPhim" value="${phim.tenPhim}">
                            <button class="btn" type="submit">Chọn</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>

