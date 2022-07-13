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
<div style="background-color: rgba(240,240,240,0.8);">
	<div class="r_sec">
	<div class="r_box">
		<div>
			<h3 class="title">MY여행리뷰 작성</h3>
		</div>
		<div class="t_btn">
			<button class="write_btn" id="btn-t-save" value="ING">임시 저장</button>
			<button class="write_btn" id="btn-save" value="DONE">등록</button>
		</div>
		<div style="display: flex">
			<div class="place">여행지 :</div>
			<input class="i_place" id="r_place" name="r_place" placeholder="여행지를 입력하세요">
		</div>
		
		<div style="display: flex">
			<div class="place">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</div>
			<input class="i_place" id="r_title" name="r_title" placeholder="제목을 입력하세요">
		</div>

		<div class="t_check">
			<!-- 라디오 버튼 구현하기 -->
			<div class="t_title">여행 테마 :</div>
			<div>
				<input type="radio" name="r_theme" value="SOLE" id="ex_rd1"> 
				<label class="t_radio"for="ex_rd1">나홀로 여행</label> 
				<input type="radio" name="r_theme" value="FAMILY" id="ex_rd2">
				<label class="t_radio" for="ex_rd2">가족 여행</label> 
				<input type="radio" name="r_theme" value="FRIEND" id="ex_rd3"> 
				<label class="t_radio"for="ex_rd3">친구와 함께</label> 
				<input type="radio" name="r_theme" value="COUPLE" id="ex_rd4">
				<label class="t_radio" for="ex_rd4">연인과 함께</label> 
				<input type="radio" name="r_theme" value="BUSINESS" id="ex_rd5"> 
				<label class="t_radio" for="ex_rd5">비즈니스 여행</label>
			</div>

		</div>
		<div class=""></div>
		<div class="c_box">
			<div id="">
				<textarea class="summernote" id="content" name="content">
			
			</textarea>
			</div>

		</div>
	</div>


</div>
</div>


<!-- 리뷰 작성 내용 -->



<script>
	$(document).ready(function() {
		$('.summernote').summernote({
			height : 550,
			tabsize: 5,
			placeholder : '내용을 작성해 주세요'
		});

	});
</script>

<script src="js/review.js"></script>

<%@ include file="../layout/footer.jsp"%>