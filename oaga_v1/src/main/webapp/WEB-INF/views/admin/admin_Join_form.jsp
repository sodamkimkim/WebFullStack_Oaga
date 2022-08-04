<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>login_form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--  <link rel="stylesheet" href="css/user/joinstyle.css" /> -->
    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
      }

      ul {
        list-style: none;
      }

      a {
        text-decoration: none;
        color: inherit;
      }

      .main {
        width: 100%;
        height: 100vh;
        user-select: none;
      }

      .mWrap {
        width: 500px;
        padding-top: 100px;
        margin-left: auto;
        margin-right: auto;
      }

      h1 {
        text-align: center;
        margin-bottom: 30px;
        color: rgba(6, 47, 74, 0.9);
      }

      .formRow1 {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 0px;
      }

      .formRow1 input {
        width: 300px;
        height: 20px;
        margin-bottom: 36px;
        border-top: transparent;
        border-left: transparent;
        border-right: transparent;
        border-bottom: 1px solid rgba(3, 3, 3, 0.4);
        font-size: 11px;
        text-indent: 3px;
        background-color: transparent;
        color: rgba(3, 3, 3, 0.4);
      }

      .formRow2 {
        text-align: center;
      }

      .formRow2 .btn_join {
        width: 280px;
        height: 30px;
        border-radius: 5px;
        border: transparent;
        font-weight: bold;
        color: #fff;
        font-size: 14px;
        /* background-color: #f5a119;
  opacity: 0.9; */
        background-color: rgba(6, 47, 74, 0.9);
      }

      .formRow2 .btn_join:hover {
        cursor: pointer;
      }

      footer {
        margin-top: 20px;
      }

      .fWrap {
        padding-top: 10px;
        font-size: 10px;
        text-align: center;
        color: rgba(3, 3, 3, 0.6);
        line-height: 1.8;
      }

      .fWrap p:nth-child(2) {
      }

      .fWrap {
        width: 500px;
        height: 70px;
        margin-left: auto;
        margin-right: auto;
      }

      .userProfileWrap {
        display: flex;
        flex-direction: column;
      }


      .userProfileWrap label {
        margin-top: 10px;
        margin-bottom: 15px;
        font-size: 16px;
        color: #333;
      }
    </style>
  </head>
  <body>
    <div class="main">
      <div class="wrap mWrap">
        <h1>
          <a href="/oaga">OaGa</a>
        </h1>
        <div class="con">
          <form action="/oaga/auth/admin_join" method="post" enctype="multipart/form-data">
          <input type="hidden" name ="${_csrf.parameterName}" value = "${_csrf.token}">
            <!-- csrf???? xss -->
            <div class="formRow1">
              <input type="text" class="form-input" placeholder="Enter ID" id="username" name="username" /> <input type="password" class="form-input" placeholder="Enter password" id="password" name="password" /> <br />
              <input type="text" class="form-input" placeholder="Enter name" id="userNickName" name="userNickName" />
              <input type="email" class="form-input" placeholder="Enter email" id="email" name="email" />
              <div class="userProfileWrap">
                <label class="lblUserProfileFile" for="userProfileFile">관리자 프로필 등록: </label> <input type="file" name="file" placeholder="upload user-Profile" class="form-input" id="userProfileFile" />
              </div>
            </div>
            <!--formRow1-->
            <div class="formRow2">
              <button type="submit" id="btn_join" class="btn btn_join">관리자 회원가입</button>
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
