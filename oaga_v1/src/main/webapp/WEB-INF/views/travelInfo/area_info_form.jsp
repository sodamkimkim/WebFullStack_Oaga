<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<br />
<br />



<div class="container" style="display: flex; justify-content: center;">
	<c:forEach var="areaImage" items="${areaImage}">

		<img alt="" src="http://localhost:9090/oaga/upload/${areaImage.mainImage}"

			style="width: 1100px; height: 450px; background-color: blue;">
		<p>${areaImage.area}</p>
	</c:forEach>

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
				<a href="/oaga/travel_guinfo/${areaGu.id}"> <img class="swiper-slide" alt=""

					src="http://localhost:9090/oaga/upload/${areaGu.image}"

					style="width: 170px; height: 170px; border-radius: 15px;">
				</a>
				<h4 style="width: 170px; height: 20px;">${areaGu.guname}</h4>
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
		<c:forEach var="guinfo" items="${guinfo}">
			<div style="margin-right: 20px;">
				<a href="/oaga/travel_detail/gu/${guinfo.id}">

				<img alt="" src="http://localhost:9090/oaga/upload/${guinfo.image}"

					style="width: 170px; height: 170px; border-radius: 15px;">
				</a>
				<p>${guinfo.name}</p>
			</div>
		</c:forEach>

	</div>
</div>
<br />
<br />
<h3 style="margin-left: 409px; margin-bottom: 13px;">카페/식당</h3>
<div class="swiper mySwiper"
	style="display: flex; justify-content: center;">
	<div class="swiper-wrapper"
		style="width: 1100px; height: 190px; display: flex;">
		<c:forEach var="restaurant" items="${restaurant}">
			<div style="margin-right: 20px;">
				<a href="/oaga/travel_detail/${restaurant.id}">

				<img alt="" src="http://localhost:9090/oaga/upload/${restaurant.image}"

					style="width: 170px; height: 170px; border-radius: 15px;">
				</a>
				<p>${restaurant.name}</p>
			</div>
		</c:forEach>
	</div>
</div>
<br />
<br />



<%@ include file="../layout/footer.jsp"%>