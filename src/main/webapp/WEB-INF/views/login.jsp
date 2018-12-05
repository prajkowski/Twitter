<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
</head>
<body>
<form:form method="post" modelAttribute="user">

    <div class="container col-sm-4">

        <h3 class="header">Logowanie</h3>

        <div class="card">
            <div class="card-body">

                <div class="form-group">
                    <label for="loginId">Login:</label>
                    <form:input type="text" path="login" id="loginId" class="form-control"/>
                    <form:errors path="login" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="passwordId">Password:</label>
                    <form:input type="password" path="password" id="passwordId" class="form-control"/>
                    <form:errors path="password" element="div" cssClass="error"/>
                </div>

                <c:if test="${loginFailed == true}">
                    <div class="error" style="padding-bottom: 20px">Nieprawidłowe dane</div>
                    <a href="/user/add" class="btn btn-primary">Zarejestruj</a>
                </c:if>

                <input type="submit" class="btn btn-primary" value="Login">
            </div>
        </div>

    </div>
</form:form>
</body>
</html>
