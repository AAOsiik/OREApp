<%-- 
    Document   : index
    Created on : 23-mar-2020, 14.00.04
    Author     : TEAM LEADER Alex & Kri 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>OREApp - Online Recipe Exchange Application</title>

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>
        <c:if test="${not empty sessionScope.user}">
            <div class="col-md-12 center">
                <label>Welcome back, ${user}!</label>
            </div>
        </c:if>

        <div class="row searchBar">
            <div class="col-md-6 marginCenter">
                <!-- Search form -->
                <form class="form-inline" action="SearchController" method="GET">
                    <input name="search" id="search" class="form-control form-control-sm marginCenter" type="text" placeholder="Search" aria-label="Search"style="width: 100%;">
                </form>
            </div>
        </div>

</body>
</html>