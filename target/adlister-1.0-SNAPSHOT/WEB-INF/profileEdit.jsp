<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit Your Profile" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../../css/main.css">
    <link rel="stylesheet" href="../css/profileEdit.css" >
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h3>What would you like to edit?</h3>

    <c:if test="${bothTaken == true}" >
        <p style="color:red;">Both username and email already taken</p>
    </c:if>
    <c:if test="${emailTaken == true}" >
        <p style="color:red;">Email already taken</p>
    </c:if>

    <%-- userNameUpdate  --%>
    <c:if test="${usernameTaken == true}" >
        <p style="color:red;">Username already taken</p>
    </c:if>
    <c:if test="${usernameTaken == false}" >
        <p style="color:green;">Username change successful!</p>
    </c:if>

    <%-- user email Update  --%>
    <c:if test="${emailTaken == false}" >
        <p style="color:green;">Email change successful!</p>
    </c:if>

    <form action="/profile/edit" method="post">
        <div class="form-group w-50">
            <label for="username">Current Username: ${sessionScope.user.username} </label>
            <input id="username" name="username" class="form-control" type="text" pattern="[A-Za-z0-9].{1, }" placeholder="${sessionScope.user.username}">
        </div>
        <input type="submit" class="btn btn-primary btn-block w-50">
    </form>
    <form action="/profile/edit" method="post">
        <div class="form-group w-50">
            <label for="email">Current Email: ${sessionScope.user.email} </label>
            <input id="email" name="email" class="form-control" type="text" pattern="[A-Za-z0-9].{1, }" placeholder="${sessionScope.user.email}">
        </div>
        <input type="submit" class="btn btn-primary btn-block w-50">
    </form>
    <br>
    <br>

    <%-- Password Display Messages --%>
    <c:if test="${passwordsMatch == false}" >
        <p style="color:red;">Verify current password incorrect. Please try again.</p>
    </c:if>

    <c:if test="${newPasswordMatch == false}">
        <p style="color:red;">Passwords do not match. Please try again.</p>
    </c:if>

    <c:if test="${passwordChangeSuccess == true}">
        <p style="color:green;">Password updated successfully</p>
    </c:if>

    <h3>Update Password</h3>
    <form action="/profile/edit" method="POST" >
        <div class="form-group w-50">
            <label for="password">Verify Current Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input id="newPassword" name="newPassword" class="form-control w-50" type="password" required>
        </div>
        <div class="form-group">
            <label for="confirmNewPassword">Confirm New Password</label>
            <input id="confirmNewPassword" name="confirmNewPassword" class="form-control w-50" type="password" required>
        </div>
        <input type="submit" class="btn btn-primary btn-block w-50">
    </form>
</div>
<hr>
<%-- Footer Options --%>
<div class="text-center">
    <h3>Where would you like to go next?</h3>
    <a href="/profile" class="btn profile-btn">Back to profile</a>
    <a href="/" class="btn home-btn">Go to home page</a>
</div>

<%--<jsp:include page="partials/js-script.jsp" />--%>
</div>
</body>
</html>
