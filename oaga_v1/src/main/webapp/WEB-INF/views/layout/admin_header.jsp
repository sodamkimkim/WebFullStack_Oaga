<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="${_csrf.parameterName}" content="${_csrf.token}" />
    <meta name="_csrf_header" content="${_csrf.headerName}" />
    <title>OaGa Admin</title>
    <link rel="stylesheet" href="/oaga/css/admin/adminstyle.css" />
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> ﻿<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
    <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal" var="principal" />
    </sec:authorize>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  <style>
    .headerBtn {
      font-size: 12px;
      width: 80px;
    }
  </style>
  <body>
    <header>
      <div class="hWrap">
        <h1>
          <a href="/oaga/admin/admin_mainpage">OaGa Admin</a>
        </h1>
        <ul class="gnb">
          <li class="admin_mainmenu">
            <a href="/oaga/admin/hotplace_save_page">홈페이지 관리</a>
            <ul class="admin_submenu">
              <li><a href="/oaga/admin/hotplace_save_page">추가하기</a></li>
              <li><a href="/oaga/admin/updatepage">수정하기</a></li>
              <li><a href="/oaga/admin/playDeletepage">놀거리 삭제</a></li>
              <li><a href="/oaga/admin/restaurantDeletepage">카페/식당 삭제</a></li>
            </ul>
          </li>
          <li style="margin-left: 50px">
            <a href="/oaga/admin/user">회원정보 관리</a>
          </li>
          <li style="margin-left: 50px">
            <a href="/oaga/qna/qna_home">Q&A</a>
          </li>
        </ul>

        <!-- </li>

				<li style="margin-left: 50px"><a href="/oaga/admin/user">회원정보
						관리</a></li>
				<li class="admin_mainmenu" style="margin-left: 50px"><a
					href="/oaga/admin/report_management_form">리뷰 · 댓글 관리</a>

					<ul class="admin_submenu">
						<li><a href="/oaga/admin/report_management_form">여행리뷰관리</a></li>
						<li><a href="/oaga/admin/report_management_form">댓글관리</a></li>
					</ul></li>
>>>>>>> branch_sodam -->
        <!-- </ul> -->
        <!--gnb-->

        <div class="util">
          <!--srch-->

          <c:choose>
            <c:when test="${empty principal}">
              <!-- 로그인 안된상태 -->
              <button class="headerBtn">
                <a href="/oaga/">사용자페이지</a>
              </button>
              <button class="headerBtn loginBtn">
                <a href="/oaga/admin/admin_login_form ">로그인</a>
              </button>
              <!--login-->

              <button class="headerBtn joinBtn">
                <a href="/oaga/auth/admin_join_page">회원가입</a>
              </button>
              <!--join-->
            </c:when>

            <c:otherwise>
              <button class="headerBtn">
                <a href="/oaga/">사용자페이지</a>
              </button>
              <button class="headerBtn logoutBtn">
                <a href="/oaga/auth/logout">로그아웃</a>
              </button>
            </c:otherwise>
          </c:choose>
        </div>
        <!--util-->
      </div>
      <!--hWrap-->
    </header>
  </body>
</html>
