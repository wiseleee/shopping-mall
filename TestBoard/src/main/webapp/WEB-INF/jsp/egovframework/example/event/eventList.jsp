<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     

<!DOCTYPE html>
<html>
<c:import url="../header.jsp"/>

<title>Event List - My Shopping Mall</title>

<style>
	/* 전체 스타일 */
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	color: #333;
}

discount {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	font-weight: bold;
}

nav ul {
	display: flex;
}

nav li {
	margin-left: 20px;
}

nav a {
	color: #333;
	text-decoration: none;
}

main {
	padding: 40px;
}

.banner {
	position: relative;
}

.banner img {
	width: 100%;
}

.event-period {
	position: absolute;
	top: 10px;
	right: 10px;
	background-color: rgba(0, 0, 0, 0.7);
	color: #fff;
	padding: 10px;
	border-radius: 5px;
	font-size: 14px;
}

.products h2 {
	margin-bottom: 20px;
	font
</style>

	<discount>
		<h1>봄맞이 할인 이벤트</h1>
		<nav>
			<ul>
				<li><a href="/products/list">상품</a></li>
			</ul>
		</nav>
	</discount>
	<main>
		<section class="banner">
			<img src="<c:url value='/images/event2.jpg'/>" alt="봄맞이 할인 이벤트" />
			<div class="event-period">
				이벤트 기간: 2023년 3월 15일 ~ 3월 31일
			</div>
		</section>
		<section class="products">
			<h2>🎁🎁 이벤트 대상 상품 🎁🎁</h2>
			<ul>
				<li><a href="/TestBoard/getEvent.do?id=1">상품 1</a></li>
				<li><a href="/TestBoard/getEvent.do?id=2">상품 2</a></li>
				<li><a href="/TestBoard/getEvent.do?id=3">상품 3</a></li>
				<li><a href="/TestBoard/getEvent.do?id=4">상품 4</a></li>
			</ul>
		</section>
	</main>

<%--     <form:form commandName="eventVO" id="listForm" name="listForm" method="get">
	<div id="main">
		<div class="banner">
			<img src="<c:url value='/images/event2.jpg'/>" alt="봄맞이 할인 이벤트" />
			<c:forEach var="result" items="${resultList}" varStatus="status">           
				<div class="box">
					<a href="/TestBoard/getProduct.do?id=<c:out value="${result.ID}"/>">
						<img src="<c:out value="${result.IMAGE_PATH}"/> " alt="<c:out value="${result.NAME}"/>">
						<h5><c:out value="${result.NAME}"/></h5>
						<p>$<c:out value="${result.PRICE}"/> </p>
					</a>				
				</div>		
			</c:forEach>
		</div>
	</div>
	</form:form> --%>
</body>

	<c:import url="../footer.jsp"/>
</html>