<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/oaga/css/review/homeStyle.css" />
<!-- background: url("/images/reviewPage/review_bg.jpg")  -->

<div class="review_search">
	<div class="review_wrap">
		<h5 class="review_search_title">
			보고싶은 리뷰를 검색하여 가고싶은 지역의 <span>후기</span>를 찾아보세요
		</h5>
		<div class="review_img_box">
			<img class="review_search_img"
				src="/oaga/images/reviewPage/review_home.jpg">
		</div>
		<!-- 사진이나 화면 추가 -->
		<p class="review_search_coment">
			여행자들의 리뷰를 <span>검색</span>해보세요.
		</p>
		<div class="review_search_area">
			<form action="/oaga/list/search" method="get">
			
				<input type="text" class="review_search_input" name="searchTitle"
					id="search-review" placeholder="제목으로 검색">
				<button class="review_btn_search">
					<img src="images/mainpage/icon_search2.png" alt="">
				</button>
			</form>
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${empty principal}">
	</c:when>
	<c:otherwise>

		<div class="review_row2wrap">
			<div class="page logged_box">

				<div class="wrap_logged">
					<div class="reviews_left">
						<div class="review_user_imgBox">
							<img class="logged_user_img"
								src="http://localhost:9090/oaga/upload/${principal.user.userProfileImgUrl}"
								onerror="this.src='/oaga/images/reviewPage/profile_basic.png';">
						</div>
						<div class="logged_left">

							<a href="/oaga/mypage_form" class="logged_cnt_box logged_clip">
								<b>내가 작성한 리뷰</b> <span>${reviewCount}</span>
							</a>
							<div class="logged_line">&nbsp;</div>
							<a id="likes_btn" class="logged_cnt_box logged_plan"> <b>좋아요</b>
								<span>${principal.user.likes}</span>
							</a>
							<!-- 모달 띄우기 -->
							<div class="logged_line">&nbsp;</div>
							<a class="logged_cnt_box logged_qa"> <b>Q&amp;A</b> <span>0</span>
							</a>
						</div>
					</div>
					<!--reviews_left-->

					<div class="logged_btn">
						<div class="logged_btn_ico">
							<a href="/oaga/write"> <img
								src="images/reviewPage/ico_review.png" />
							</a>
						</div>
						나의 여행 리뷰 작성
					</div>
					<!-- logged_btn -->
				</div>
			</div>
		</div>

		</div>
	</c:otherwise>
</c:choose>

<!-- 모달창 생성 -->






<!-- 베스트 리뷰 리스트 ================================================ -->



<section class="sec2 sec2review">
	<div class="secWrap">
		<h3 style="color: #f9bb57">여행 리뷰 한눈에 보기</h3>
		<p class="tit">베스트 리뷰와 가장 최근에 작성된 리뷰를 볼 수 있어요</p>
		<div class="review_option">
			<div class="sort on" data-id="po">인기</div>
			<div class="sort_line"></div>
			<button style="background: none; border: none;" id="recent-btn">
				<div class="sort" data-id="regdate">신규</div>
			</button>
		</div>



		<div class="row1">
			<!--  row1 박스 태그 시작 -->
			<c:forEach var="reviews" items="${reviews.content}" begin="0" end="2">
				<div class="box">
					<a href="/oaga/detail/${reviews.id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviews.reviewImageUrl}"
								alt="" />
							<div class="txt">
								<p>${reviews.title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviews.areaName}</li>
								<li class="withFriend">${reviews.theme}</li>
								<li class="userName">${reviews.user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="location">25</li>
								<li class="view">${reviews.count}</li>
								<li class="copy">27</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>
				<!--box-->
			</c:forEach>

		</div>
		<!--row1-->

		<div class="row2">
			<c:forEach var="reviews" items="${reviews.content}" begin="3" end="5">
				<div class="box">
					<a href="/oaga/detail/${reviews.id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviews.reviewImageUrl}"
								alt="" />
							<div class="txt">
								<p>${reviews.title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviews.areaName}</li>
								<li class="withFriend">${reviews.theme}</li>
								<li class="userName">${reviews.user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="location">25</li>
								<li class="view">${reviews.count}</li>
								<li class="copy">27</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>
			</c:forEach>
			<!--box-->
		</div>
		<!--row2-->

		<a href="/oaga/list">
			<div class="review_more more" style="cursor: pointer;">여행리뷰 모두보기</div>
		</a>
	</div>
	<!--secWrap-->
</section>
<!--sec2-->
<!-- ==================================================================================== -->
<!-- 베스트 리뷰어 section 시작 -->
<section class="sec_reviewer">
	<div class="div_reviewer">
		<h3 class="best_reviewer_title">이번 달 베스트 리뷰어</h3>
		<p
			style="font-size: 16px; text-align: center; color: #666; margin-bottom: 30px; line-height: 1;">좋아요를
			가장 많이 받은 베스트 리뷰어들</p>
		<div class="best_reviewer_box">
			<div style="display: flex; margin: 0 auto;">

				<c:forEach var="bestuser" items="${bestUser}">
					<div class="box" style="display: flex;">
						<c:choose>
							<c:when test="${empty principal}">
								<a class="best_reviewer_a"
									href="/oaga/userpage_form/${bestuser.id}"> <img
									src="http://localhost:9090/oaga/upload/${bestuser.userProfileImgUrl}"
									onerror="this.src='images/reviewPage/profile_basic.png';"
									class="best_reviewer_profile">
									<div class="like-Box">
										<img class="best_reviewer_icon"
											src="/oaga/images/userPage/heart.png"> <span>&nbsp;${bestuser.likes}</span>
									</div>
								</a>
							</c:when>
							<c:otherwise>
								<a class="best_reviewer_a"
									onclick="checkMyPage(${bestuser.id});"> <input
									type="hidden" value="${principal.user.id}" id="myId"> <img
									src="http://localhost:9090/oaga/upload/${bestuser.userProfileImgUrl}"
									onerror="this.src='images/reviewPage/profile_basic.png';"
									class="best_reviewer_profile" style="cursor: pointer;">
									<div class="like-Box">
										<img class="best_reviewer_icon"
											src="/oaga/images/userPage/heart.png"> <span>&nbsp;${bestuser.likes}</span>
									</div>
								</a>
							</c:otherwise>
						</c:choose>


					</div>
				</c:forEach>


			</div>


		</div>
	</div>
</section>

<script src="/oaga/js/review.js"></script>
<script type="text/javascript">
let myId = $("#myId").val();
function checkMyPage(userId) {
	if(userId == myId) {
		location.href = "/oaga/mypage_form";
	} else {
		location.href = "/oaga/userpage_form_l/"+userId;
	}
}
</script>

<%@ include file="../layout/footer.jsp"%>