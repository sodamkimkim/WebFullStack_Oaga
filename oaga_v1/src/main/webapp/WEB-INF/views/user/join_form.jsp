<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>login_form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/user/joinstyle.css" />
  </head>
  <body>
    <div class="main">
      <div class="wrap mWrap">
        <h1><a href="#">OaGa</a></h1>
        <div class="con">
          <form action="" method="post">
            <div class="formRow1">
              <input type="text" class="form-input" placeholder="Enter ID" id="userID" name="userID" />
              <input type="password" class="form-input" placeholder="Enter password" id="password" name="password" />
              <input type="email" class="form-input" placeholder="Enter email" id="email" name="email" />
            </div>
            <!--formRow1-->
            <div class="formRow2">
              <button type="submit" id="btn_join" class="btn btn_join">회원가입</button>
            </div>
          </form>
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
