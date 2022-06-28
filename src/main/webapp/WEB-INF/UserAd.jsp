<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update ad" />
    </jsp:include>
    <title>Edit Ads</title>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="row no-gutters">
    <div class="col-2 h-100 pt-4 sticky-top">
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
        <div class="container w-text pt-4">
            <h2 class="w-text">Edit ad fields: </h2>

            <form action="/editAd" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <h3>Title</h3>
                        <textarea class="form-control" name="title" rows="5" cols="50">${ad.title}</textarea>
                        <h3 class="pt-3">Description:</h3>
                        <textarea class="form-control" name="description" rows="15" cols="50">${ad.description}</textarea>
                    </div>

                    <div class="form-group col-md-6 pl-4">
                        <p>Date created: ${ad.dateMade}</p>
                        <p>Categories listed: ${ad.catString}</p>
                        <button class="btn btn-danger" name="adId" value="${ad.id}">Submit Changes</button>
                    </div>
                </div>
            </form>

        </div>
<%--        <jsp:include page="/WEB-INF/partials/js-script.jsp" />--%>
<%--        <jsp:include page="/WEB-INF/partials/footer.jsp" />--%>
    </div>
</div>

</body>
</html>
