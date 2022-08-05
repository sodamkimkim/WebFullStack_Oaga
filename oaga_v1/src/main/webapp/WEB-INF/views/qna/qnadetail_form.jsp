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
</style>


<div class=qnadetail_wrap>
	<h3>나의 QnA</h3>
	<div>
		<p class="subtitle">
			<span>OaGa</span> 서비스 이용에 대하여<br /> 궁금한 점이나 문의사항을 등록해주시면 빠른 시간 내에
			답변해 드리겠습니다.
		</p>
	</div>


	<table border="0.5" cellspacing="0" cellpadding="20px;">

		<c:forEach var="qnadetailList" items="${qnadetailList}">
			<input type="hidden" id="qnaId" value="${qnadetailList.id}">
			<button id="QnA_delete" class="deletebtn">삭제하기</button>

			<button class="updatebtn" id="QnA_update"><a href="/oaga/qna/qnaupdateform/${qnadetailList.id}" >수정하기</a></butotn>

			<tr>
				<td colspan="1">게시물등록번호</td>
				<td colspan="3">${qnadetailList.id}</td>
			</tr>
			<tr>
				<td colspan="1">제목</td>
				<td colspan="3">${qnadetailList.title}</td>
			</tr>

			<tr>
				<td colspan="1">작성자</td>
				<td colspan="3">${qnadetailList.user.userNickName}</td>
			</tr>
			<tr>
				<td colspan="1">내용</td>
				<td colspan="3">${qnadetailList.content}</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<br>

	<div class="adminrelply">
		<h5 style="font-weight: bold; font-size: 20px;">답글</h5>
	</div>
	<br>
	<textarea rows="10" style="width: 100%;"></textarea>
	<br> <br>

	<button
		style="cursor: pointer; margin-left: 20px; width: 64px; height: 28px; border: transparent; color: #fff; border-radius: 5px; background-color: #f9bb57; float: right;">작성하기</button>

	<br> <br> <br>

</div>
<!-- qnadetailWrap -->
<script src="../../js/qna.js"></script>
<%@ include file="../layout/footer.jsp"%>
