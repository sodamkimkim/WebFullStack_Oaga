
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
﻿<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OaGa</title>
<link rel="stylesheet" href="css/style.css" />
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<header>
		<div class="hWrap">
			<h1>
				<a href="/oaga">OaGa</a>
			</h1>
			<ul class="gnb">
				<li><a href="/oaga/travel_info">여행지정보보기</a></li>
				<li><a href="/oaga/review">리뷰보기</a></li>
				<li><a href="#">커뮤니티</a></li>
			</ul>
			<!--gnb-->

			<div class="util">
				<form class="srch">
					<input type="text" placeholder="여행지 검색" />
					<button class="Q1">
						<img src="images/mainpage/icon_search2.png" alt="" />
					</button>
				</form>
				<!--srch-->



				<c:choose>
					<c:when test="${empty principal}">
						<!-- 로그인 안된상태 -->
						<button class="btn loginBtn">
							<a href="/oaga/auth/login_form">로그인</a>
						</button>
						<!--login-->

						<button class="btn joinBtn">
							<a href="/oaga/auth/join_form">회원가입</a>
						</button>
						<!--join-->
					</c:when>

					<c:otherwise>
						<!-- 로그인된 상태 -->
						<button class="btn myPageBtn">
							<a href="/oaga/auth/myPage">MyPage</a>
						</button>
						<!--login-->

						<button class="btn logoutBtn">
							<a href="/oaga/auth/logout">로그아웃</a>
						</button>

					</c:otherwise>


				</c:choose>



			</div>
			<!--util-->
		</div>
		<!--hWrap-->
	</header>