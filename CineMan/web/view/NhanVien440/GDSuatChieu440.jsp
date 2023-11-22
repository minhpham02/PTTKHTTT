<%-- 
    Document   : GDBanVe440
    Created on : Oct 30, 2023, 9:37:57 AM
    Author     : ADMIN
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="dao.LichChieu440DAO"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.LichChieu440"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
        if(request.getMethod().equalsIgnoreCase("POST")){
            LocalDate today = LocalDate.now();
            ArrayList<LocalDate> listDates = new ArrayList<>();
            listDates.add(today);
            //Lấy ra 10 ngày tính từ hôm nay
            for(int i=1;i<=9;i++){
                today = today.plusDays(1);
                listDates.add(today);
            }

            List<String> hourList = new ArrayList<>();

            SimpleDateFormat hourFormat = new SimpleDateFormat("HH:mm");

            try {
                Date startTime = hourFormat.parse("08:00");
                Date endTime = hourFormat.parse("22:00");

                while (startTime.before(endTime)) {
                    hourList.add(hourFormat.format(startTime));
                    startTime.setTime(startTime.getTime() + 60 * 60 * 1000); // Thêm 1 giờ
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            String idP = request.getParameter("pid");
            LichChieu440DAO lichChieu440DAO = new LichChieu440DAO();
            List<LichChieu440> list = lichChieu440DAO.getLichChieu(idP);

            request.setAttribute("listLC", list);
            request.setAttribute("listG", hourList);
            request.setAttribute("listN", listDates);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chọn suất chiếu</title>
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
        .btn {
            padding: 10px 20px;
            background: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
        <h1>Bán Vé</h1>
        <form action="GDChonGhe440.jsp" method="post">
            <%String idPhim = request.getParameter("pid");
            String tenPhim = request.getParameter("tenPhim");
            session.setAttribute("pid", idPhim);
            session.setAttribute("tenPhim", tenPhim);
            %>
            <input type="hidden" name="id" value="<%= idPhim %>">
            
            <table>
                <tr>
                    <th>Id</th>
                    <th>Ngày chiếu</th>
                    <th>Giờ chiếu</th>
                    <th>Giá Vé</th>
                    <th>Mã phim</th>
                    <th>Mã phòng chiếu</th>
                </tr>
                <c:forEach items="${listLC}" var="lc">
                    <tr>
                        <td>${lc.id}</td>
                        <td>${lc.ngayChieu}</td>
                        <td>${lc.gioChieu}</td>
                        <td>${lc.giaVe}</td>
                        <td>${lc.idPhim}</td>
                        <td>${lc.idPhongChieu}</td>
                        <input type="hidden" name="idPhongChieu" value="${lc.idPhongChieu}">
                        <input type="hidden" name="giaVe" value="${lc.giaVe}">
                    </tr>
                </c:forEach>
            </table>
            
            <div class="form-group">
                <label for="ngayChieu">Chọn Ngày Chiếu:</label>
                <select name="ngayChieu" class="select">
                    <c:forEach items="${listN}" var="n">
                        <option value="${n}">${n}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="form-group">
                <label for="gioChieu">Chọn Giờ Chiếu:</label>
                <select name="gioChieu" class="select">
                    <c:forEach items="${listG}" var="g">
                        <option value="${g}">${g}</option>
                    </c:forEach>
                </select>
            </div>
            
            
            <button class="btn" type="submit">Chọn</button>  
        </form>        
    </div>
</body>
</html>

