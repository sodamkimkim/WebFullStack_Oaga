<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/oaga/css/user/userPageStyle.css" />


<div class="re_list_box">
	<div class="profile_b">
		<input type="hidden" value="${user.id}" id="userId">
		<div class="userProfile-wrap">
			<div id="userPageProfileBox" class="userPageProfileBox">
				<div class="userPageImgBox">
					<img class="userPageImg"
						src="http://localhost:9090/oaga/upload/${user.userProfileImgUrl}"
						onerror="this.src='/oaga/images/reviewPage/profile_basic.png';"
						alt="...">
				</div>
				<c:choose>
					<c:when test="${empty principal}">
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${result == -1 || empty result}">
								<button class="likebutton" type="button" id="btn-Follow">
									<img class="likebutton-img"
										src="../images/userPage/heart-outline.png">
								</button>
							</c:when>
							<c:otherwise>
								<button class="likebutton" type="button" id="btn-UnFollow">
									<img class="likebutton-img" src="../images/userPage/heart.png">
								</button>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
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
		<div class="li_header">
			<div>
				<h3 class="li_title">${user.userNickName}&nbsp;님이작성한리뷰</h3>
			</div>
		</div>
		<ul>
			<c:forEach var="userReview" items="${userReviews.content}">
				<li class="li_item"><a class="li_item_a"
					href="/oaga/detail/${userReview.id}">
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
			<ul class="pagination">
				<li
					class="page-item btnPrv ${userReviews.first ? passive : Page-item-active}"><a
					class="page-link"
					href="/oaga/userpage_form/${user.id}?page=${pageable.number-1}">Prv</a></li>
				<!-- page-item -->


				<c:forEach var="num" items="${pageNumbers}">
					<c:choose>
						<c:when test="${userReviews.number+1 eq num}">
							<li class="page-item Page-item-active"><a class="page-link"
								href="/oaga/userpage_form/1?page=${num-1}">${num}</a></li>
							<!-- page-item -->
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="/oaga/userpage_form/1?page=${num-1}">${num}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<li
					class="page-item btnNxt ${userReviews.last ? passive : Page-item-active}"><a
					class="page-link"
					href="/oaga/userpage_form/${user.id}?page=${pageable.number+1}">Nxt</a></li>
			</ul>

	</section>

</div>

<script src="../js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>