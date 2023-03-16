<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>

<c:import url="../header.jsp"/>

<body>
	<div class="container">
		<c:forEach var="result" items="${resultList}" varStatus="status">           
			<div class="box">
				<a href="/TestBoard/getProduct.do?id=<c:out value="${result.ID}"/>">
					<img src="<c:out value="${result.IMAGE_PATH}"/> " alt="<c:out value="${result.NAME}"/>">
					<h5><c:out value="${result.NAME}"/></h5>
					<p><c:out value="${result.PRICE}"/> </p>
				</a>
			</div>            
		</c:forEach>
	</div>
	
<c:import url="../footer.jsp"/>


