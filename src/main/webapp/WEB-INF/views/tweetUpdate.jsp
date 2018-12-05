<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
<div class="container col-sm-6">
    <h3 class="header">Edytuj tweeta</h3>
    <form:form method="post" modelAttribute="tweet">
        <div class="container">

            <div class="card">
                <div class="card-body">

                    <div class="form-group">
                        <label for="titleId">Tytuł:</label>
                        <form:input type="text" path="title" id="titleId" class="form-control"/>
                        <form:errors path="title" element="div" cssClass="error"/>
                    </div>

                    <div class="form-group">
                        <label for="tweetTextId">Treść:</label>
                        <form:textarea path="tweetText" id="tweetTextId" class="form-control"/>
                        <form:errors path="tweetText" element="div" cssClass="error"/>
                    </div>

                    <form:hidden path="creationDate"/>
                    <form:errors path="creationDate" element="div" cssClass="error"/>


                    <form:input type="hidden" value="${user.id}" path="user.id" id="userId"/>
                    <form:errors path="user.id" element="div" cssClass="error"/>


                    <input type="submit" class="btn btn-primary" value="Save">
                </div>
            </div>


        </div>
    </form:form>
</div>
</body>
</html>
