<%-- 
    Document   : registration
    Created on : 23-mar-2020, 15.17.13
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

        <title>OREApp - Register</title>
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
            <div class="row">
                <div class="col-md-12">
                    <ul>
                        <li><a href="register.jsp">REGISTER</a></li>
                        <li><a href="login.jsp">LOGIN</a></li>
                        <li><a href="index.jsp">HOME</a></li>
                    </ul>
                </div>
            </div>

            <div class="row logo">
                <div class="col-md-12 center">
                    <img src="img/ORE_Logo.png" alt="">
                </div>
            </div>

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