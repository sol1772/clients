<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="client" scope="request" class="com.example.clients.domain.Client"/>
<jsp:useBean id="username" scope="session" class="java.lang.String"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Common navigation bar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/css/header.css"/>
    <link id="contextPathHolder" data-contextPath="${root}"/>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-light" id="navbar_search">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                <li class='nav-item dropdown'>
                    <a class='nav-link dropdown-toggle' href='#' id='navbarDropdownAbout' role='button'
                       data-bs-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>Menu</a>
                    <div class='dropdown-menu' aria-labelledby='navbarDropdownAbout'>
                        <a class="nav-link" href="${root}/">Список клиентов</a>
                        <a class="nav-link" href="${root}/client/add">Добавление нового клиента</a>
                        <c:if test="${client.id != 0}">
                            <a class="nav-link" href="${root}/client/${client.id}/edit">Редактирование клиента</a>
                        </c:if>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
