<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/user/myPageStyle.css" />
<div class="re_list_box">
	<div class="profile_b">
		<div class="text-center my-5 myPageEditWrap">
			<div class="myPageImgBox">
				<img class="myPageImg"
					src="http://localhost:9090/oaga/upload/${principal.user.userProfileImgUrl}"
					alt="...">

			</div>
			<!-- myPageImgBox -->
			<div class="myPageEditBtns">

				<!-- "javascript: form.action='/oaga/api/review/upload';" -->
				<button class="editUserInfoBtn btn">
					<a href="/oaga/user/updateUserInfo_form">회원정보 수정하기 </a>
				</button>

				<button class="editUserProfile btn">
					<a href="#">회원 프로필 수정하기</a>
				</button>
			</div>
			<!-- myPageEditBtns -->
		</div>
		<!-- myPageEditWrap -->
		<div class="myPage_infoBox">
			<div class="info">
				<p class="logged_cnt_box logged_clip">
					<b>작성한 리뷰</b> <span>${myReviews.totalElements}</span>
				</p>
				<div class="logged_line">&nbsp;</div>
				<p class="logged_cnt_box logged_plan">
					<b>좋아요</b> <span>${principal.user.likes}</span>
				</p>
				<div class="logged_line">&nbsp;</div>
				<p class="logged_cnt_box logged_qa">
					<b>Q&amp;A</b> <span>${principal.user.qna}</span>
				</p>
			</div>
		</div>
	</div>
	<!-- 리뷰 리스트 -->
	<section class="review_list_container">
		<header class="li_header">
			<div>
				<h3 class="li_title">${principal.user.userNickName}님이작성한리뷰</h3>
			</div>
		</header>
		<ul>
			<c:forEach var="myReview" items="${myReviews.content}">
				<li class="li_item"><a class="li_item_a"
					href="/oaga/detail/${myReview.id}">
						<p style="margin-left: 1rem; margin-right: 20px; font-size: 30px;">ㆍ</p>
						<div class="li_item_imgBox">

							<img class="li_item_img"
								src="http://localhost:9090/oaga/upload/${myReview.reviewImageUrl}">

						</div> <!-- li_item_imgBox -->

						<div class="li_t_wrap">
							<h3 class="li_item_t">${myReview.title}</h3>
							<h4 class="li_item_d">${myReview.createDate}</h4>
						</div> <span class="Icon_icon__2BP_o TabOverview_icon__3umjF"
						aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 24 24">
							
							<path
									d="M6.49 20.13L8.26 21.9 18.16 12 8.26 2.1 6.49 3.87 14.62 12 6.49 20.13z"></path></svg></span>
				</a></li>
				<li>${myReviews.first}</li>
			</c:forEach>

		</ul>
		<ul class="pagination">
			<c:set var="isDisabled" value="disabled"></c:set>
			<c:set var="isNotDisabled" value=""></c:set>
			<c:set var="isNowPage" value="active"></c:set>
			<li class="page-item"><a href="#"></a></li>
			<!-- page-item -->
			<li class="page-item"><a href="#"></a></li>
			<!-- page-item -->
			<li class="page-item"><a href="#"></a></li>
			<!-- page-item -->
			<li class="page-item"><a href="#"></a></li>
			<!-- page-item -->
		</ul>





	</section>

</div>


<%@ include file="../layout/footer.jsp"%>
