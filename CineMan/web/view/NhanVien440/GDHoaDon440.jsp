<%@page import="java.util.Random"%>
<%@page import="dao.HoaDon440DAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="model.HoaDon440"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
           String tenPhim = (String) session.getAttribute("tenPhim"); 
           String ngayChieu = (String) session.getAttribute("ngayChieu");
           String gioChieu = (String) session.getAttribute("gioChieu");
           String idPhongChieu = (String) session.getAttribute("idPhongChieu");
           int soVe = (int) session.getAttribute("soVe");
           String giaVe = (String) session.getAttribute("giaVe");
           List<String> ve = (List<String>) session.getAttribute("soGhe");
        %>
<%
    HttpSession httpSession = request.getSession();
        Random random = new Random();

        // Sinh số nguyên ngẫu nhiên trong khoảng từ 0 đến 100
        int randomNumber = random.nextInt(101);
        String id = "HD" +  randomNumber;
        
        //tính tổng tiền vé
        HoaDon440DAO hoaDon440DAO = new HoaDon440DAO();
        int tienVeDon = Integer.parseInt(giaVe);
        int tongTien = 0;
        String maKHTT = (String) httpSession.getAttribute("maKHTT");
        if(maKHTT.equals(hoaDon440DAO.ktMaKHTT(maKHTT))){
            tongTien = tienVeDon * soVe - 10000 * soVe;
        }else{
            tongTien = tienVeDon * soVe;
        }
        //lấy ngày bán vé
        LocalDate currentDate = LocalDate.now();
        Date ngayBan = java.sql.Date.valueOf(currentDate); 
        //lưu hóa đơn
        HoaDon440 hoaDon440 = new HoaDon440(id,soVe, tongTien, ngayBan, maKHTT);
        hoaDon440DAO.luuHoaDon(hoaDon440);
        
        request.setAttribute("tongTien", tongTien);
%>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thanh Toán Hóa Đơn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9; /* Màu nền của container */
            font-family: Arial, sans-serif;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        .btn-pay {
            background: #007BFF;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            display: block;
            text-align: center;
            margin: 20px auto;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="container">
        
        
        <h2>Thanh toán hóa đơn</h2>
        <table>
            <tr>
                <th>Tên Phim:</th>
                <td><%= tenPhim %></td>
            </tr>
            <tr>
                <th>Ngày Chiếu:</th>
                <td><%= ngayChieu %></td>
            </tr>
            <tr>
                <th>Giờ Chiếu:</th>
                <td><%= gioChieu %></td>
            </tr>
            <tr>
                <th>Phòng Chiếu:</th>
                <td><%= idPhongChieu %></td>
            </tr>
            <tr>
                <th>Số Vé:</th>
                <td><%= soVe %></td>
            </tr>
            <tr>
                <th>Tiền Vé Đơn:</th>
                <td><%= giaVe %></td>
            </tr>
            <tr>
                <th>Tổng Tiền:</th>
                <td>${tongTien}</td>
            </tr>
            
        </table>
        <p>Giảm 10k/vé cho một mã KHTT</p>    
        <form action="GDChonPhim440.jsp" method="post">    
            <button class="btn-pay">Thanh Toán</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
