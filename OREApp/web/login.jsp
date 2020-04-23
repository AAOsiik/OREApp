<%-- 
    Document   : login
    Created on : 23-mar-2020, 18.54.59
    Author     : Kri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <title>OREApp - Login</title>
    </head>
    <body>

        <%@include file="/WEB-INF/jspf/nav.jspf" %>

        <%@include file="/WEB-INF/jspf/mid_logo.jspf" %>

        <div class="row logForm">
            <div class="col-md-6 marginCenter">
                <form method="post" action="LoginController" >
                    <div class="form-group">
                        <label for="uname">Email/Username</label>
                        <input type="text" name="uname" class="form-control" id="uname" placeholder="Enter email or username" value="${uname}" required>
                        <label class="error" id="uname-error">${LOGIN_ERROR}</label>
                    </div>
                    <div class="form-group">
                        <label for="password1">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password" required><br>
                    </div>
                    <div class="form-group center">
                        <button type="submit" class="btn btn-info">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
</html>
