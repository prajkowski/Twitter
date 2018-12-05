<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script>
        function confirmDelete(id) {
            if (confirm("Czy na pewno usunąć tweeta?")) {
                window.location.href = "/tweet/delete/" + id;
            }
        }
    </script>
</head>
<body>

<c:if test="${loggedIn == true}">

<nav class="navbar nav justify-content-end" style="background-color: white">
    <ul class="nav justify-content-end">
        <li class="nav-item">
            <a href="/tweet/add" class="btn btn-primary">Dodaj tweeta</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="/user/update/${user.id}">Profil</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/logout">Wyloguj się</a>
        </li>
    </ul>
</nav>
<div class="container col-sm-3" align="center">
    <img src="${user.imageUrl}" width="200" height="200"
         class="rounded-circle m-3">
    <h4>${user.firstName} ${user.lastName}</h4>
</div>
<div class="container">
    <c:forEach items="${tweets}" var="tweet">
        <div class="col-sm-6 " style="margin: auto">
            <div class="card">
                <h5 class="card-header">${tweet.title}
                    <a href="/tweet/update/${tweet.id}" class="btn btn-link">Edytuj</a>
                    <a onclick="confirmDelete(${tweet.id})" href="#" class="btn btn-link">Usuń</a>
                </h5>
                <div class="card-body">
                    <p class="card-text">${tweet.tweetText}</p>
                    <p class="card-text">
                        <small>${tweet.creationDate}</small>
                    </p>
                    <a href="#" class="btn btn-primary">Skomentuj</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

</c:if>

</body>
</html>
