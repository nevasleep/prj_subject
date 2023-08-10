
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="css/login.css">
</head>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->
        <h2 class="active"> Sign In </h2>
        <a href="register"><h2 class="inactive underlineHover">Sign Up </h2></a>

        <!-- Icon -->
        

        <!-- Login Form -->
        <form method="post" action="login">
            <h4 style="color: green;">${message}</h4><input type="text" id="login" class="fadeIn second" name="username" placeholder="User Name"></br>
             <h4 style="color: green;">${message}</h4><input type="password" id="password" class="fadeIn third" name="password" placeholder="Password">
            <input type="submit" class="fadeIn fourth" value="Log In">
        </form>

        

    </div>
</div>
