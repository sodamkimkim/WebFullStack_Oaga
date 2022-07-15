<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>OaGa</title>
  
  <link rel="stylesheet" href="css/review/detailstyle.css" />
</head>

<body>
  <header>
    <div class="hWrap">
      <h1>
        <a href="/oaga">OaGa</a>
      </h1>
      <ul class="gnb">
        <li><a href="#">여행지정보보기</a></li>
        <li><a href="/oaga/review">리뷰보기</a></li>
        <li><a href="#">커뮤니티</a></li>
      </ul>
      <!--gnb-->

      <div class="util">
        <form class="srch">
          <input type="text" placeholder="여행지를 찾아보세요" />
          <button class="Q1"><img src="images/mainpage/icon_search2.png" alt="" /></button>
        </form>
        <!--srch-->

        <button class="login">
          <a href="/oaga/login_form">로그인</a></button>
        <!--login-->

        <button class="join">
          <a href="/oaga/join_form">회원가입</a></button>
        <!--join-->
      </div>
      <!--util-->
    </div>
    <!--hWrap-->
  </header>
  <!--header----------------------------->
  <div class="reviewDetailForm">
    <div class="reviewDetailWrap">
      <div class="reviewDetailHeader">
        <h3>여행후기</h3>
        <p>여행을 다녀온 OaGa유저들의 솔직한 여행이야기</p>
      </div>
      <!--reviewDetailHeader-->
      <div class="reviewDetailBody">
        <h3 class="contentTitle">부산 3박4일 여행 (가족여행)</h3>
        <!--contentTitle-->
        <div class="contentMeta">
          <p class="contentMeta_left">구분/지역 : 부산</p>
          <p class="contentMeta_right">작성일 :</p>
        </div>
        <!--contnentMeta-->

        <div class="contentBody">
          <div class="contentBody_row1">
            <div class="OagaPlace"><a href="#">[사진] 리뷰 작성할 때 선택한 OaGa의 Places</a></div>
            <div class="OagaPlace"><a href="#">[사진] 리뷰 작성할 때 선택한 OaGa의 Places</a></div>
            <span></span>
          </div>
          <!--contentBody_row1-->
          <div class="contentBody_row2">
            <p>
              자유롭게 글dddd
              작성dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
            </p>
          </div>
          <!--contentBody_row2-->
        </div>
        <!--contentBody-->
      </div>
      <!--reviewDetailBody-->

      <div class="reviewDetailFooter">
        <button class="reviewDetailFooter_btn"><a href="#">목록</a></button>
      </div>
      <!--reviewDetailFooter-->
    </div>
    <!--reviewDetailWrap-->
  </div>
  <!--reviewDetailForm-->
  <!--footer----------------------------->
  <!-- <link rel="stylesheet" href="css/review/reviewdetailstyle.css -->
  <footer>
    <div class="fWrap">
      <div class="ftrow1">
        <div class="box">
          <ul class="ub1">
            <h4>오늘어디가지</h4>
            <li>여행지</li>
            <li>여행리뷰보기</li>
            <li>커뮤니티</li>
          </ul>
          <!--ub1-->
        </div>
        <!--box-->

        <div class="box">
          <ul class="ub2">
            <h4>회사이야기</h4>
            <li>회사소개</li>
            <li>이용방법</li>
            <li>광고 및 제휴</li>
          </ul>
          <!--ub2-->
        </div>
        <!--box-->

        <div class="box">
          <ul class="ub3">
            <h4>고객센터</h4>
            <li><a href="01050270220">051-0000-0000</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">게시판으로문의하기</a></li>
            <li>이용약관</li>
            <li>개인정보 취급방침</li>
          </ul>
          <!--ub3-->
        </div>
        <!--box-->

        <div class="box">
          <div class="con_lang">
            <div class="lang">
              <a href="#" class="default">한국어</a>
              <ol class="langPop">
                <!--order list-->
                <li><a href="#">English</a></li>
                <li><a href="#">日本語</a></li>
                <li><a href="#">中文</a></li>
              </ol>
            </div>
            <!--lang-->
          </div>
          <!--con_lang-->

          <div class="icon">
            <img class="ico1" src="images/mainpage/sns_fb.png" alt="" />
            <img src="images/mainpage/sns_nv.png" alt="" />
          </div>
          <!--icon-->
        </div>
        <!--box-->
      </div>
      <!--ftrow1-->
    </div>
    <!--fWrap-->
    <div class="footerbottom">
      <div class="fWrap ftrow2">
        <p class="lefttxt">Copyright ⓒ 2022 Earthtory.com???, All Rights Reserved.</p>
        <p class="righttxt">제휴문의: theka265@gmail.com | 051-0000-0000</p>
      </div>
      <!--fWrap ftrow2-->
    </div>
    <!--footerbottom-->
  </footer>
  <script>
    //선택자 잡기
    let lang = document.querySelector(".lang");
    let langPop = document.querySelector(".langPop");

    lang.addEventListener("click", function () {
      langPop.style.display = "block";
    }); //이벤트 설정

    let onOff = true;

    lang.addEventListener("click", function () {
      onOff = !onOff;

      if (onOff == false) {
        langPop.style.display = "block";
      } else {
        langPop.style.display = "none";
      }
    });
  </script>
</body>

</html>