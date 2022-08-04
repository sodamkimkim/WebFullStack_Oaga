<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OaGa</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link rel="stylesheet" href="/oaga/css/qna/qnawriteStyle.css" />
</head>
<body>

	<div class="qnadetail_row1">
		<div class="wrap">
			<div class="wrapbody" style="">

				<div class="q_box">
					<h3 class="title">Q&A 작성</h3>
					<form action="">
					
					<button type="submit" class="qwrite_btn" id="btn-save" value="DONE">등록</button>
					<div class="titlebox" style="display: flex">
						<div class="place">제목 : </div>
						<input class="i_place" id="r_title" name="title"
							placeholder="제목을 입력하세요">
						<input class ="i_password" type="password"  id = "password" name = "password" placeholder="비밀번호 5글자 이내로 작성해주세요">
						
					</div>
					<div class="c_box" >
						<textarea class="summernote" id="content" name="content"></textarea>
					</div>
					</form>
				</div>
			</div>


			<!-- 리뷰 작성 내용 -->



		</div>
		<!-- wrap -->
	</div>
	<!-- qnadetail_row1 -->

	<script>
		$(document).ready(function() {
			$('.summernote').summernote({
				height : 900,
				tabsize : 5,
				placeholder : '내용을 작성해 주세요'
			});

		});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- include summernote css/js -->
<script src="../js/qna.js"></script>
</body>
</html>


<%-- <%@ include file="../layout/footer.jsp"%> --%>
