<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<link rel="stylesheet" type="text/css" href="../css/main.css">--%>

<%--<head>--%>
<%--    <jsp:include page="/WEB-INF/partials/head.jsp">--%>
<%--        <jsp:param name="title" value="View Ads" />--%>
<%--        <jsp:param name="search" value="Search ads"/>--%>
<%--    </jsp:include>--%>
<%--    <title>Search Ads</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;search by category&ndash;%&gt;--%>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-md-12">--%>
<%--            <div class="panel panel-default">--%>
<%--                <div class="panel-heading">--%>
<%--                    <h3 class="panel-title">Search Ads</h3>--%>
<%--                </div>--%>
<%--                <div class="panel-body">--%>
<%--                    <form action="search" method="get">--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="price">Price</label>--%>
<%--                            <input type="text" name="price" id="price" class="form-control">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="location">Location</label>--%>
<%--                            <input type="text" name="location" id="location" class="form-control">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="description">Description</label>--%>
<%--                            <input type="text" name="description" id="description" class="form-control">--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label for="title">Title</label>--%>
<%--                            <input type="text" name="title" id="title" class="form-control">--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>



<%--</body>--%>
<%--</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <title>Search</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="row no-gutters">
    <div  class="col-2 sticky-top pt-4 h-100">
        <div id="sideImg">
            <nav id="side-nav" class="nav flex-column">
                <a class="w-text nav-link active pl-5" href="/category?value=0">All</a>
                <a class="w-text nav-link pl-5" href="/category?value=1"><i class="fa fa-bicycle"></i> Sports</a>
                <a class="w-text nav-link pl-5" href="/category?value=2"><i class="fa fa-tree"></i> Camping</a>
                <a class="w-text nav-link pl-5" href="/category?value=3"><i class="fa fa-laptop"></i> Computers</a>
                <a class="w-text nav-link pl-5" href="/category?value=4"><i class="fa fa-mobile"></i> Phones</a>
                <a class="w-text nav-link pl-5" href="/category?value=5"><i class="fa fa-briefcase"></i> Jobs</a>
                <a class="w-text nav-link pl-5" href="/category?value=6"><i class="fa fa-shopping-bag"></i> Clothing</a>
                <a class="w-text nav-link pl-5" href="/category?value=7"><i class="fa fa-car"></i> Cars</a>
                <a class="w-text nav-link pl-5" href="/category?value=8"><i class="fa fa-bed"></i> Furniture</a>
                <a class="w-text nav-link pl-5" href="/category?value=9">Other</a>
            </nav>
        </div>
    </div>

    <div class="col-10">
        <div class="container pb-5 pt-5">
            <h1 class="w-text">All the category of Ads</h1>
            <c:if test="${noResults == true}" >
                <p class="w-text">We couldn't find any results for <c:out value="${searchTerm}"/></p>
            </c:if>
            <c:if test="${noResults == false}" >
                <h3 class="w-text">All ads related to: <c:out value="${searchTerm}" /></h3>
                <c:forEach var="ad" items="${ads}" >
                    <a class="blk" href="/viewAd?adId=${ad.id}">
                        <div class="cards mr-3 mb-3">
                            <h2>${ad.title}</h2>
                            <p>${ad.description}</p>
                            <p>Created On: ${ad.dateMade}</p>
                            <p>Categories: ${ad.catString}</p>
                        </div>
                    </a>
                </c:forEach>
            </c:if>
        </div>
<%--        <jsp:include page="/WEB-INF/partials/js-script.jsp" />--%>
<%--        <jsp:include page="/WEB-INF/partials/footer.jsp" />--%>
    </div>
</div>
</body>
</html>