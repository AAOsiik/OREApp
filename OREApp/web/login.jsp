<%-- 
    Document   : login
    Created on : 23-mar-2020, 18.54.59
    Author     : Kri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <title>OREApp - Login</title>
        <link rel="icon" href="img/ORE_Logo.png">
        <link rel="stylesheet" type="text/css" href="style/style.css">
    </head>
    <body>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">HOME<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">LOGIN</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="register.jsp">REGISTER</a>
                            </li>
                        </ul>
                    </form>
                </div>
            </nav>

            <div class="row logo">
                <div class="col-md-12 center">
                    <img src="img/ORE_Logo.png" alt="">
                </div>
            </div>

            <div class="row logForm">
                <div class="col-md-6 marginCenter">
                    <form>
                        <div class="form-group">
                            <label for="user">Email/Username</label>
                            <input type="text" class="form-control" id="user" placeholder="Enter email or username">
                        </div>
                        <div class="form-group">
                            <label for="password1">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Password"><br>
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
