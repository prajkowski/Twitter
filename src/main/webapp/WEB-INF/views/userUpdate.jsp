<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: piotr
  Date: 11/28/18
  Time: 9:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<div class="container col-sm-6">
    <h3 class="header">Edytuj profil</h3>
    <form:form method="post" modelAttribute="user">
        <div class="container">

            <div class="card">
                <div class="card-body">

                    <div class="form-group">
                        <label for="firstNameId">Imię:</label>
                        <form:input type="text" path="firstName" id="firstNameId" class="form-control"/>
                        <form:errors path="firstName" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="lastNameId">Nazwisko:</label>
                        <form:input type="text" path="lastName" id="lastNameId" class="form-control"/>
                        <form:errors path="lastName" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="loginId">Login:</label>
                        <form:input type="text" path="login" id="loginId" class="form-control"/>
                        <form:errors path="login" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="passwordId">Hasło:</label>
                        <form:input type="password" path="password" id="passwordId" class="form-control"/>
                        <form:errors path="password" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="emailId">E-mail:</label>
                        <form:input type="text" path="email" id="emailId" class="form-control"/>
                        <form:errors path="email" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="imageUrlId">Link do zdjęcia profilowego:</label>
                        <form:input type="text" path="imageUrl" id="imageUrlId" class="form-control"/>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Save">
                </div>
            </div>


        </div>
    </form:form>
</div>
</body>
</html>
