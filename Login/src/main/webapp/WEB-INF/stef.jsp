<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link href="<c:url value="/resources/static/css/style.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/static/js/app.js" />"></script>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<title>Login And Registration</title>
<style type="text/css">
body{
background-image: url("/images/bg.jpg")}</style>
</head>
<body >
 <div class="form-container sign-up-form">


<div class = "form-box sign-in-box">


<h2>Sign up</h2>
<form>
<div class =" field">
<i class="uil uil-at"></i>
<input type="email" placeholder="its required"></div>
<div class =" field">
<i class="uil uil-user"></i>
<input type="text" placeholder=" Full Name "></div>


<div class="field">
<i class="uil uil-lock-alt"></i>
<input type="password" placeholder="Password required" required></div>
<div class="field">
<i class="uil uil-lock-access"></i>
<input type="password" placeholder="Confirm password" required></div>


<input class="submit-btn" type="submit" value="Sign up">

</div></form>
<div class=imgBox sign-in-imgBox">
<div class="sliding-link">
<p>Already a member? </p>

<span class="sign-up-btn"> Sign in</span></div>

<div>  <img src="<c:url value="/resources/static/images/home.jpeg"/>" />

</div></div>






</div></body>




</html>