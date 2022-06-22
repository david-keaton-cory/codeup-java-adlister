<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 8/30/18
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="View Member Profile" />
  </jsp:include>
  <link rel="stylesheet" type="text/css" href="../../css/main.css">
  <link rel="stylesheet" href="../css/viewOtherProfile.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container-fluid">
  <h1 class="welcome-msg"><strong>View Profile:</strong> ${user.username}</h1>
  <div class="row">
    <div class="col-12">
      <div class="card mb-5" style="width: 25rem;">
        <div class="card-body account-info">
          <h5 class="card-title"><i class="fas fa-user-circle fa-2x"></i>Account Details:</h5>
          <p class="card-text">Member since: ${user.date}</p>
          <p class="card-text">Number of posted ads: ${numberOfAds}</p>
        </div>
      </div>
      <%-- Other Member's Ads--%>
      <h2 class="ads-title text-center" style="color: white;">${user.username}'s Ads</h2>
      <hr>
      <div class="container">
        <c:forEach var="ad" items="${userAds}">
          <a href="/viewAd?adId=${ad.id}">
            <div style="border: 1px solid grey; display: block; float: left; width: 30%; margin-right: 10px; height: 250px;" class="cards col-md-4 mb-3">
              <h3>${ad.title}</h3>
              <p class="card-text">${ad.description}</p>
              <p class="card-text"><small class="text-muted">posted on: ${ad.dateMade}</small></p>
              <p class="card-text"><small class="text-muted">categories: ${ad.catString}</small></p>
            </div>
          </a>
        </c:forEach>
      </div>
    </div>
  </div>
<%--  <jsp:include page="/WEB-INF/partials/js-script.jsp" />--%>
<%--  <jsp:include page="/WEB-INF/partials/footer.jsp" />--%>
</div>

</body>
</html>
