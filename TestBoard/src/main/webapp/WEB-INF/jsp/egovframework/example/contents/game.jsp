<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<body>
<c:import url="../header.jsp"/>
<!-- <link rel="stylesheet" href="css/game.css"> -->
  <canvas id="canvas" width="600" height="400"></canvas>
  <div id="start-game" style="cursor: pointer;">게임 시작</div>

	<script src="js/missingBall.js"></script>

<c:import url="../footer.jsp"/>
