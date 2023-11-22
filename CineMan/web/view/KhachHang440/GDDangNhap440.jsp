<%-- 
    Document   : GDDangNhap440
    Created on : Oct 24, 2023, 4:33:08 PM
    Author     : ADMIN
--%>
<%@page import="model.NguoiDung440"%>
<%@page import="dao.DangNhap440DAO"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cine Management - Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
        }
        form {
            text-align: center;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Đăng Nhập</h1>
        
            <input type="text" name="tenTaiKhoan" placeholder="Tên tài khoản" /><br>
            <input type="password" name="matKhau" placeholder="Mật khẩu" /><br>
            <input type="submit" value="Đăng Nhập" />
        
        <br><br>
        <form action="GDDangNhap440.jsp" method="post">
            <input type="submit" value="Đăng Ký" />
        </form>
    </div>



<%
     if(request.getMethod().equalsIgnoreCase("post")){
        response.sendRedirect("GDDangKy440.jsp");
    }
%>

</body>
</html>
