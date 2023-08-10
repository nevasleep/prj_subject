
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="css/login.css">
</head>
<div class="wrapper fadeInDown">
    <div id="formContent">
        <!-- Tabs Titles -->
        <a href="login"><h2> Sign In </h2></a>
        <a href="register"><h2 class="active">Sign Up </h2></a>

        <!-- Icon -->
        

        <!-- Login Form -->
        <form method="post" action="register">
            <input type="text"  class="fadeIn third" name="username" placeholder="Username" required>
            <input type="password"  class="fadeIn third" name="password" placeholder="Password" required>
            <input type="text"  class="fadeIn second" name="mail" placeholder="Mail" required>
            <input type="text"  class="fadeIn third" name="phone" placeholder="Phone" required >
            <input type="text"  class="fadeIn third" name="address" placeholder="Address" required>
            <input type="submit" class="fadeIn fourth" value="Register">
        </form>

        

    </div>
</div>
