<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


	<!-- background: url("/images/reviewPage/review_bg.jpg")  -->
	<div class="review_search">
		<div class="wrap">
			<h5 class="review_search_title">보고싶은 리뷰를 검색하여 가고싶은 지역의 후기를 찾아보세요</h5>
			
			
			<!-- 사진이나 화면 추가 -->
			<p class="review_search_coment">리뷰 검색하기</p>
				<div class="review_search_area">
				<select class="review_search_select" id="" name="">
        			<option>지역명</option>
        			<option>사용자</option>
      			</select>
				<input class="review_search_input" id="" placeholder="지역명으로 검색">
			</div>
		</div>
	</div>

    <div class="page silver logged_box">
		<div class="wrap logged">
		<img class="logged_user_img" src="images/reviewPage/profile_basic.png" onerror="this.src='images/reviewPage/profile_basic.png';">
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
            <img src="images/reviewPage/ico_review.png" />
          </div>
          리뷰 작성
        </div>
		<div class="clear"></div>
	</div>
	</div>
	
<!-- 베스트 리뷰 리스트 ================================================ -->
	


<section class="sec2">
      <div class="secWrap">
      	<h3 style="color: #f9bb57">여행 리뷰 한눈에 보기</h3>
        <p class="tit">베스트 리뷰와 가장 최근에 작성된 리뷰를 볼 수 있어요</p>
        <div class="review_option">
      <div class="sort on" data-id="po">인기</div>
      <div class="sort_line"></div>
      <div class="sort" data-id="regdate">신규</div>
   	</div>

        <div class="row1">
          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan01.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->

          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan02.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->

          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan03.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->
        </div>
        <!--row1-->

        <div class="row2">
          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan04.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->

          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan05.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->

          <div class="box">
            <a href="#">
              <div class="ImgBox">
                <img src="images/mainpage/plan06.jpg" alt="" />
                <div class="txt">
                  <h4>2018-09-13 <span> 7DAYS</span></h4>
                  <p>여행제목 작성하기</p>
                </div>
                <!--txt-->
              </div>
              <!--ImgBox-->

              <div class="data">
                <ul class="info">
                  <li class="withFriend">친구와 함께</li>
                  <li class="placeName">장소 이름</li>
                  <li class="userName">작성자</li>
                </ul>
                <!--info-->

                <ul class="count">
                  <li class="location">25</li>
                  <li class="view">300</li>
                  <li class="copy">27</li>
                </ul>
                <!--view-->
              </div>
              <!--data-->
            </a>
          </div>
          <!--box-->
        </div>
        <!--row2-->

        <div class="more">56,065개의 여행리뷰 모두보기</div>
      </div>
      <!--secWrap-->
    </section>
    <!--sec2-->
	<!-- ==================================================================================== -->
	
	
	
	
	
	
<%@ include file="../layout/footer.jsp"%>