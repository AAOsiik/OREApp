<%-- 
    Document   : registration
    Created on : 23-mar-2020, 15.17.13
    Author     : Kri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>OREApp - Register</title>

    </head>
    <body>
        <%@include file="/WEB-INF/jspf/nav.jspf" %>
        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <div class="row regForm">
            <div class="col-md-6 marginCenter">
                <form method="post" action="RegistrationController">
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email" value="${USERINPUT.email}">
                        <label class="error" id="email-error" >${ERRORS}</label>
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    </div>
                    <div class="form-group">
                        <label for="uname">Username</label>
                        <input type="text" name="uname" class="form-control" id="uname" placeholder="Enter Username" value="${USERINPUT.uname}">
                        <label class="error" id="uname-error" >${ERRORS}</label>
                    </div>
                    <div class="form-group">
                        <label for="password1">Password</label>
                        <input type="password" name="password" class="form-control" id="password1" placeholder="Password" ><br>
                        <label for="password2">Confirm Password</label>
                        <input type="password" name="cPassword" class="form-control" id="password2" placeholder="Confirm Password">
                    </div>
                    <br>
                    <div class="form-group center">
                        <button type="submit" class="btn btn-info">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>