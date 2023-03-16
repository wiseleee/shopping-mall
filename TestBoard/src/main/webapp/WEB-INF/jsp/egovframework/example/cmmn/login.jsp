<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Login</title>
</head>
<link rel="stylesheet" href="css/login.css">
<body>
<c:import url="../header.jsp"/>
  	 
  <div class="login-box">
    <form action="#">
      <h1>Login</h1>
      <input type="text" placeholder="Username">
      <input type="password" placeholder="Password">
      <input type="submit" value="Login">
      <p>Don't have an account? <a href="#">Sign up</a></p>
    </form>
  </div>



<c:import url="../footer.jsp"/>
</body>
</html>