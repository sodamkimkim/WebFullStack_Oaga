<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<br />
<br />
<style>
.areagu_img {
	width: 200px;
	border-radius: 10px;
	margin-bottom: 10px;
	height: 150px;
</style>


<div class="container" style="display: flex; justify-content: center;">
<div style="text-align: center;">
	<c:forEach var="areaImage" items="${areaImage}">
		<p style="font-size: 15px; font-weight: bold;">${areaImage.area}</p>
			${areaImage.mainImage}
	</c:forEach>
</div>
	

</div>
<br />
<br />
<br />

<h3 style="margin-left: 409px; margin-bottom: 13px;">${area}도시</h3>
<div class="swiper mySwiper"
	style="display: flex; justify-content: center;">
	<div class="swiper-wrapper"
		style="width: 1100px; height: 190px; display: flex;">
		<c:forEach var="areaGu" items="${areaGu}">
			<div style="margin-right: 20px;">
				<a href="/oaga/travel_guinfo/${areaGu.id}"> ${areaGu.image}
				</a>
				<h4>${areaGu.guname}</h4>
			</div>
		</c:forEach>
	</div>
</div>
<br />
<br />
<h3 style="margin-left: 409px; margin-bottom: 13px;">놀거리</h3>
<div class="swiper mySwiper"
	style="display: flex; justify-content: center;">
	<div class="swiper-wrapper"
		style="width: 1100px; height: 190px; display: flex;">
		<c:choose>
			<c:when test="${empty guinfo}">
				<p style="font-size: 25px; display: flex; align-items: center; margin-left: 50px;">업데이트중 입니다!</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="guinfo" items="${guinfo}">
				
					<div style="margin-right: 20px;">
						<a href="/oaga/travel_detail/gu/${guinfo.id}">
		
						<img alt="" src="http://localhost:9090/oaga/upload/${guinfo.image}"
		
							style="width: 200px; height: 150px; border-radius: 15px;">
						</a>
						<p>${guinfo.name}</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		

	</div>
</div>
<br />
<br />
<h3 style="margin-left: 409px; margin-bottom: 13px;">카페/식당</h3>
<div class="swiper mySwiper"
	style="display: flex; justify-content: center;">
	<div class="swiper-wrapper"
		style="width: 1100px; height: 190px; display: flex;">
		<c:choose>
			<c:when test="${empty restaurant}">
				<p style="font-size: 25px; display: flex; align-items: center; margin-left: 50px;">업데이트중 입니다!</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="restaurant" items="${restaurant}">
					<div style="margin-right: 20px;">
						<a href="/oaga/travel_detail/${restaurant.id}">
		
						<img alt="" src="http://localhost:9090/oaga/upload/${restaurant.image}"
		
							style="width: 200px; height: 150px; border-radius: 15px;">
						</a>
						<p>${restaurant.name}</p>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</div>
</div>
<br />
<br />



<%@ include file="../layout/footer.jsp"%>