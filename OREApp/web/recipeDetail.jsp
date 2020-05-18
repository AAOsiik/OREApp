<%-- 
    Document   : recipeDetail
    Created on : 16-mag-2020, 14.36.56
    Author     : Kri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>OREApp</title>
        <!--jQuery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body>
        <!--<div class="background-image"></div>-->
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <form action="NewFavouriteController" method="POST">
            <div class="container profileBox" style="border:0px;">
                <div class="row text-center">
                    <div class="col-md-10 mx-auto mb-3"><h2>${RECIPEDETAIL.title}</h2>
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <c:choose>
                                        <c:when test="${RECIPEDETAIL.isFavourite == 0}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="submit" class="btn btn-outline-danger" value="Add to Favourite">
                                        <input type="hidden" name="recipeID" value="${RECIPEDETAIL.id}">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <span class="entypo-heart"></span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail">
                    <img class="img-fluid img-thumbnail"  src="FileServlet?path=${RECIPEDETAIL.picture}" alt="${RECIPEDETAIL.title}" style="max-height: 350px;">
                </div>
            </div>
            <div class="col-md-8">
                <p class="text-justify">${RECIPEDETAIL.description}</p>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-4 text-left">category: ${RECIPEDETAIL.category}</div>
            <div class="col-md-4 text-center">difficulty: ${RECIPEDETAIL.difficulty}</div>
            <div class="col-md-4 text-right">tags: ${RECIPEDETAIL.tags}</div>
            <input type="hidden" name="recipeID" value="${RECIPEDETAIL.id}">
        </div>
    </form>

    <div class="row mt-5">
        <h4>Comments:</h4>
    </div>

    <c:if test="${not empty ERRORS}">
        <div class="error row mt-3">${ERRORS}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <c:forEach var="c" items="${COMMENTS}">
                <form action="DeleteCommentController" method="POST">
                    <div class="row comment mt-3 px-1 py-1">
                        <div class="col-md-10">
                            <h5>${c.username}:</h5>${c.comment}
                        </div>
                        <c:if test="${c.isMine == 1}">
                            <div class="col-md-2 mt-2">
                                <input type="submit" class="btn btn-danger mt-1" value="Delete Comment">
                                <input type="hidden" value="${c.id}" name="commentID">
                                <input type="hidden" name="recipeID" value="${RECIPEDETAIL.id}">
                            </div>
                        </c:if>
                    </div>
                </form>
            </c:forEach>
            <div class="row mt-5">
                <div class="col-md-12">
                    <form action="NewCommentController" method="POST">
                        <div class="row">
                            <div class="col-md-11">
                                <input class="form-control" type="text" name="comment" placeholder="Write your comment">
                            </div>
                            <div class="col-md-1">
                                <input type="submit" class="btn btn-success" value="Submit">
                            </div>
                        </div>
                        <input type="hidden" name="recipeID" value="${RECIPEDETAIL.id}">
                    </form>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="c" items="${COMMENTS}">
                <div class="row comment mt-3 px-1 py-1">
                    <div class="col-md-12">
                        <h5>${c.username}:</h5>${c.comment}
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>



    <c:if test="${not empty sessionScope.user}">

    </c:if>

</div>

</body>
</html>

