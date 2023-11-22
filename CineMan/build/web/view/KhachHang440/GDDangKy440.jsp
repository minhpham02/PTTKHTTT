<%-- 
    Document   : GDDangKy440
    Created on : Oct 24, 2023, 4:35:12 PM
    Author     : ADMIN
--%>

<%@page import="java.util.Random"%>
<%@page import="model.NguoiDung440"%>
<%@page import="dao.NguoiDung440DAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cine Management - Đăng Ký</title>
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
            input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
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
            <h1>Đăng Ký</h1>
            <form action="GDDangKy440" method="post">
            <!--    <input type="text" name="id" placeholder="Id" /><br> -->
                <input type="text" name="tenNguoiDung" placeholder="Tên người dùng" /><br>
                <input type="email" name="email" placeholder="Email" /><br>
                <input type="tel" name="soDienThoai" placeholder="Số điện thoại" /><br>
                <input type="text" name="tenTaiKhoan" placeholder="Tên tài khoản" /><br>
                <input type="password" name="matKhau" placeholder="Mật khẩu" /><br>
                <input type="submit" value="Đăng Ký" />
            </form>
        </div>
    </body>
</html>

<%
    if(request.getMethod().equalsIgnoreCase("POST")){
        Random random = new Random();

        // Sinh số nguyên ngẫu nhiên trong khoảng từ 0 đến 100
        int randomNumber = random.nextInt(101);
        String id = "KH" +  randomNumber;
        String tenNguoiDung = request.getParameter("tenNguoiDung");
        String email = request.getParameter("email");
        String soDienThoai = request.getParameter("soDienThoai");
        String tenTaiKhoan = request.getParameter("tenTaiKhoan");
        String matKhau = request.getParameter("matKhau");
        
        NguoiDung440DAO nguoiDung440DAO = new NguoiDung440DAO();
        NguoiDung440 nguoiDung440 = new NguoiDung440(id, tenNguoiDung, email, soDienThoai, tenTaiKhoan, matKhau);
        nguoiDung440DAO.luuDK(nguoiDung440);
        
        request.setAttribute("successMessage", "Đăng ký thành công! Chào mừng bạn đến với ứng dụng.");
        request.getRequestDispatcher("GDChinhKH440.jsp").forward(request, response);
    }
%>    