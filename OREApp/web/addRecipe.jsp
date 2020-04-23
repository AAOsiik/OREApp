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

        <div class="row regForm">
            <div class="col-md-6 marginCenter">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                <form method="post" action="AddRecipeController" enctype="multipart/form-data">
                    <fieldset> 
                        <legend>Add a new recipe</legend>
                        <!-- Title -->
                        <div class="form-group">
                            <label  for="title">Recipe Title</label>  
                            <div>
                                <input id="title" name="title" placeholder="Your Title" 
                                       class="form-control input-md" required="" type="text">
                            </div>
                        </div>
                        <!-- Description -->
                        <div class="form-group">
                            <label for="description">Description</label>  
                            <div >
                                <textarea id="description" name="description" class="form-control"
                                          placeholder="How to prepare your recipe?" required="">
                                </textarea> 
                            </div>
                        </div>

                        <!-- Category -->
                        <div class="form-group">
                            <label for="category">Category</label>
                            <div >
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

                        <!-- Difficulty -->
                        <div class="form-group">
                            <label  for="difficulty">Difficulty</label>
                            <div >
                                <select id="difficulty" name="difficulty" class="form-control">
                                    <option value="easy">Easy</option>
                                    <option value="medium">Medium</option>
                                    <option value="hard">Hard</option>
                                </select>
                            </div>
                        </div>

                        <!-- Tags -->
                        <div class="form-group">
                            <label for="tags">Tags</label>  
                            <div >
                                <input id="tags" name="tags" placeholder="Comma separated tags" class="form-control input-md" required="" type="text">
                            </div>
                        </div>

                        <!-- Picture --> 
                        <div class="form-group">
                            <label for="picture">Picture</label>
                            <div >
                                <input id="picture" name="picture" class="input-file" type="file">
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <div >
                                <button type="submit" id="add" name="add" class="btn btn-info">Create Recipe</button>
                            </div>
                        </div>

                    </fieldset>
                </form>
                </c:when>
                    <c:otherwise>
                        <div>
                            <h3>Please <a href="login.jsp">log in</a> to add recipes!</h3>
                        </div>
                    </c:otherwise>
                    </c:choose>
            </div>
        </div>
    </div>

</body>
</html>
