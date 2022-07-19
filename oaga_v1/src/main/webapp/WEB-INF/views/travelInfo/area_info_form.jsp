<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<br />
<br />
<div class="container" style="display: flex; justify-content: center;">
	<c:forEach var="areaImage" items="${areaImage}">
		<p>${areaImage.area}</p>
		<img alt="" src="${areaImage.mainImageUrl}"
			style="width: 1100px; height: 450px; background-color: blue;">
	</c:forEach>

</div>
<br />
<br />
<br />

<h3 style="margin-left: 409px; margin-bottom: 13px;">${area} 도시</h3>
<div class="" style="display: flex; justify-content: center;">
	<div style="width: 1100px; height: 170px; overflow: hidden;">
		<c:forEach var="areaGu" items="${areaGu}">
			
			<img alt="" src="${areaGu.imageUrl}"
				style="width: 170px; height: 170px; border-radius: 15px;">
		</c:forEach>
	</div>
</div>
<br />
<br />
<h3 style="margin-left: 409px; margin-bottom: 13px;">놀거리</h3>
<div class="" style="display: flex; justify-content: center;">
	<div style="width: 1100px; height: 170px; overflow: hidden;">
		<c:forEach var="guinfo" items="${guinfo}">
	
			<img alt="" src="${guinfo.imageUrl}"
				style="width: 170px; height: 170px; border-radius: 15px;">
		</c:forEach>
	</div>
</div>
<br />
<br />
<h3 style="margin-left: 409px; margin-bottom: 13px;">카페/식당</h3>
<div class="" style="display: flex; justify-content: center;">
	<div style="width: 1100px; height: 170px; overflow: hidden;">
		<c:forEach var="restaurant" items="${restaurant}">
			<img alt="" src="${restaurant.imageUrl}"
				style="width: 170px; height: 170px; border-radius: 15px;">
		</c:forEach>
	</div>
</div>
<br />
<br />



<%@ include file="../layout/footer.jsp"%>