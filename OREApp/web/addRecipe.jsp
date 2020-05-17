<%-- 
    Document   : addRecipe
    Created on : 23.04.2020, 10:09:57
    Author     : Alexander
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>Add Recipe</title>

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <div class="container profileBox">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <form method="post" action="AddRecipeController" enctype="multipart/form-data" autocomplete="off">
                        <h3>Add a new recipe</h3>

                        <div class="row mt-5">
                            <div class="col-md-6">
                                <!-- Title -->
                                <div class="form-group">
                                    <label  for="title">Recipe Title</label>  
                                    <input id="title" name="title" placeholder="Your Title" class="form-control input-md" required="" type="text">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Picture --> 
                                <div class="form-group">
                                    <label for="picture">Picture</label>
                                    <div><input id="picture" name="picture" class="input-file" type="file"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <!-- Description -->
                                <div class="form-group">
                                    <label for="description">Description</label>  
                                    <textarea id="description" name="description" class="form-control" placeholder="How to prepare your recipe?" required=""></textarea> 
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Category -->
                                <div class="form-group">
                                    <label for="category">Category</label>
                                    <select id="category" name="category" class="form-control">
                                        <option value="soup">Soup</option>
                                        <option value="burger">Burger</option>
                                        <option value="pasta">Pasta</option>
                                        <option value="fish">Fish</option>
                                        <option value="beef">Beef</option>
                                        <option value="pork">Pork</option>
                                        <option value="dessert">Dessert</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-6">
                                <!-- Tags -->
                                <div class="form-group">
                                    <label for="tags">Tags</label>
                                    <input id="tags" name="tags" placeholder="Comma separated tags" class="form-control input-md" required="" type="text">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <!-- Difficulty -->
                                <div class="form-group">
                                    <label  for="difficulty">Difficulty</label>
                                    <select id="difficulty" name="difficulty" class="form-control">
                                        <option value="easy">Easy</option>
                                        <option value="medium">Medium</option>
                                        <option value="hard">Hard</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row text-center mx-auto mt-5">
                            <div class="col-md-12">
                                <!-- Button -->
                                <div class="form-group">
                                    <button type="submit" id="add" name="add" class="btn btn-info">Create Recipe</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="col-md-6 marginCenter">
                        <h3>Please <a href="login.jsp">log in</a> to add recipes!</h3>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>
