<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="../css/review/detailstyle.css" />
<!--header----------------------------->

<div class="reviewDetailForm">
	<div class="reviewDetailWrap">
		<div class="reviewDetailHeader">
			<h3 style="color: #f9bb57; font-size: 23px;">여행후기</h3>
			<p>여행을 다녀온 OaGa유저들의 솔직한 여행이야기</p>
		</div>
		<!--reviewDetailHeader-->
		<div class="reviewDetailBody">
			<input type="hidden" id="reviewId" value="${review.id}">
			<h3 class="contentTitle">${review.title}</h3>
			<div class="contentThemeBox">${review.theme}</div>
			<!--contentTitle-->
			<div class="contentMeta">
				<p class="contentMeta_left">구분/지역 : ${review.areaName}</p>
				<p class="contentMeta_right">작성일 : ${review.createDate}</p>
				<p class="contentMeta_right">조회수 : ${review.count}</p>
			</div>
			<!--contnentMeta-->
			<div class="reviewDetail_profile">
				<a class="profile_a"> <img class="profile_img"
					src="../images/reviewPage/profile_basic.png">
				</a>
				<div class="profile_namebox">
					<h6 class="profile_name">${review.user.userNickName}</h6>
				</div>
				<div class="profile_likes">좋아요 : ${review.user.likes}</div>
			</div>

			<div class="contentBody">${review.content}</div>
			<!--contentBody-->
		</div>
		<!--reviewDetailBody-->

		<!--댓글 작성/ 목록-->
		<div class="reply_tbox">
			<h5 class="reply_title">댓글</h5>
		</div>
		<c:choose>
			<c:when test="${empty principal}">
				<div class="reply_sug"><p class="reply_sug_t">로그인 후 댓글을 작성해보세요!</p></div>
			</c:when>
			<c:otherwise>
				<div class="reply_wBox">
					<h4 class="r_nickname">${principal.user.userNickName}</h4>
					<a class="r_picture" href="#"> <img class="r_picture_img"
						alt="" src="../images/reviewPage/ico_camera.png">
					</a>
					<textarea id="reply-content" class="r_textArea" rows="1"
						placeholder="댓글을 입력하세요"></textarea>
					<button type="button" class="r_savebtn" id="btn-reply-save">등록</button>
				</div>
			</c:otherwise>
		</c:choose>
		<c:forEach var="reply" items="${review.replies}">
			<div class="replysec">
				<div class="replyBox">
					<img class="reply_image" alt=""
						src="../images/reviewPage/profile_basic.png">
					<div class="reply_i">
						<h4 class="reply_u">${reply.user.userNickName}</h4>
						<h6 class="reply_t">${reply.timestamp}</h6>
					</div>
					<c:if test="${principal.user.id eq reply.user.id}">
						<button type="button" onclick="index.replyDelete(${reply.id});"
							id="btn-reply-delete" class="reply_d">삭제</button>
					</c:if>
				</div>
				<!-- replyBox -->
				<div class="reply_c">${reply.content}</div>
			</div>
			<!-- replysec -->
		</c:forEach>

		<div class="reviewDetailFooter">
			<button class="reviewDetailFooter_btn">
				<a href="#">목록</a>
			</button>
		</div>
		<!--reviewDetailFooter-->
	</div>
	<!--reviewDetailWrap-->
</div>
<!--reviewDetailForm-->
<%@ include file="../layout/footer.jsp"%>

<script src="../js/review.js"></script>

</html>