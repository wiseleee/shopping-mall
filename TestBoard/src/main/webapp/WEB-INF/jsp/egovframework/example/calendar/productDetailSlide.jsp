<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Product Detail - My Shopping Mall</title>
   <link rel="stylesheet" href="css/slide.css">
   <link rel="stylesheet" href="css/img.css">
  <!-- <link rel="stylesheet" href="css/product-detail.css"> -->
</head>
<body>
<script src="js/slide.js"></script>
<c:import url="../header.jsp"/>

<main>
<div class="container">
	
    <div class="product-images">
      <img src="images/image_1611480559382_1000.jpg" alt="Product 1">
      <img src="images/rrrw2.png" alt="Product 2">
      <img src="images/Nike-air-jordan-1.jpg" alt="Product 3">
      <img src="images/qwess.jfif" alt="Product 4">
    </div>
    <div class="product-info">
      <h1>Product Name</h1>
      <p class="price">$9.99</p>
      <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dapibus libero. Phasellus vulputate volutpat eros, nec interdum magna lobortis vel.</p>
      <form action="" method="post">
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="1" min="1" max="10">
        <br>
        <button type="submit">Add to Cart</button>
      </form>
    </div>
  </div>
</main>


<c:import url="../footer.jsp"/>

</body>
</html>

