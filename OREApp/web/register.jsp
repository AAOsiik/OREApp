<%-- 
    Document   : registration
    Created on : 23-mar-2020, 15.17.13
    Author     : Kri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <form>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="password1">Password</label>
                            <input type="password" class="form-control" id="password1" placeholder="Password"><br>
                            <label for="password2">Confirm Password</label>
                            <input type="password" class="form-control" id="password2" placeholder="Confirm Password">
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