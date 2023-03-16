<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:import url="../header.jsp"/>
  <title>Product Detail - My Shopping Mall</title>
  <!-- SweetAlert2 라이브러리 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.0/dist/sweetalert2.all.min.js"></script>
   <!-- <link rel="stylesheet" href="css/slide.css"> -->
   <link rel="stylesheet" href="css/img.css">
   <link rel="stylesheet" href="css/swal2.css">

<main>
<div class="container" style="display: flex; justify-content: center; align-items: center; height: 100vh;">

	
    <div class="product-images">
      <img src="${result.imagePath}"  alt="Product 1">
    </div>
    <div class="product-info">
    
	<c:if test="${not empty result}">
    	<h1>${result.name}</h1>
	</c:if>
      
      <p class="price">$${result.price}</p>
      <p class="description">${result.description}</p>
			<form id="buy-form" method="post" action="/TestBoard/saveProduct.do">
		  	<label for="quantity">수량:</label>        
		  	<input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
		  	<br>
		  	<label for="price">가격:</label>
		  	<span class="price">$${result.price}</span>
		  <input type="hidden" name="price" value="${result.price}" disabled>
		  <input type="hidden" name="name" value="${result.name}" disabled>
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
		  <!-- SweetAlert2 라이브러리를 사용하여 팝업창 표시 -->
		  <button type="button" onclick="showConfirmation()">구매하기</button>
		</form>
	
	    </div>
	  </div>
	</main>
	
	<script>
	function showConfirmation() {
	  Swal.fire({
	    title: '<span style="color:#000;">결제하시겠습니까?</span>',
	    icon: "question",
	    showCancelButton: true,
	    confirmButtonText: "예",
	    cancelButtonText: "아니오",
	    customClass: {
	      popup: "swal2-black-and-white",
	      confirmButton: "swal2-confirm",
	      cancelButton: "swal2-cancel"
	    },
	    cancelButtonStyling: "color: #000"
	  }).then((result) => {
	    if (result.isConfirmed) {
	      var form = document.getElementById("buy-form");
	      var xhr = new XMLHttpRequest();
	      xhr.open(form.method, form.action);
	      xhr.setRequestHeader("Content-Type", "application/json");
	      xhr.onload = function() {
	    	  if (xhr.status === 200) {
	    		   console.log('정상요청');
	    		   alert('결제가 성공하였습니다.');
	    		    location.href = '/TestBoard/getProductList.do'; // list화면으로 이동
	    		  } else {
	    		    // 요청이 실패한 경우에 대한 처리를 여기에 작성
	    			  console.log('요청실패');
	    		  }
	      };
	      var formData = {
			quantity: form.quantity.value,
			price: form.price.value,
			size: form.size.value,
			name: form.name.value
	    	      };
	      const formDataToStri=JSON.stringify(formData);
	      xhr.send(formDataToStri);
	    }
	  });
	}
	
	</script>
<c:import url="../footer.jsp"/>


