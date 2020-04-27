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
        <script>
            window.onload = function () {
                $(document).on("click", ".showButton", function (e) {
                    var title = $(this).data('title');
                    var desc = $(this).data('desc');
                    var category = $(this).data('category');
                    var difficulty = $(this).data('difficulty');

                    $("#recipeModal-title").html(title);
                    $("#recipeModal-desc").html(desc);
                    $("#recipeModal-category").html("Category: " + category);
                    $("#recipeModal-difficulty").html(difficulty);
                });
            }
        </script>
    </head>
    <body>
        <!--<div class="background-image"></div>-->
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <div class="col-md-8 marginCenter">
            <legend>Find the perfect recipe for you!</legend>
            <c:forEach var="r" items="${RECIPES}">
                <div class="row py-3" style="background-color: rgba(76, 175, 80, 0.2);">
                    <div class="col-md-6">
                        <div class="thumbnail">
                            <img class="img-fluid img-thumbnail"  src="FileServlet?path=${r.picture}" alt="${r.title}" style="max-height: 250px;">
                        </div>
                    </div>
                    <div class="col-md-6 px-3">
                        <div class="caption">
                            <h4><a href="#">${r.title}</a></h4>
                            <p class="truncate" style="width:100%">${r.description}</p>
                            <h5 class="text-right p-1">${r.difficulty}</h5>
                        </div>
                        <div class="space-ten"></div>
                        <div class="btn-ground text-center mt-5">
                            <button type="button" class="btn btn-info showButton" data-toggle="modal" data-target="#showRecipeModal" 
                                    data-title="${r.title}" data-desc="${r.description}" data-difficulty="${r.difficulty}" data-category="${r.category}" data-tags="${r.tags}" data-title="${r.category}">
                                <i class="fa fa-shopping-cart"></i> Show Recipe</button>
                        </div>
                        <div class="space-ten"></div>
                    </div>
                </div>
                <div class="space-ten"></div>
            </c:forEach>
        </div>

        <!-- Modal box (it's only showing when you press on the 'Show Recipe' button 
            data inside this box is initialized inside script (using jQuery)-->
        <div class="modal fade" id="showRecipeModal" tabindex="-1" role="dialog" aria-labelledby="showRecipeModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="recipeModal-title"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="recipeModal-desc"></p>
                        <p id="recipeModal-category" class="text-right mt-5"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
