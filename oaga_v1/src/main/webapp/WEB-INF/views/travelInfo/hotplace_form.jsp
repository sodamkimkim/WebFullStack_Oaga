<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<br />
<style>
.areagu_img {
	
	width: inherit;
	height: inherit;
}
</style>
<div style="width: 100%; display: flex; justify-content: center;">
	<div style="width: 1200px; height: 500px;">
		<c:forEach var="guInfoImage" items="${guInfoImage}">
		${guInfoImage.image}
		</c:forEach>
	</div>
</div>
<br/>
<br/>

<div
	style=" font-size: 25px; font-style: oblique; padding-top: 10px; margin-left: 366px; font-weight: bold;">HOT플레이스</div>
<div class="content-randmark"
	style="display: flex; justify-content: center;">

	<div 
		style="width: 1200px; height: 200px; display: flex; justify-content:center;">
		<div class="swiper-container" 
			style="display: flex;   font-weight: bold; font-size: 20px; width: 1200px; height: 200px;">
			<c:choose>
				<c:when test="${empty guInfoList}">
					<p style="font-size: 25px; display: flex; margin-left: 50px;">업데이트중 입니다!</p>
				</c:when>
				<c:otherwise>
				
				
				<c:forEach var="guInfoList" items="${guInfoList}">
						<div style="width: 205px; height: 200px;  margin-right: 35px;" class="swiper-wrapper">
							<div class="swiper-slide" >
							<a href="/oaga/travel_detail/gu/${guInfoList.id}"> 
							<img alt=""	src="http://localhost:9090/oaga/upload/${guInfoList.image}" style="width: 200px; height: 150px; border-radius: 15px;">
							</a>
							<p>${guInfoList.name}</p>
							</div>
						</div>
				</c:forEach>
				
				
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>

</div>
<br/>
<br/>
<div
	style="font-size: 25px; font-style: oblique; padding-top: 10px; margin-left: 366px; font-weight: bold;">맛집/카페</div>
	
<div class="content-randmark"
	style="display: flex; justify-content: center;">

	<div 
		style="width: 1200px; height: 200px; display: flex; justify-content:center;">
		<div class="swiper-container" 
			style="display: flex;   font-weight: bold; font-size: 20px; width: 1200px; height: 200px;">
			<c:choose>
				<c:when test="${empty guInfoList}">
					<p style="font-size: 25px; display: flex; margin-left: 50px;">업데이트중 입니다!</p>
				</c:when>
				<c:otherwise>
				
				
				<c:forEach var="restaurantList" items="${restaurantList}">
						<div style="width: 205px; height: 200px;  margin-right: 35px;" class="swiper-wrapper">
							<div class="swiper-slide" >
							<a href="/oaga/travel_detail/${restaurantList.id}"> 
							<img alt=""	src="http://localhost:9090/oaga/upload/${restaurantList.image}" style="width: 200px; height: 150px; border-radius: 15px;">
							</a>
							<p>${restaurantList.name}</p>
							</div>
						</div>
				</c:forEach>
				
				
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>


</div>


<br />
<br />

<script src="../js/travelInfo.js"></script>