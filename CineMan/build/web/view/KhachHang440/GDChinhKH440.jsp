<!-- Trong JSP -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thông báo đăng ký</title>
</head>
<body>

<c:if test="${not empty successMessage}">
    <div style="color: green;">
        <strong>${successMessage}</strong>
    </div>
</c:if>

<!-- Nội dung trang JSP của bạn -->

</body>
</html>
