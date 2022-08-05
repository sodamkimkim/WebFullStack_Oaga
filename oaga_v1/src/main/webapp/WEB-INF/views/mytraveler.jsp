<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>

<div class="">
	<!-- 이번달 베스트 리뷰어 (이번달에 받은 좋아요 수가 가장 많은 회원 순으로 데이터 조회)-->
	<section class="sec_reviewer">
		<div class="div_reviewer">
			<h3 class="best_reviewer_title">베스트 리뷰어</h3>
			<p
				style="font-size: 16px; text-align: center; color: #666; margin-bottom: 30px; line-height: 1;">좋아요를
				가장 많이 받은 베스트 리뷰어들</p>
			<div class="best_reviewer_box">
				<div style="display: flex; margin: 0 auto;">

					<c:forEach var="bestuser" items="${bestUser}" varStatus="status">
						<div class="box" style="display: flex;">

							<a class="best_reviewer_a" onclick="checkMyPage(${bestuser.id});">
								<input type="hidden" value="${principal.user.id}" id="myId">
								<img
								src="http://localhost:9090/oaga/upload/${bestuser.userProfileImgUrl}"
								onerror="this.src='images/reviewPage/profile_basic.png';"
								class="best_reviewer_profile" style="cursor: pointer;"> <img
								class="medal-img"
								src="/oaga/images/reviewPage/medal-${status.index + 1}.png"
								onerror="this.style.display='none';">
								<div class="like-Box">
									<img class="best_reviewer_icon"
										src="/oaga/images/userPage/heart.png"> <span>&nbsp;${bestuser.likes}</span>
								</div>
							</a>
						</div>
					</c:forEach>


				</div>


			</div>
		</div>
	</section>
	<!-- 내가 좋아요 누른 사용자들 -->

	<!-- 내가 좋아요한 사용자들의 리뷰 리스트 -->
</div>

<%@ include file="layout/footer.jsp"%>