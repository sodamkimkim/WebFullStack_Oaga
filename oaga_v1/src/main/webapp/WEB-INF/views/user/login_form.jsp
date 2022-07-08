<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>login_form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/user/loginstyle.css" />
  </head>
  <body>
    <div class="main">
      <div class="wrap mWrap">
        <h1><a href="/oaga">OaGa</a></h1>
        <div class="con">
          <form action="" method="post">
            <div class="formRow1">
              <input type="text" class="form-input" placeholder="Enter ID" id="userID" name="userID" />
              <input type="password" class="form-input" placeholder="Enter password" id="password" name="password" />
            </div>
            <!--formRow1-->

            <div class="formRow2">
              <button type="submit" id="btn_login" class="btn btn_login">로그인</button>
              <a class="btn btn_kakao" href="#">카카오아이디로 로그인</a>
            </div>
            <!--formRow2-->
          </form>
          <p>혹시, OaGa가 처음이신가요? <a href="#">회원가입</a></p>
        </div>
        <!--con-->
      </div>
      <!--mWrap-->
      <footer>
        <div class="wrap fWrap">
          <p>Copyright ⓒ 2022 OaGa.com, All Rights Reserved.</p>
          <p>제휴문의: theka265@gmail.com | 051-0000-0000</p>
        </div>
        <!--footerWrap-->
      </footer>
    </div>
    <!--main-->
  </body>
</html>

