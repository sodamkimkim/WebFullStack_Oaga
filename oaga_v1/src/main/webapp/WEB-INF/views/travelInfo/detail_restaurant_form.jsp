<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <link rel="stylesheet" href="/oaga/css/style.css" /> -->
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet"
	href="/oaga/css/travelinfo/travelinfodetailStyle.css" />



<div class="tvdWrap">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}">
	<div class="tvdtailmainBn">
		<div class="tvmainBnImgBox">
			<c:forEach var="restaurant" items="${restaurant}">
				<img alt=""
					src="http://localhost:9090/oaga/upload/${restaurant.image}">
			</c:forEach>
		</div>
		<!-- tvmainBnImgBox -->
		<div class="hoverFilter">
			<c:forEach var="restaurant" items="${restaurant}">
				<p>${restaurant.name}</p>
			</c:forEach>
		</div>
		<!-- hoverFilter -->
	</div>
	<!-- tvdtailmainBn-->
	<c:forEach var="restaurant" items="${restaurant}">
		<div class="tvdRow1">
			<div class="left">
				<div class="leftRow1">
					<p>${restaurant.name}</p>
				</div>
				<!-- leftRow1 -->


				<table>
					<thead>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="title">주소</td>
							<td>${restaurant.address}</td>
						</tr>
						<tr>
							<td class="title">소개</td>
							<td>${restaurant.content}</td>
						</tr>
					</tbody>

				</table>
			</div>
			<!-- left -->
			<div class="right">
				<input type="hidden" value="${restaurant.address}" id="addressInfo">
				<div class="kakaomapImgBox">
					<a href="https://map.kakao.com/link/search/${restaurant.address}"
						target="_blank">
						<div id="map" class="mapBox" style="width: 100%; height: 400px;"></div>
					</a>
				</div>
				<!-- kakaomapImgBox -->

			</div>
			<!-- right -->
		</div>
		<!-- tvdRow1 -->
	</c:forEach>
	<div class="tvdRow2">
		<p class = "title">근처 식당/카페</p>
		<div class="container"
			style="width: 100%; height: 200px; margin-top: 30px;">
			<div class="container"
				style="display: flex; justify-content: flex-start;">
				<c:forEach var="guRestaurantListAll" items="${guRestaurantListAll}">
					<div class = "tvdSlide">
						<a href="/oaga/travel_detail/${guRestaurantListAll.id}"> 
						<img alt="" src="http://localhost:9090/oaga/upload/${guRestaurantListAll.image}"
							style="width: 200px; height: 150px; border-radius: 10px; margin-right: 0px;">
						</a>
						<p>${guRestaurantListAll.name}</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- tvdRow2 -->

</div>
<!-- tvdWrap -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4792461abb659d56ffd7323aa03f73a3"></script>
<script src="/oaga/js/map.js"></script>

<%@ include file="../layout/footer.jsp"%>