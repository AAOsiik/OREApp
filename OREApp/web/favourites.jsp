<%-- 
    Document   : favourites
    Created on : 17-mag-2020, 23.02.50
    Author     : Kri
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
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="container profileBox">
                    <h1>Favourite Recipes<span class="entypo-heart"></span></h1>
                        <c:forEach var="f" items="${FAVS}">
                        <form action="DeleteFavouriteController" method="POST">
                            <div class="row mt-3">
                                <div class="col-md-8 text-center">
                                    <h4><a href="RecipeDetailController?recipeID=${f.id}">${f.title}</a></h4>
                                </div>
                                <div class="col-md-4">
                                    <input type="submit" class="btn btn-danger" value="Remove">
                                    <input type="hidden" value="${f.id}" name="recipeID">
                                </div>
                            </div>
                        </form>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <%@include file="/WEB-INF/jspf/noSessionError.jspf"%>
            </c:otherwise>
        </c:choose>

    </body>
</html>