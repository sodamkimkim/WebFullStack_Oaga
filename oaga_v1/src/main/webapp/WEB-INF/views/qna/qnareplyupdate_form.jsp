<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/oaga/css/qna/qnadetailStyle.css" />


<style>
.deletebtn {
	cursor: pointer;
	margin-left: 20px;
	width: 64px;
	height: 28px;
	border: transparent;
	color: #fff;
	margin-bottom: 10px;
	border-radius: 5px;
	background-color: red;
	float: right;
}

.updatebtn {
	cursor: pointer;
	margin-left: 20px;
	width: 64px;
	height: 28px;
	border: transparent;
	color: #fff;
	margin-bottom: 10px;
	border-radius: 5px;
	background-color: green;
	float: right;
}

.replyBtn {
	cursor: pointer;
	margin-left: 20px;
	width: 64px;
	height: 28px;
	border: transparent;
	color: #fff;
	border-radius: 5px;
	background-color: #f9bb57;
	float: right;
}

.appendreply {
	width: 1000px;
	height: 300px;
	border: 1px solid rgba(51, 51, 51, 0.2);
}

.replyuserNickNamediv {
	display: flex;
	justify-content: flex-start;
	width: 100%;
	border-bottom: 1px solid rgba(51, 51, 51, 0.2);
	height: 60px;
}

.replyuserNickNamediv div {
	display: flex;
	justify-content: flex-start;
	align-items: center;
}

.replyuserNickNamediv div p {
	margin-left: 15px;
}

.replyuserNickName {
	width: 149.69px;
	height: 60px;
	border-right: 1px solid rgba(51, 51, 51, 0.2);
	background-color: rgba(51, 51, 51, 0.1);
}

.adminNickName {
	width: 350.31px;
	height: 60px;
}

.replyuserNickName span {
	
}
</style>


<div class=qnadetail_wrap>

	<hr>
	<br>

	<div class="adminrelply">
		<h5 style="font-weight: bold; font-size: 20px;">답글</h5>
		
		
		
			<c:forEach var="replyupdate" items="${replyupdate}">
			<input type="hidden" value="${replyupdate.id}" id="replyid">
			<br>
			<div class="appendreply">
				<div class=replyuserNickNamediv>
					<div class=replyuserNickName>
						<p>작성자 :</p>
					</div>
					<div class="adminNickName">
						<p>${replyupdate.user.userNickName}</p>
					</div>
					<div class=replyuserNickName>
						<p>글작성 일 :</p>
					</div>
					<div class="adminNickName">
						<p>${replyupdate.createDate}</p>
					</div>
				</div>
				<div>
					<textarea style="width: 100%; height: 240px; resize: none "  id="content">${replyupdate.content} </textarea>
					<div style="margin-top: 170px;">
					</div>
				</div>
			</div>
			<br>
		</c:forEach>
	</div>
	<br>	
	<br> <br>

	<button class="replyBtn" id="btn-qna-reply-update">수정하기</button>

	<br> <br> <br>

</div>
<!-- qnadetailWrap -->
<script src="../../js/qna.js"></script>
<%@ include file="../layout/footer.jsp"%>
