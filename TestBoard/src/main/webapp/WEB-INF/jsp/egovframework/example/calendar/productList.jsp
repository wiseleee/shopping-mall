<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>        
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<c:import url="../header.jsp"/>
<link rel="stylesheet" href="css/proList.css">
<body>
<!--  
<style>
    #paging {
        text-align: center;
        margin-top: 20px;
    }
</style>
 -->
<script type="text/javaScript" language="javascript" defer="defer">
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/getProductList.do'/>";
           	document.listForm.submit();
        }
        

    </script>
 
    
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
	<div id="content_pop">
		<div class="container">
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
	<div id="paging">
		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
		<form:hidden path="pageIndex" />
	</div>
	<div id="sysbtn">
		<ul>
			<li>
				<span class="btn_blue_l">
					<a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
					<img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
				</span>
			</li>
		</ul>
	</div>
	    </form:form>
<c:import url="../footer.jsp"/>
