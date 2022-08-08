<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/oaga/css/mytraveler/homestyle.css" />

	<!-- 이번달 베스트 리뷰어 (이번달에 받은 좋아요 수가 가장 많은 회원 순으로 데이터 조회)-->
	<section class="myt-sec1">
		<div class="sec1Wrap">
			<div class="best-title">
				<img class="best-title-img" src="/oaga/images/reviewPage/crown.png">
				<div class="title">이번 달 베스트 리뷰어</div>
			</div>
			<div class="best-subtitle">
				<div class="subtitle">이번달에 좋아요를 가장 많이 받은 인기 리뷰어</div>
				<div class="arrow-btn-div">
					<button type="button" class="arrow-btn m-btn">
						<span>
							<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><g fill="none"><path d="m20 28-11.29289322-11.2928932c-.39052429-.3905243-.39052429-1.0236893 0-1.4142136l11.29289322-11.2928932">
							</path>
							</g>
							</svg>
						</span>
					</button>
					<button type="button" class="arrow-btn p-btn">
						<span>
							<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><g fill="none"><path d="m12 4 11.2928932 11.2928932c.3905243.3905243.3905243 1.0236893 0 1.4142136l-11.2928932 11.2928932">
							</path>
							</g>
							</svg>
						</span>
					</button>
				</div>
			</div>
			
				<div class="best-list">
				<!-- 1 -->
				<c:forEach var="userList" items="${bestUserList}" varStatus="status">
					<div class="item-div" onclick="">
					<span class="css-1juk5to-RankNumber">${status.index + 1}</span>
					<img class="item-img" src="http://localhost:9090/oaga/upload/${userList.userProfileImgUrl}" onerror="this.src='images/reviewPage/profile_basic.png';">
				</div>
				</c:forEach>
				<!-- 1 -->
			</div>
			
		</div>
	</section>
	<!-- 내가 좋아요 누른 사용자들 -->
	<section class="myt-sec2">
		<div class="sec1Wrap">
			<div class="my-title">
				<div class="title-2">내가 좋아요 누른 리뷰어</div>
				<div class="arrow-btn-div">
						<button type="button" class="arrow-btn my-m-btn">
							<span>
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><g fill="none"><path d="m20 28-11.29289322-11.2928932c-.39052429-.3905243-.39052429-1.0236893 0-1.4142136l11.29289322-11.2928932">
								</path>
								</g>
								</svg>
							</span>
						</button>
						<button type="button" class="arrow-btn my-p-btn">
							<span>
								<svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="presentation" focusable="false" style="display: block; fill: none; height: 12px; width: 12px; stroke: currentcolor; stroke-width: 4; overflow: visible;"><g fill="none"><path d="m12 4 11.2928932 11.2928932c.3905243.3905243.3905243 1.0236893 0 1.4142136l-11.2928932 11.2928932">
								</path>
								</g>
								</svg>
							</span>
						</button>
					</div>
			</div>
			<div class="my-list">
				<!-- 1 -->
				<c:forEach var="following" items="${followingList}">
					<div class="list-item">
					<img class="mylist-img" src="http://localhost:9090/oaga/upload/${following.followedUser.userProfileImgUrl}">
					<h3>${following.followedUser.userNickName}</h3>
				</div>
				</c:forEach>
				
				<!-- 1 -->
			</div>
		</div>
		
	</section>
	<!-- 내가 좋아요한 사용자들의 리뷰 리스트 -->
	<section class="myt-sec3">
		<div class="sec3Wrap">
			<div class="review-div">
				<div class="title-2">내 리뷰어들의 최근 리뷰</div>
				<div class="subtitle">나와 여행 취향이 비슷한 회원들의 리뷰를 참고하여 더욱 즐겁고 완벽한 여행을 계획하세요!</div>
				<div class="list-row">
				<c:forEach var="review" items="${reviewList.content}">
					<div class="box">
					<a href="#">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${review.reviewImageUrl}" />
							<div class="txt">
								<p>${review.title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${review.areaName}</li>
								<li class="withFriend">${review.theme}</li>
								<li class="userName">${review.user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="location">25</li>
								<li class="view">조회수</li>
								<li class="copy">27</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>
				<!--box-->
					
				</c:forEach>
								
				</div>
			</div>
		</div>
	</section>

<script type="text/javascript">
	$(".p-btn").click(function() {
		var scrollPosition = $(".best-list").scrollLeft();
		$(".best-list").animate({
			scrollLeft: scrollPosition + 500
		}, 'slow');
	})
	
	$(".m-btn").click(function() {
		var scrollPosition = $(".best-list").scrollLeft();
		$(".best-list").animate({
			scrollLeft: scrollPosition - 500
		}, 'slow');
	})
	
	$(".my-p-btn").click(function() {
		var scrollPosition = $(".my-list").scrollLeft();
		$(".my-list").animate({
			scrollLeft: scrollPosition + 500
		}, 'slow');
	})
	
	$(".my-m-btn").click(function() {
		var scrollPosition = $(".my-list").scrollLeft();
		$(".my-list").animate({
			scrollLeft: scrollPosition - 500
		}, 'slow');
	})
</script>
<%@ include file="layout/footer.jsp"%>