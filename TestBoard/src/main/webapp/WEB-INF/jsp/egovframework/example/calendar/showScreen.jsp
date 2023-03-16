<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
	<style>
		.container {
			width: 960px;
			margin: 0 auto;
			display: flex;
			flex-wrap: wrap;
			justify-content: space-between;
		}

		.box {
			width: 300px;
			background-color: #f2f2f2;
			padding: 20px;
			box-sizing: border-box;
			margin-bottom: 40px;
		}
	</style>
<c:import url="../header.jsp"/>
<body>
	<div class="container">
		<div class="box">
			<h2>Box 1</h2>
			<p>Content goes here.</p>
		</div>
		<div class="box">
			<h2>Box 2</h2>
			<p>Content goes here.</p>
		</div>
		<div class="box">
			<h2>Box 3</h2>
			<p>Content goes here.</p>
		</div>
		<div class="box">
			<h2>Box 4</h2>
			<p>Content goes here.</p>
		</div>
		<div class="box">
			<h2>Box 5</h2>
			<p>Content goes here.</p>
		</div>
		<div class="box">
			<h2>Box 6</h2>
			<p>Content goes here.</p>
		</div>
	</div>
	
			<c:forEach var="result" items="${resultList}" varStatus="status">           
			<div class="container"> 	
            	<div class="box">
            	<a href="/TestBoard/getProduct.do?id= <c:out value="${result.ID}"/>">
            	<img src="<c:out value="${result.IMAGE_PATH}"/> " alt="<c:out value="${result.NAME}"/>">
            	<h5><c:out value="${result.NAME}"/></h5>
            	<p><c:out value="${result.PRICE}"/> </p>
            	</a>
            	</div>            
			</div>			
        	</c:forEach>
	
<c:import url="../footer.jsp"/>


