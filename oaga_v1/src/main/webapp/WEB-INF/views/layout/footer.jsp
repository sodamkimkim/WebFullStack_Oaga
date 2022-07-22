<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!---------------------------------footer-------------------------------------------------------------------------------------->
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
