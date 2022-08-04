<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/oaga/css/style.css" />

<style>
.kakaomapImgBox {
	
	margin-left: 20px;
	margin-top: 50px;
	text-align: center;
}

.kakaomapImgBox>a>img {
	width: 80px;
}

.mapBox {
	border: 2px solid rgba(51,51,51,0.3);
	border-radius: 10px;
/* 	position: absolute; */
/* 	bottom: 30px; */
/* 	left: 50%; */
/* 	transform: translateX(-50%); */
}
</style>

<br />
<br />
<div class="imgcontainer"
	style="width: 1200px;margin-left: auto; margin-right: auto;  margin-top: 70px;
	display: flex; justify-content: center;">
	<div class="imgcontainer"
		style="overflow: hidden; border-radius:10px; border: 2px solid rgba(51,51,51,0.3);width: 500px; display: flex; justify-content: flex-start;">
		<div class="imgcontainer" style="width: 500px; height: 400px">
			<c:forEach var="gu" items="${gu}">

				<img alt="" src="http://localhost:9090/oaga/upload/${gu.image}"
					style="width: 100%; height: 100%; border-top-left-radius: 10px; border-bottom-left-radius: 10px;">
			</c:forEach>
		</div>
		<div
			style="padding: 15px; width: 43%; border-top-right-radius: 10px; border-bottom-right-radius: 10px;">

			<c:forEach var="gu" items="${gu}">
				<div
					style="font-size: 25px; font-style: oblique; font-weight: bold;">
					<h5 style="margin-bottom: 10px;">이름: ${gu.name}</h5>
					<p style="font-size: 20px;">주소: ${gu.address}</p>
					<input type="hidden" value="${gu.address}" id="addressInfo">

					<br /> <span style="font-size: 15px;">${gu.content}</span>
				</div>

			</c:forEach>
		</div>
	</div>
<c:forEach var="gu" items="${gu}">
	<div class="kakaomapImgBox">
		<a href="https://map.kakao.com/link/search/${gu.address}"
			target="_blank">
			<div id="map" class="mapBox" style="width: 400px; height: 300px;"></div>
			<!-- 					<img alt="" src="/oaga/images/kakaomap/kakaomap.png"> -->
		</a>
	</div>
	<!-- kakaomapImgBox -->
</c:forEach>
</div>
<br />
<br />





<h3 style="margin-left: 407px; margin-bottom: -30px;">근처 식당/카페</h3>
<div class="container"
	style="width: 100%; height: 200px; display: flex; justify-content: center; margin-top: 45px;">
	<div class="container"
		style="width: 57%; display: flex; justify-content: flex-start; align-items: center;">
		<c:forEach var="guRestaurantListAll" items="${guRestaurantListAll}">
			<div>
				<a href="/oaga/travel_detail/${guRestaurantListAll.id}"> <img
					alt=""
					src="http://localhost:9090/oaga/upload/${guRestaurantListAll.image}"
					style="width: 200px; height: 150px; border-radius: 10px; margin-right: 15px;">
				</a>
				<h4>${guRestaurantListAll.name}</h4>
			</div>
		</c:forEach>
	</div>
</div>
<br />
<br />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4792461abb659d56ffd7323aa03f73a3"></script>
<script src="/oaga/js/map.js"></script>
<%@ include file="../layout/footer.jsp"%>