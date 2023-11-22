<%-- 
    Document   : GDThongTinVe440
    Created on : Nov 7, 2023, 8:09:56 AM
    Author     : ADMIN
--%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VeXemPhim440DAO"%>
<%@page import="model.VeXemPhim440"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
        String maKHTT = request.getParameter("maKHTT");
        
        String tenPhim = (String) session.getAttribute("tenPhim"); 
        String ngayChieu = (String) session.getAttribute("ngayChieu");
        String gioChieu = (String) session.getAttribute("gioChieu");
        String idPhongChieu = (String) session.getAttribute("idPhongChieu");
        List<String> ve = (List<String>) session.getAttribute("soGhe");
        session.setAttribute("maKHTT", maKHTT);
    %>
<%
    HttpSession httpSession = request.getSession();
        
        Random random = new Random();

        
        
        String[] soGhe = request.getParameterValues("ghe");  
        
        int soVe = soGhe.length; 
        httpSession.setAttribute("soVe", soVe);
        
        List<String> listGhe = new ArrayList<>();
        for(int i = 0;i < soGhe.length;i++){
            listGhe.add(soGhe[i]);
        }
        httpSession.setAttribute("soGhe", listGhe);
        
        String idLichChieu = "L01";
        List<VeXemPhim440> list = new ArrayList<>();
        
        
        VeXemPhim440DAO veXemPhim440DAO = new VeXemPhim440DAO();
        for(int i = 0;i < listGhe.size(); i++){
            // Sinh số nguyên ngẫu nhiên trong khoảng từ 0 đến 100
            int randomNumber = random.nextInt(101);
            String id = "VXP" +  randomNumber;
            
            list.add(new VeXemPhim440(id, tenPhim, ngayChieu, gioChieu, idPhongChieu, listGhe.get(i)));
            VeXemPhim440 veXP = new VeXemPhim440(id, tenPhim, ngayChieu, gioChieu, idPhongChieu, listGhe.get(i));
            veXemPhim440DAO.luuGhe(listGhe.get(i), idLichChieu);
            veXemPhim440DAO.luuVe(veXP);
        }
        request.setAttribute("veXP", list); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Vé Đã Mua</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            background: #007BFF;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    
    <h2>Vé đã mua</h2>
    <br>
    <div>
        <table>
            <tr>
                <th>Tên Phim</th>
                <th>Ngày Chiếu</th>
                <th>Giờ Chiếu</th>
                <th>Tên Phòng</th>
                <th>Ghế</th>
            </tr>
            <c:forEach items="${veXP}" var="ve">
                <tr>
                    <td>${ve.tenPhim}</td>
                    <td>${ve.ngayChieu}</td>
                    <td>${ve.gioChieu}</td>
                    <td>${ve.tblPhongChieu440id}</td>
                    <td>${ve.maGhe}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <br>
     <form action="GDHoaDon440.jsp" method="post" target="_blank">
            <button type="submit">In Vé</button>
        </form>
</div>
<br>
</body>
</html>
