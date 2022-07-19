<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/oaga/css/user/userPageStyle.css" />


<div class="re_list_box">
	<div class="profile_b">
		<div class="userProfile-wrap">
			<div class="userPageImgBox">
				<img class="userPageImg"
					src="http://localhost:9090/oaga/upload/${user.userProfileImgUrl}"
					alt="...">
			</div>
			<!-- myPageImgBox -->
			<div class="info_box">
				<div class="info">
					<p class="logged_cnt_box logged_clip">
						<b>작성한 리뷰</b> <a>${userReviews.totalElements}</a>
					</p>
					<div class="logged_line">&nbsp;</div>
					<p class="logged_cnt_box logged_plan">
						<b>좋아요</b> <span>${user.likes}</span>
					</p>
					<div class="logged_line">&nbsp;</div>
					<p class="logged_cnt_box logged_qa">
						<b>Q&amp;A</b> <span>${user.qna}</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 리뷰 리스트 -->
	<section class="review_list_container">
		<header class="li_header">
			<div>
				<h3 class="li_title">${user.userNickName}&nbsp;님이작성한리뷰</h3>
			</div>
		</header>
		<ul>
			<c:forEach var="userReview" items="${userReviews.content}">
				<li class="li_item"><a class="li_item_a" href="/oaga/detail/${userReview.id}">
						<p style="margin-left: 1rem; margin-right: 20px; font-size: 30px;">ㆍ</p>
						<img class="li_item_img"
						src="http://localhost:9090/oaga/upload/${userReview.reviewImageUrl}">
						<div class="li_t_wrap">
							<h3 class="li_item_t">${userReview.title}</h3>
							<h4 class="li_item_d">${userReview.createDate}</h4>
						</div> <span class="Icon_icon__2BP_o TabOverview_icon__3umjF"
						aria-hidden="true"><svg xmlns="http://www.w3.org/2000/svg"
								viewBox="0 0 24 24">
							<path
									d="M6.49 20.13L8.26 21.9 18.16 12 8.26 2.1 6.49 3.87 14.62 12 6.49 20.13z"></path></svg></span>
				</a></li>
			</c:forEach>


		</ul>
	</section>

</div>


<%@ include file="../layout/footer.jsp"%>