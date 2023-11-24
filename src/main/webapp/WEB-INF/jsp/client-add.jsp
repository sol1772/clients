<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="firstName" scope="request" class="java.lang.String"/>
<jsp:useBean id="lastName" scope="request" class="java.lang.String"/>
<jsp:useBean id="email" scope="request" class="java.lang.String"/>
<jsp:useBean id="phone" scope="request" class="java.lang.String"/>
<jsp:useBean id="error" scope="request" class="java.lang.String"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Account registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/client-add.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <h3>Добавление клиента</h3>
    <form id="reg_form" action="${root}/client/add" method="post" novalidate>
        <p class="error" id="error">${error}</p>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="lastNameLabel">Фамилия *</span>
            <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Required" required
                   aria-label="Last name" value="${lastName}">
        </div>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="firstNameLabel">Имя *</span>
            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Required" required
                   aria-label="First name" value="${firstName}">
        </div>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="emailLabel">E-mail</span>
            <input type="text" class="form-control" name="email" id="email" aria-label="E-mail" value="${email}">
        </div>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="workPhoneLabel">Телефон</span>
            <input type="text" class="form-control" name="phone" id=phone"" aria-label="Phone" value="${phone}">
        </div>
        <div class="btn-group d-block mx-auto">
            <button class="btn btn-outline-secondary" name="submit" id="register" value="Register">Добавить</button>
            <button class="btn btn-outline-secondary" name="submit" id="cancel" value="Cancel">Отмена</button>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
