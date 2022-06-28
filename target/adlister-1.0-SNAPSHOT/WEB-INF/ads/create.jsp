<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
    <link rel="stylesheet" type="text/css" href="../css/main.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="text-center container w-text pt-4">
    <h1>Create a new Ad:</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="sports1" value="Sports1">
            <label class="form-check-label" for="sports1">Sports</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="camping2" value="Camping2">
            <label class="form-check-label" for="camping2">Camping</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="computers3" value="Computers3">
            <label class="form-check-label" for="computers3">Computers</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="phones4" value="Phones4">
            <label class="form-check-label" for="phones4">Phones</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="jobs5" value="Jobs5">
            <label class="form-check-label" for="jobs5">Jobs</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="clothing6" value="Clothing6">
            <label class="form-check-label" for="clothing6">Clothing</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="cars7" value="Cars7">
            <label class="form-check-label" for="cars7">Cars</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="furniture8" value="Furniture8">
            <label class="form-check-label" for="furniture8">Furniture</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" name="category" type="checkbox" id="other9" value="Other9">
            <label class="form-check-label" for="other9">Other</label>
        </div>

        <input type="submit" class="btn btn-block btn-danger">
    </form>
</div>
</body>
</html>