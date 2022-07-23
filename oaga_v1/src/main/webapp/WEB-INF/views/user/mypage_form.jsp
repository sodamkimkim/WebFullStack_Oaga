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
					<a href="/oaga/user/updateuserinfo_form">회원정보 수정하기 </a>
				</button>

				<button class="editUserProfile btn">
					<a href="/oaga/user/updatemyprofile_form">회원 프로필 수정하기</a>
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
					<b>좋아요</b> <span id="likes_btn">${principal.user.likes}</span>
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

			</c:forEach>

		</ul>
		<ul class="pagination">
			<li class="page-item btnPrv ${myReviews.first ? passive : Page-item-active}"><a class = "page-link" href="/oaga/mypage_form?page=${number-1}">Prv</a></li>
			<!-- page-item -->
			
			
			<c:forEach var = "num" items = "${pageNumbers}">
				<c:choose>
					<c:when test = "${myReviews.number+1 eq num}">
						<li class="page-item Page-item-active"><a class = "page-link" href="/oaga/mypage_form?page=${num-1}">${num}</a></li>
						<!-- page-item -->
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class = "page-link" href="/oaga/mypage_form?page=${num-1}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
					
			<li class="page-item btnNxt ${myReviews.last ? passive : Page-item-active}"><a class = "page-link" href="/oaga/mypage_form?page=${pageable.number+1}">Nxt</a></li>
			<!-- page-item -->
		</ul>
	</section>

</div>

<!-- 모달 창 생성 (자신을 좋아요한 사람을 볼 수 있음) -->
<div id="modal" class="modal">
	<div class="modal_group_box">
		<div class="list-group">
			<div>
				<img src="" alt="">
				<h5>좋아요</h5>
				<img src="" alt="">
			</div>
			<div class="list-group-item">
				<label><a href="#"></a>가나다</label>
			</div>
			<div class="list-group-item">
				<label><a href="#"></a>라마바</label>
			</div>
			<div class="list-group-item">
				<label><a href="#"></a>사아자</label>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#likes_btn").on("click", e => {
		console.log("asdasd");
		modal.style.display = "flex";
	})
	
	$("#modal").on("click", e => {
		const evTarget = e.target
		if(evTarget.classList.contains("modal")) {
			modal.style.display = "none"
			console.log("aa");
		}
	})
</script>

<%@ include file="../layout/footer.jsp"%>
