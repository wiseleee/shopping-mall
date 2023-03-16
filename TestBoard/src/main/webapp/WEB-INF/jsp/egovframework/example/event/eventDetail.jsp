<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        


<c:import url="../header.jsp"/>
<link rel="stylesheet" href="css/proList.css"> 
<title>Event Product Detail - My Shopping Mall</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<h1>🌟이벤트상품🌟</h1>

<main>
<div class="container" style="display: flex; justify-content: center; align-items: center; height: 100vh;">

	
    <div class="product-images">
      <img src="${event.imagePath}"  alt="Product 1"> 
    </div>
    <div class="product-info">
    
	<c:if test="${not empty event}">
    	<h1>${event.name}</h1>
	</c:if>
      
      <h1><p class="price" style="text-decoration: underline; color: red;">$${event.price*0.6}</p></h1>
      <p class="description">${event.description}</p>
			<form id="buy-form" method="post" action="/TestBoard/saveProduct.do">
		  	<label for="quantity">수량:</label>        
		  	<input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
		  	<br>
		  	<label for="price">가격:</label>
		  	<span class="price">$${event.price*0.6}</span>
		  <input type="hidden" name="price" value="${event.price}" disabled>
		  <input type="hidden" name="name" value="${event.name}" disabled>
		  <br>
		  <label for="size">크기:</label>
		  <select id="size" name="size">
		    <% 
		      int start = 230;
		      int end = 290;
		      int interval = 5;
		      for (int size = start; size <= end; size += interval) {
		    %>
		    <option value="<%=size%>"><%=size%></option>
		    <% } %>
		  </select>
		  <br>
		  <br>
		  </form>
	    </div>
	  </div>
	</main>

</body>


<c:import url="../footer.jsp"/>
</html>