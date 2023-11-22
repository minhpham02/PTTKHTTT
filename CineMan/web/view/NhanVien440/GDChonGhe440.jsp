<%@page import="dao.Ghe440DAO"%>
<%@page import="model.Ghe440"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    if(request.getMethod().equalsIgnoreCase("post")){
        HttpSession httpSession = request.getSession();
        String gioChieu1 = request.getParameter("gioChieu");
        String ngayChieu1 = request.getParameter("ngayChieu");
               
        Ghe440DAO ghe440DAO = new Ghe440DAO();
        String idLichChieu = ghe440DAO.getIdLichChieu(ngayChieu1, gioChieu1);
        httpSession.setAttribute("idLichChieu", idLichChieu);
        if(idLichChieu == null){
            response.sendRedirect("GDSuatChieu440.jsp");
        }else{
            List<Ghe440> ghe440 = ghe440DAO.getGhe(idLichChieu);
            
            request.setAttribute("gheNgoi", ghe440);
        }
    }
%>


<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Chỗ Ngồi</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .screen-container {
            perspective: 1000px;
            margin: 40px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .screen {
            background: rgb(71, 165, 209);
            height: 70px;
            width: 70%;
            margin: 15px 0;
            transform: rotateX(-45deg);
            box-shadow: 0 3px 10px rgba(19, 120, 145, 0.7);
        }

        input.largerCheckbox {
            width: 80px;
            height: 80px;
            cursor: pointer;
        }

        /* Tùy chỉnh CSS cho các label và checkbox */
        label.checkbox-label {
            display: inline-block;
            margin-right: 20px;
            font-size: 16px;
        }

        .form-group {
            margin-top: 20px;
        }
        
        .form-group-khtt {
            display: none; /* Ẩn ban đầu */
        }
    </style>
</head>

<body>
    <!-- Navbar (Thêm mã HTML cho thanh điều hướng ở đây nếu cần) -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"></a>
    </nav>

    <div class="container mt-4">
        <h1>Chọn Chỗ Ngồi</h1>
    </div>

    <div class="screen-container">
        <h2>Màn Hình</h2>
        <div class="screen"></div>
        <%
            String ngayChieu =  request.getParameter("ngayChieu");
            String gioChieu = request.getParameter("gioChieu");
            String idPhongChieu = request.getParameter("idPhongChieu");
            String giaVe = request.getParameter("giaVe");

            session.setAttribute("ngayChieu", ngayChieu);
            session.setAttribute("gioChieu", gioChieu);
            session.setAttribute("idPhongChieu", idPhongChieu);
            session.setAttribute("giaVe", giaVe);
        %>

        <div class="container">
            <form action="GDVeXemPhim440.jsp" method="post">
                 <div class="form-group">
                    <label for="maKHTT">Mã Khách Hàng Thân Thiết (KHTT):</label>
                    <input type="text" id="maKHTT" name="maKHTT" class="form-control">
                </div>
                <div class="form-group">
                    <label for="selectedSeats">Chọn Ghế:</label>
                    <br>
                    <c:forEach items="${gheNgoi}" var="ghe">
                        <label class="checkbox-label">
                            <c:choose>
                                <c:when test="${ghe.trangThai == 1}">
                                    <input type="checkbox" name="ghe" value="${ghe.maGhe}" disabled>
                                    ${ghe.maGhe} (đã hết)
                                </c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="ghe" value="${ghe.maGhe}">
                                    ${ghe.maGhe}
                                </c:otherwise>
                            </c:choose>
                        </label>
                    </c:forEach>
                </div>
                <br>
                <input type="submit" class="btn btn-danger btn-block" value="Tiếp Tục">
            </form>
        </div>
    </div>
</body>
</html>
