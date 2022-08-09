<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/travelinfo/homeStyle.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<input type="hidden" id="home">
<div class="travelInfo-main-container"
	style="width: 100%; margin-top: 57px;">
	<input type="hidden" name ="${_csrf.parameterName}" value = "${_csrf.token}">
	<div class="travelInfo_header">
		<div class="travelInfo_header_filter">
			<div class=travelInfo_hWrap>
				<p>
					<span>어디로</span> 여행 가고싶나요?
				</p>
				<div class=areaListWrap>
					<div class="areaList">
						<ul class="areaList_ul">
							<li class="area_list_li"><a href="travel/areainfo/1">서울</a></li>
							<li class="area_list_li"><a href="travel/areainfo/5">인천</a></li>
							<li class="area_list_li"><a href="travel/areainfo/6">대전</a></li>
							<li class="area_list_li"><a href="travel/areainfo/3">대구</a></li>
							<li class="area_list_li"><a href="travel/areainfo/7">광주</a></li>
							<li class="area_list_li"><a href="travel/areainfo/2">부산</a></li>
							<li class="area_list_li"><a href="travel/areainfo/8">울산</a></li>
							<li class="area_list_li"><a href="travel/areainfo/9">세종</a></li>
							<li class="area_list_li"><a href="travel/areainfo/10">경기</a></li>
							<li class="area_list_li"><a href="travel/areainfo/11">강원</a></li>
						</ul>
					</div>
					<div class="areaList">
						<ul class="areaList_ul">
							<li class="area_list_li"><a href="travel/areainfo/12">충북</a></li>
							<li class="area_list_li"><a href="travel/areainfo/13">충남</a></li>
							<li class="area_list_li"><a href="travel/areainfo/14">경북</a></li>
							<li class="area_list_li"><a href="travel/areainfo/15">경남</a></li>
							<li class="area_list_li"><a href="travel/areainfo/16">전북</a></li>
							<li class="area_list_li"><a href="travel/areainfo/17">전남</a></li>
							<li class="area_list_li"><a href="travel/areainfo/4">제주도</a></li>

						</ul>
					</div>
				</div>
				<!-- areaListWrap -->
			</div>
			<!-- hWrap -->
		</div>
		<!-- travelInfo_header_filter -->
	</div>
	<!-- travelInfo header -->

	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3 class="travelInfo_cityName">서울</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[0]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">

						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- travelInfo_row -->
	</div>
	<!-- travelInfo_rowBackground -->

	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>부산</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">


				<c:forEach var="area" items="${lists[1]}">

					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>


	<div class="travelInfo_rowBackground">
		<div class="travelInfo_body">
			<div class="travelInfo_row">
				<h3>대구</h3>
				<div style="display: flex; width: 1190px;" class="swiper-container">

					<c:forEach var="area" items="${lists[2]}">
						<div class="swiper-wrapper"
							style="width: 200px; height: 200px; margin-right: 35px;">
							<div class="swiper-slide" style="display: flex;">
								<div class="travleInfo_element">
									<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->

	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>제주도</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[3]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>인천</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[4]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>대전</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[5]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>광주</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[6]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>울산</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[7]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>세종</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[8]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>경기</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[9]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>강원</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[10]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>충북</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[11]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>충남</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[12]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>경북</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[13]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>경남</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[14]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>전북</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[15]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
	<div class="travelInfo_rowBackground">
		<div class="travelInfo_row">
			<h3>전남</h3>
			<div style="display: flex; width: 1190px;" class="swiper-container">

				<c:forEach var="area" items="${lists[16]}">
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div class="travleInfo_element">
								<a href="/oaga/travel_hotplace/${area.id}"> ${area.image} <span>${area.guname}</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
	<!-- 	<div class="travelInfo_rowBackground"> -->
</div>
<script src="js/travelInfo.js"></script>

<%@ include file="../layout/footer.jsp"%>