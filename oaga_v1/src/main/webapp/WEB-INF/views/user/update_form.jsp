<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> ﻿<%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>사용자 정보 수정</title>
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
        color: rgba(245, 161, 25, 0.9);
      }

      .formRow1 {
        margin-bottom: 0px;
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      .formRow1 div {
        display: flex;
        width: 80%;
      }

      .formRow1 div label {
        display: block;
        font-size: 12px;
        padding-left: 2px;
        width: 15%;
      }

      .formRow1 input {
        width: 85%;
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

      .formRow2 .btn_userInfoUpdate {
        margin-top: 15px;
        width: 280px;
        height: 30px;
        border-radius: 5px;
        border: transparent;
        font-weight: bold;
        color: #fff;
        font-size: 14px;
        /* background-color: #f5a119;
  opacity: 0.9; */
        background-color: rgba(245, 161, 25, 0.9);
      }

      .formRow2 .btn_userInfoUpdate:hover {
        cursor: pointer;
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
          <form action="" method="post">
            <!-- csrf???? xss -->
            <div class="formRow1">
              <div class="update_lbl_Input">
                <label class="update_lbl" for="username"> ID: </label>
                <input type="text" class="form-input" value="${principal.user.username}" id="username" name="username" readonly="readonly" />
              </div>
              <c:if test="${empty principal.user.oauth}">
                <div class="update_lbl_Input">
                  <label class="update_lbl" for="password"> Password: </label>
                  <input type="text" class="form-control" value="" id="password" name="password" />
                </div>
                <br />
                <div class="update_lbl_Input">
                  <label class="update_lbl" for="userNickName"> 이름: </label>
                  <input type="text" class="form-input" value="${principal.user.userNickName}" id="userNickName" name="userNickName" />
                </div>
                <div class="update_lbl_Input">
                  <label class="update_lbl" for="email"> E-mail: </label>
                  <input type="email" class="form-control" value="${principal.user.email}" id="email" name="email" />
                </div>
              </c:if>
            </div>
            <!--formRow1-->
          </form>
            <div class="formRow2">
              <button type="button" id="btn_userInfoUpdate" class="btn btn_userInfoUpdate">정보 수정 완료</button>
            </div>
        </div>
        <!--con-->
      </div>
      <!--mWrap-->
    </div>
    <!--main-->
  <script src="/js/user.js"></script>
  </body>
</html>
