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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


<style>
.areagu_img {
	width: 200px;
	border-radius: 10px;
	margin-bottom: 10px;
	height: 150px;
}

.areaList_li li a {
	background-color: white;
	padding: 7px;
	border-radius: 40%;
}

.travelInfo-main-container {
	margin-left: auto;
	margin-right: auto;
}
</style>

<input type="hidden" id="home">
<div class="travelInfo-main-container"
	style="width: 1290px; margin-top: 70px;">
	<div
		style="width: 1190px; height: 200px; background-color: rgba(245, 161, 25, 0.9); border-radius: 20px;">
		<div
			style="font-size: 30px; display: flex; justify-content: center; font-weight: bold;">
			<span style="margin-top: 20px; color: white;">어디 여행 가고싶나요?</span>
		</div>
		<br />
		<div class="areaList"
			style="font-size: 15px; green; width: 600px; height: 50px; margin-left: 300px;">
			<ul class="areaList_li"
				style="display: flex; flex-direction: row; justify-content: space-around; padding-top: 12px;">
				<li class="area_list"><a href="travel/areainfo/1">서울</a></li>
				<li class="area_list"><a href="travel/areainfo/5">인천</a></li>
				<li class="area_list"><a href="travel/areainfo/6">대전</a></li>
				<li class="area_list"><a href="travel/areainfo/3">대구</a></li>
				<li class="area_list"><a href="travel/areainfo/7">광주</a></li>
				<li class="area_list"><a href="travel/areainfo/2">부산</a></li>
				<li class="area_list"><a href="travel/areainfo/8">울산</a></li>
				<li class="area_list"><a href="travel/areainfo/9">세종</a></li>
				<li class="area_list"><a href="travel/areainfo/10">경기</a></li>
				<li class="area_list"><a href="travel/areainfo/11">강원</a></li>
			</ul>
		</div>
		<div class="areaList"
			style="font-size: 15px; green; width: 600px; height: 50px; margin-left: 300px;">
			<ul class="areaList_li"
				style="display: flex; flex-direction: row; justify-content: space-around; padding-top: 12px;">
				<li class="area_list"><a href="travel/areainfo/12">충북</a></li>
				<li class="area_list"><a href="travel/areainfo/13">충남</a></li>
				<li class="area_list"><a href="travel/areainfo/14">경북</a></li>
				<li class="area_list"><a href="travel/areainfo/15">경남</a></li>
				<li class="area_list"><a href="travel/areainfo/16">전북</a></li>
				<li class="area_list"><a href="travel/areainfo/17">전남</a></li>
				<li class="area_list"><a href="travel/areainfo/4">제주도</a></li>

			</ul>
		</div>
	</div>
	<br />
	<div class="mdu_img1type">
		<div
			style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">서울</div>
		<div style="display: flex; width: 1190px;"  class="swiper-container">

			<c:forEach var="area" items="${lists[0]}">
				<div class="swiper-wrapper"
					style="width: 200px; height: 200px; margin-right: 35px;">

					<div class="swiper-slide" style="display: flex;">
						<div >
							<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
								<h3 style="font-size: 16px;">${area.guname}</h3>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		</div>
		<br /> <br />

		<div class="mdu_img1type">
			<div 
				style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">부산</div>
			<div style="display: flex; width: 1190px;" class="swiper-container">
													

				<c:forEach var="area" items="${lists[1]}" >
				
					<div class="swiper-wrapper"
						style="width: 200px; height: 200px; margin-right: 35px;">
						<div class="swiper-slide" style="display: flex;">
							<div >
								<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
									<h3 style="font-size: 16px;">${area.guname}</h3>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			</div>
			<br /> <br />
			<div class="mdu_img1type">
				<div
					style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">대구</div>
				<div style="display: flex; width: 1190px;" class="swiper-container">

					<c:forEach var="area" items="${lists[2]}">
						<div class="swiper-wrapper"
							style="width: 200px; height: 200px; margin-right: 35px;">
							<div class="swiper-slide" style="display: flex;">
								<div >
									<a href="/oaga/travel_guinfo/${area.id}">
									${area.image}
										<h3 style="font-size: 16px;">${area.guname}</h3>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				</div>
				<br /> <br />
				<div class="mdu_img1type">
					<div
						style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">제주도</div>
					<div style="display: flex; width: 1190px;" class="swiper-container">

						<c:forEach var="area" items="${lists[3]}">
							<div class="swiper-wrapper"
								style="width: 200px; height: 200px; margin-right: 35px;">
								<div class="swiper-slide" style="display: flex;">
									<div >
										<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
											<h3 style="font-size: 16px;">${area.guname}</h3>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					</div>
					<br /> <br />
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">인천</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[4]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">대전</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[5]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">광주</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[6]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">울산</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[7]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">세종</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[8]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">경기</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[9]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">강원</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[10]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide"style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">충북</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[11]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">충남</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[12]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">경북</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[13]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">경남</div>
						<div style="display: flex; width: 1190px;"class="swiper-container">

							<c:forEach var="area" items="${lists[14]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">전북</div>
						<div style="display: flex; width: 1190px;" class="swiper-container"> 

							<c:forEach var="area" items="${lists[15]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
					<div class="mdu_img1type">
						<div
							style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 10px;">전남</div>
						<div style="display: flex; width: 1190px;" class="swiper-container">

							<c:forEach var="area" items="${lists[16]}">
								<div class="swiper-wrapper"
									style="width: 200px; height: 200px; margin-right: 35px;">
									<div class="swiper-slide" style="display: flex;">
										<div >
											<a href="/oaga/travel_guinfo/${area.id}"> ${area.image}
												<h3 style="font-size: 16px;">${area.guname}</h3>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<br /> <br />
						<br /> <br />
					</div>
</div>

	<script src="js/travelInfo.js"></script>

	<%@ include file="../layout/footer.jsp"%>

