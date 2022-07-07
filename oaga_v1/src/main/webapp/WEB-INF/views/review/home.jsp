<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <div class="page silver logged_box">
		<div class="wrap logged">
		<img class="logged_user_img" src="/images/reviewPage/profile_basic.png" onerror="this.src='/images/reviewPage/profile_basic.png';">
		<div class="logged_left">
			<div class="logged_name">임희진</div>
			<div class="clear"></div>
			<a href="/ko/mypage/et_2207050522410907249001657009361?type=clipboard" class="logged_cnt_box logged_clip">
				<b>작성한 리뷰</b>
				<span>0</span>
			</a>
			<div class="logged_line">&nbsp;</div>
			<a href="/ko/mypage/et_2207050522410907249001657009361?type=plan" class="logged_cnt_box logged_plan">
				<b>좋아요</b>
				<span>0</span>
			</a>
			<div class="logged_line">&nbsp;</div>
			<a href="/ko/mypage/et_2207050522410907249001657009361?type=my_qa" class="logged_cnt_box logged_qa">
				<b>Q&amp;A</b>
				<span>0</span>
			</a>
				<div class="clear"></div>
			</div>
			<div class="logged_btn">
          <div class="logged_btn_ico">
            <img src="/images/reviewPage/ico_review.png" />
          </div>
          리뷰 작성
        </div>
		<div class="clear"></div>
	</div>
</div>
<!-- ================================================ -->
	
	<div class="review_search">
		<div class="wrap">
			<h5 class="review_search_title">리뷰 검색하기</h5>
			<p class="review_search_coment">지역명을 검색하여 가고싶은 지역의 리뷰를 찾아보세요</p>
      			<select class="form-control" id="sel1" name="sellist1">
        			<option>지역명</option>
        			<option>사용자</option>
      			</select>
			<div class="review_search_area">
				<input class="review_search_input" id="" placeholder="지역명으로 검색">
			</div>
		</div>
	</div>
	
	
<%@ include file="../layout/footer.jsp"%>
