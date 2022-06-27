<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="css/adlister.css">
<nav id="mainNav" class="navbar navbar-expand-lg red-hover">
    <div class="container-fluid">
<%--        <img src="../../img/navGee.png" width="60" height="60" class="d-inline-block align-top" alt="">--%>
        <%--<a id="navCoName" class="navbar-brand w-text" href="#"> regslist</a>--%>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link red-hover w-text" href="../"><i class="fa fa-fw fa-home"></i> Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <span class="navbar-text">
            <ul class="navbar-nav mr-auto">
                <form  class="search-nav form-inline my-2 my-lg-0" action="/searchAds" method="POST">
                    <input class="btn btn-outline-danger my-2 my-sm-0" type='submit'><a href="/searchAds"></a>
                    <input class="form-control mr-sm-2" type="search" placeholder="Search for ad" aria-label="Search" name="keyword">
                </form>

            <c:choose>
                <c:when test="${sessionScope.user != null}">
<%--                     <li class="nav-item active">--%>
<%--                        <a class="nav-link red-hover w-text" href="/ads/create"><i class="fab fa-buysellads"></i> Create Ad <span class="sr-only">(current)</span></a>--%>
<%--                    </li>--%>
                    <li class="nav-item active">
                        <a class="nav-link red-hover w-text" href="/profile"><i class="fa fa-fw fa-user"></i> Profile <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link red-hover w-text" href="/logout"><i class="fas fa-sign-out-alt"></i> Logout <span class="sr-only">(current)</span></a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item active">
                        <a class="nav-link red-hover w-text" href="/login"><i class="fa fa-edit mr-1"></i> Login <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link red-hover w-text" href="/register"><i class="fa fa-list" aria-hidden="true"></i> Register <span class="sr-only">(current)</span></a>
                    </li>
                </c:otherwise>
            </c:choose>
            </ul>
        </span>
        </div>
    </div>
</nav>