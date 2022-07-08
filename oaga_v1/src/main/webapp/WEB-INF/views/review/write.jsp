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
<hr />
<div class="t_box">
	<div>
		<div>
			<h3 class="title">MY여행리뷰 작성</h3>
		</div>
		<div class="t_btn">
			<button class="write_btn">임시 저장</button>
			<button class="write_btn">등록</button>
			<button class="write_btn">삭제</button>
		</div>
		<div style="display: flex">
			<div class="place">여행지 :</div>
			<input class="i_place" placeholder="여행지를 입력하세요">
		</div>
		<div class="t_check">
			<!-- 라디오 버튼 구현하기 -->
			<input type="radio" id="ex_rd1"> <label for="ex_rd1">가족
				여행</label> <input type="radio" id="ex_rd2"> <label for="ex_rd2">친구와
				함께</label>

		</div>
	</div>

	<div class=""></div>
	<div class="c_box">
		<div id="">
			<textarea id="summernote">
			
			</textarea>
		</div>

	</div>
</div>

<!-- 리뷰 작성 내용 -->



<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 550,
			placeholder : '내용을 작성해 주세요'
		});

	});
</script>


<%@ include file="../layout/footer.jsp"%>