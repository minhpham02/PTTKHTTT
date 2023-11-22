<%-- 
    Document   : GDChinhNV440
    Created on : Oct 30, 2023, 9:29:34 AM
    Author     : ADMIN
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang Chủ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
        }

        p {
            font-size: 18px;
        }

        button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Chào mừng đến với Trang Chủ</h1>

        <form action="GDChonPhim440.jsp" method="post">
                <input type="submit" value="Bán vé" />
        </form>
    </div>
    
</body>
</html>

<%
    if(request.getMethod().equalsIgnoreCase("post")){
        request.getRequestDispatcher("GDChonPhim440.jsp").forward(request, response);
    }
%>
