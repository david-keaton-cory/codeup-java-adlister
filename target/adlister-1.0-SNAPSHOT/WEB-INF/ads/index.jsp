<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>


    <c:forEach var="ad" items="${ads}">
        <a href="/viewAd?adId=${ad.id}">
            <div class="cardAd col-md-4" style="word-wrap: break-word;">
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
                <p>Created On: ${ad.dateMade}</p>
                <p>Categories: ${ad.catString}</p>
            </div>
        </a>
    </c:forEach>
    <div class="col-10">
        <div class="row">
            <div class="col-md-6">
                <div class="container w-text text-center">
                    <h1>${ad.title}</h1>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <span>Posted by: </span><a class="red-hover w-text" href="viewOtherProfile?username=${ad.username}">${ad.username}</a>
                    <c:if test="${belongsToUser == true}" >
                        <br>
                        <button><a href="/editAd?adId=${ad.id}">Edit Ad</a></button>
                        <button><a href="/deleteAd?adId=${ad.id}">Delete Ad</a></button>
                    </c:if>
                </div>
            </div>
            <div class="col-md-6 pr-4 pt-4">
                <%--        <div class="container">--%>
                <%--          <img src="../../img/adMap.png" width="100%" class="d-inline-block align-top" alt="Map of ad">--%>
                <%--        </div>--%>
            </div>

        </div>
</div>

</body>
</html>