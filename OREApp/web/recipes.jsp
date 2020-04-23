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

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>
        
        <div class="col-md-8 marginCenter">
            <legend>Find the perfect recipe for you!</legend>
            <c:forEach var="r" items="${RECIPES}">
                <div class="row" style="background-color: rgba(76, 175, 80, 0.2); padding-top: 10px; padding-bottom: 10px;">
                    <div class="col-md-6">
                        <div class="thumbnail">
                            <img class="img-thumbnail"  src="FileServlet?path=${r.picture}" alt="${r.title}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="caption">
                            <h4><a href="#">${r.title}</a></h4>
                            <p>${r.description}</p>
                        </div>
                        <div class="space-ten"></div>
                        <div class="btn-ground text-center">
                            <button type="button" class="btn btn-info"><i class="fa fa-shopping-cart"></i> Show Recipe</button>
                        </div>
                        <div class="space-ten"></div>
                    </div>
                </div>
                <div class="space-ten" />
            </c:forEach>
        </div>
    </div>

</body>
</html>
