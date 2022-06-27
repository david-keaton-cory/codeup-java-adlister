<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="css/adlister.css">
</head>
<body>
<header>
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h1 id="main-header"></h1>
            <h4 id="main-header-info"></h4>
        </div>
    </div>
</header>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="row">
    <div class="col-12">
    <form class="" action="/ads" method="GET">
        <a class="home-list red-hover w-text" href="/category?value=0">>> VIEW ALL RECENT ADS </a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-columns-reverse" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M0 .5A.5.5 0 0 1 .5 0h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 .5Zm4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10A.5.5 0 0 1 4 .5Zm-4 2A.5.5 0 0 1 .5 2h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 4h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 8h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5Z"></path>
    </svg>
    </form>
    <div class="scrollBx">
        <c:forEach var="ad" items="${all}">
            <a class="blk" href="/viewAd?adId=${ad.id}" class="dark">
                <div class="cards mr-2">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <br>
                    <p>Created by: ${ad.username} on, ${ad.dateMade} </p>
                </div>
            </a>
        </c:forEach>
    </div>

    <form class="" action="/category" method="GET">
        <a class="home-list red-hover w-text" href="/category?value=7">>> CARS </a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-compass-fill" viewBox="0 0 16 16">
        <path d="M15.5 8.516a7.5 7.5 0 1 1-9.462-7.24A1 1 0 0 1 7 0h2a1 1 0 0 1 .962 1.276 7.503 7.503 0 0 1 5.538 7.24zm-3.61-3.905L6.94 7.439 4.11 12.39l4.95-2.828 2.828-4.95z"></path>
    </svg>
    </form>
    <div class="scrollBx">
        <c:forEach var="ad" items="${cars}">
            <a class="blk" href="/viewAd?adId=${ad.id}">
                <div class="cards mr-2">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <br>
                    <p>Created by: ${ad.username} on, ${ad.dateMade} </p>
                </div>
            </a>
        </c:forEach>
    </div>

    <form class="" action="/category" method="GET">
        <a class="home-list red-hover w-text" href="/category?value=3">>> COMPUTERS </a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pc-display-horizontal" viewBox="0 0 16 16">
        <path d="M1.5 0A1.5 1.5 0 0 0 0 1.5v7A1.5 1.5 0 0 0 1.5 10H6v1H1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5v-1h4.5A1.5 1.5 0 0 0 16 8.5v-7A1.5 1.5 0 0 0 14.5 0h-13Zm0 1h13a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-7a.5.5 0 0 1 .5-.5ZM12 12.5a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0Zm2 0a.5.5 0 1 1 1 0 .5.5 0 0 1-1 0ZM1.5 12h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1ZM1 14.25a.25.25 0 0 1 .25-.25h5.5a.25.25 0 1 1 0 .5h-5.5a.25.25 0 0 1-.25-.25Z"></path>
    </svg>
    </form>
    <div class="scrollBx">
        <c:forEach var="ad" items="${computers}">
            <a class="blk" href="/viewAd?adId=${ad.id}">
                <div class="cards mr-2">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <br>
                    <p>Created by: ${ad.username} on, ${ad.dateMade} </p>
                </div>
            </a>
        </c:forEach>
    </div>

    <form class="" action="/category" method="GET">
        <a class="home-list red-hover w-text" href="/category?value=5">>> JOBS </a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-person-fill" viewBox="0 0 16 16">
        <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"></path>
    </svg>
    </form>
    <div class="scrollBx">
        <c:forEach var="ad" items="${jobs}">
            <a class="blk" href="/viewAd?adId=${ad.id}">
                <div class="cards mr-2">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <br>
                    <p>Created by: ${ad.username} on, ${ad.dateMade} </p>
                </div>
            </a>
        </c:forEach>
    </div>

    <form class="" action="/category" method="GET">
        <a class="home-list red-hover w-text" href="/category?value=8">>> FURNITURE </a><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"></path>
        <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"></path>
    </svg>
    </form>
    <div class="scrollBx">
        <c:forEach var="ad" items="${furniture}">
            <a class="blk" href="/viewAd?adId=${ad.id}">
                <div class="cards mr-2">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p>Categories: ${ad.catString}</p>
                    <br>
                    <p>Created by: ${ad.username} on, ${ad.dateMade} </p>
                </div>
            </a>
        </c:forEach>
    </div>
    </div>

    </div>
    <div id="register" class="col-12 card">
        <div class="card-body reg">
            <h5 class="card-title font-weight-bold">Not a member yet?</h5>
            <p class="card-text">Don't shop or list your valuable items at those other sketchy adlisters, sign up with Gregslist todayyy!</p>
            <form action="/register" method="GET">
                <a href="/register" class="btn btn-primary text-light blk" style="background:cornflowerblue">Register</a>
            </form>
        </div>
    </div>
</div>

<%-- Jquery Here: --%>
<script type="text/javascript" src="js/jquery-2.2.4.js"></script>
<%-- Inline Custom JS Script Here: --%>
<script>
    function changeHeaderText () {
        $('#main-header').html('Welcome to Gregslist!');
        $('#main-header-info').html('Search ads or post ads from a wide range of categories!');

        setInterval(function () {
            $('#main-header').html('Personal Trainers');
            $('#main-header-info').html('Link up with a personal trainer with unique styles.');
        }, 8000);

        setInterval(function () {
            $('#main-header').html('Looking for Camping Gear?');
            $('#main-header-info').html('Browse ads for great deals on camping equipment!');
        }, 12000);

        setInterval(function () {
            $('#main-header').html('Help Wanted');
            $('#main-header-info').html('Search help wanted ads posted by companies hiring in your area.');
        }, 16000);

        setInterval(function () {
            $('#main-header').html('Need a New Whip?');
            $('#main-header-info').html('Cars at great prices are constantly being posted!');
        }, 20000);
    }
    changeHeaderText();

</script>

    <%-- ALL OTHER PAGES NEED THIS TAG--%>
<%--    <jsp:include page="WEB-INF/partials/js-script.jsp" />--%>
<%--    <jsp:include page="/WEB-INF/partials/footer.jsp" />--%>
</div>
</body>
</html>