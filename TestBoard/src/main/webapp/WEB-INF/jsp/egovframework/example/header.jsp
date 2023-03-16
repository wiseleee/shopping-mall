<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>My Shopping Mall</title>
	 <link rel="stylesheet" href="css/style.css">
	<script src="js/carendar.js"></script>
</head>
<body onload="printCalendar()"> 
	<header>
		<h1><a href="/TestBoard/calendar.do">Wiselife Nike Shopping Mall 👟👟</a></h1>		
		<p>Get the best deals on the products you love.</p>

		<nav>
			<ul>
				<li><a href="/TestBoard/calendar.do">Home</a></li>
				<li><a href="/TestBoard/login.do">Login</a></li>
				<li><a href="/TestBoard/getProductList.do">Shop</a></li>
				<li><a href="/TestBoard/showProductDetail.do">About</a></li>
				<li><a href="/TestBoard/testBoard.do">Contact</a></li>
				<li><a href="/TestBoard/showGame.do">Game</a></li>
				<li><a href="/TestBoard/showScreen.do">일반화면1</a></li>
				<li><a href="/TestBoard/getScreenList.do">일반화면2</a></li>
				<li><a href="/TestBoard/showEvent.do">event</a></li>
			</ul>
			<ul><li></li>
				<li><table id="calendarTable"></table></li>
			</ul>
		</nav>	
		

	</header>
