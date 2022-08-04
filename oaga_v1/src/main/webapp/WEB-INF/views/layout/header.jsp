
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


<meta name = "${_csrf.parameterName}" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>OaGa</title>
<link rel="stylesheet" href="/oaga/css/style.css" />
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
				<c:choose>
					<c:when test="${empty principal}">
						<li><a href="/oaga/review">리뷰보기</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/oaga/mreview">리뷰보기</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
			<!--gnb-->

			<div class="util">
				<!--srch-->
				<c:choose>
					<c:when test="${empty principal}">
						<!-- 로그인 안된상태 -->
						<button class="headerBtn loginBtn">
							<a href="/oaga/auth/login_form">로그인</a>
						</button>
						<!--login-->

						<button class="headerBtn joinBtn">
							<a href="/oaga/auth/join_form">회원가입</a>
						</button>
						<!--join-->
					</c:when>

					<c:otherwise>
						<!-- 로그인된 상태 -->
						<button class="headerBtn myPageBtn">
							<a href="/oaga/mypage_form">MyPage</a>
						</button>
						<!--login-->

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