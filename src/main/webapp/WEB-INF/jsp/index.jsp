<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="clients" scope="request" type="java.util.List"/>
<jsp:useBean id="message" scope="request" class="java.lang.String"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Clients</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/css/index.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <h3>Клиенты</h3>
    <div>
        <p class="message" id="message">${message}</p>
    </div>
    <c:if test="${clients != null}">
        <c:if test="${clients.size() == 0}">Список клиентов пуст</c:if>
        <c:forEach items="${clients}" var="client">
            <ul class="nav justify-content-left">
                <li class="nav-item">
                    <a class="nav-link" href="${root}/client/${client.id}">
                            ${client.id} ${client.lastName} ${client.firstName}</a>
                </li>
            </ul>
        </c:forEach>
    </c:if>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
