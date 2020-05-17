<%-- 
    Document   : profile
    Author     : Kri & TL Alex
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
                    <div class="row">                        
                        <form class="form-horizontal" role="form" method="post" action="ProfileController" enctype="multipart/form-data">
                            <div class="col-md-6" style="float: left;">
                                <div class="row justify-content-center">
                                    <c:choose>
                                        <c:when test="${not empty USERINPUT.picture}">
                                            <img src="FileServlet?path=${USERINPUT.picture}" alt="${USERINPUT.uname}" class="img-thumbnail" style="width:200px;height: 200px;">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="img/user.png" class="img-thumbnail" alt="profile picture" style="width:200px;height: 200px;">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="row justify-content-center mt-1 py-1">
                                    <input id="picture" name="picture" type="file" style="display:none;" />
                                    <input class="btn btn-primary" type="button" value="Change profile picture"
                                           onclick="document.getElementById('picture').click();" />
                                    <!--<input id="picture" name="picture" class="btn btn-primary input-file" type="file">-->
                                    <!--<button type="button" class="btn btn-primary input-file">Change profile picture</button>-->
                                </div>                            
                            </div>

                            <div class="col-md-6 text-center" style="float: left;">
                                <h2>Account Details</h2>    
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="fName">First Name</label>
                                        <input type="text" name="fName" class="form-control" id="fName" value="${USERINPUT.firstName}">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lName">Last Name</label>
                                        <input type="text" name="lName" class="form-control" id="lName" value="${USERINPUT.lastName}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" name="email" class="form-control" id="email" value="${USERINPUT.email}" readonly>
                                    <label class="error" id="email-error" >${ERRORS}</label>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <!--<button type="button" class="btn btn-warning">Change Password</button>-->
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-info">Apply</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <%@include file="/WEB-INF/jspf/noSessionError.jspf" %>
            </c:otherwise>
        </c:choose>

    </body>
</html>
