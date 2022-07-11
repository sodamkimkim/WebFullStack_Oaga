<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>OaGa</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <header>
        <div class="hWrap">
            <h1>
                <a href="/oaga">OaGa</a>
            </h1>
            <ul class="gnb">
                <li><a href="/oaga/travel_info_form">여행지정보보기</a></li>
                <li><a href="/oaga/review">리뷰보기</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
            <!--gnb-->

            <div class="util">
                <form class="srch">
                    <input type="text" placeholder="여행지를 찾아보세요" />
                    <button class="Q1">
                        <img src="images/mainpage/icon_search2.png" alt="" />
                    </button>
                </form>
                <!--srch-->

                <button class="login">
                    <a href="/oaga/login_form">로그인</a>
                </button>
                <!--login-->

                <button class="join">
                    <a href="/oaga/join_form">회원가입</a>
                </button>
                <!--join-->
            </div>
            <!--util-->
        </div>
        <!--hWrap-->
    </header>