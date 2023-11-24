<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="client" scope="request" class="com.example.clients.domain.Client"/>
<jsp:useBean id="gender" scope="request" class="java.lang.String"/>
<jsp:useBean id="error" scope="request" class="java.lang.String"/>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${root}/css/client-add.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <h3>Редактирование клиента</h3>
    <form id="edit_form" action="${root}/client/${client.id}/edit" method="post" novalidate>
        <p class="error" id="error">${error}</p>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="lastNameLabel">Фамилия *</span>
            <input type="text" class="form-control" name="lastName" id="lastName" placeholder="Required" required
                   aria-label="Last name" value="${client.lastName}">
        </div>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="firstNameLabel">Имя *</span>
            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Required" required
                   aria-label="First name" value="${client.firstName}">
        </div>
        <div class="input-group input-group-sm mb-3">
            <span class="input-group-text" id="newContactLabel">Новый контакт</span>
            <input type="text" class="form-control" name="newContact" id="newContact"
                   aria-label="Input new phone number">
            <select class="form-select" id="newContactType" aria-label="Choose contact type">
                <option value="Phone">Телефон</option>
                <option value="Email">Email</option>
            </select>
            <button class="btn btn-outline-secondary" type="button" id="addContact">Добавить</button>
        </div>

        <div class="input-group input-group-sm mb-3">
            <table id="contactTable" class="table table-hover">
                <tbody id="tbodyContainer">
                <c:forEach items="${client.contacts}" var="contact" varStatus="loop">
                    <tr>
                        <td id="colContactType">${contact.contactType.toString() == "PHONE" ? "Телефон" : "Email"}</td>
                        <td id="colPhoneNum"><input type="tel" readonly name="contacts[${loop.index}].txtContent"
                                                    id="phoneNum" value="${contact.txtContent}" aria-label=""></td>
                        <td><input type="hidden" name="contacts[${loop.index}].contactType" id="contactType"
                                   value="${contact.contactType}"></td>
                        <td><input type="hidden" name="contacts[${loop.index}].id" id="contactId" value="${contact.id}">
                        </td>
                        <td id="colDelPhone">
                            <button class="btn btn-sm btn-outline-secondary" type="button" id="delPhone">x</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <input type="hidden" name="id" value="${client.id}">

        <div class="btn-group d-block mx-auto">
            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modal"
                    name="saveBtn" id="saveBtn" value="Save">Записать
            </button>
            <button type="submit" class="btn btn-outline-secondary" name="submit" id="cancel" value="Cancel">Отмена
            </button>
        </div>
        <div class="modal" id="modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Записать?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-secondary" name="submit" id="save" value="Save">
                            Записать
                        </button>
                        <button type="button" class="btn btn-outline-secondary" id="close" data-bs-dismiss="modal">
                            Закрыть
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value="/js/clientEdit.js"/>"></script>
</body>
</html>
