<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="css/review/writestyle.css" />
<!-- 리뷰 작성 타이틀 -->
<hr/>
<div class="t_box">
	<h3 class="title">여행리뷰 작성하기</h3>
	
	<div class="c_box">
	<div id="summernote"></div>

</div>
</div>

<!-- 리뷰 작성 내용 -->



<script>
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>


<%@ include file="../layout/footer.jsp"%>