<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 8/30/18
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Your Profile" />
  </jsp:include>
  <link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<c:if test="${created == true}" >
  <h1 style="color: white; text-align: center;">Your ad was successfully created!</h1>

</c:if>
<c:if test="${edited == true}" >
  <h1 style="color: white; text-align: center;">Your ad was successfully updated!</h1>

</c:if>
<c:if test="${deleted == true}" >
  <h1 style="color: white; text-align: center;">Your ad was successfully deleted!</h1>

</c:if>


<div style="text-align: center">
  <div>
    <img src="../../img/nicholas.png" class="nicholas">
  </div>
  <a href="/profile" style="color: white">Go back to profile</a>
  <span style="color: white"> | </span>
  <a href="/home" style="color: white">Go to home page</a>
</div>
</body>
</html>