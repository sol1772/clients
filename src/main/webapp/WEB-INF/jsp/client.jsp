<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="client" scope="request" class="com.example.clients.domain.Client"/>
<jsp:useBean id="contacts" scope="request" type="java.util.List"/>
<jsp:useBean id="error" scope="request" class="java.lang.String"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client info</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/css/client.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <h3>Информация о клиенте</h3>
    <p class="error" id="error">${error}</p>
    <div class="head">
        <div class="head-cont">
            <div class="dropdown">
                <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button"
                        id="dropdownMenuButtonContacts"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    Выбрать контакты
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="${root}/client/${client.id}">Все</a></li>
                    <li><a class="dropdown-item" href="${root}/client/${client.id}?t=PHONE">Телефоны</a></li>
                    <li><a class="dropdown-item" href="${root}/client/${client.id}?t=EMAIL">Email</a></li>
                </ul>
            </div>
            <br>
            <table class="table table-sm" id="tbl_client">
                <caption></caption>
                <tr>
                    <td id="colLastName"><i>Фамилия</i></td>
                    <td>${client.lastName}</td>
                </tr>
                <tr>
                    <td id="colFirstName"><i>Имя</i></td>
                    <td>${client.firstName}</td>
                </tr>
                <c:forEach items="${contacts}" var="contact">
                    <c:if test="${contact.contactType.toString().equals('EMAIL')}">
                        <tr>
                            <td id="colEmail"><i>E-mail</i></td>
                            <td>${contact.txtContent}</td>
                        </tr>
                    </c:if>
                    <c:if test="${contact.contactType.toString().equals('PHONE')}">
                        <tr>
                            <td id="colPhone"><i>Телефон</i></td>
                            <td>${contact.txtContent}</td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
