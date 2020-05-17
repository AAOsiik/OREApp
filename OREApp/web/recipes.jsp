<%-- 
    Document   : recipes
    Created on : 23.04.2020, 11:43:28
    Author     : Alexander
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>OREApp - Recipes</title>
        <!--jQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body>
        <!--<div class="background-image"></div>-->
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <div class="col-md-8 marginCenter">
            <legend>Find the perfect recipe for you!</legend>
            <c:forEach var="r" items="${RECIPES}">
                <form action="RecipeDetailController" method="GET">
                    <div class="row py-4 px-2" style="background-color: rgba(236, 235, 230, 0.9);border-bottom: 1px solid black;border-radius: 10px;">
                        <div class="col-md-6">
                            <div class="thumbnail">
                                <img class="img-fluid img-thumbnail"  src="FileServlet?path=${r.picture}" alt="${r.title}" style="max-height: 250px;">
                            </div>
                        </div>
                        <div class="col-md-6 px-3">
                            <div class="caption">
                                <h4><a href="#">${r.title}</a></h4>
                                <h5>by <a href="#" style="color: cornflowerblue">${r.username}</a></h5>
                                <p class="truncate" style="width:100%">${r.description}</p>
                                <h5 class="text-right p-1">Difficulty: ${r.difficulty}</h5>
                            </div>
                            <div class="space-ten"></div>
                            <div class="btn-ground text-center mt-5">
                                <input type="submit" class="btn btn-info showButton" value="Show Recipe">
                                <input type="hidden" value="${r.id}" name="recipeID">
                            </div>
                            <div class="space-ten"></div>
                        </div>
                    </div>
                    <div class="space-ten"></div>
                </form>
            </c:forEach>
        </div>

    </body>
</html>
