<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>login_form</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--      <link rel="stylesheet" href="css/user/loginstyle.css" /> -->
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
	height: 330px;
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
	display: flex;
	flex-direction: column;
	align-items: center;
}

.formRow2 .btn_login {
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
	margin-bottom: 24px;
}

.formRow2 .btn_login:hover {
	cursor: pointer;
}

.formRow2 a {
	width: 280px;
	display: block;
	line-height: 25px;
	border: 1px solid rgba(3, 3, 3, 0.2);
	background-color: transparent;
	text-align: center;
	border-radius: 5px;
	height: 25px;
	font-weight: bold;
	font-size: 11px;
	color: rgba(3, 3, 3, 0.6);
}

footer {
	
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

.con p {
	text-align: center;
	font-size: 11px;
	color: rgba(3, 3, 3, 0.6);
	padding-top: 30px;
}

.con p a {
	color: rgba(245, 161, 25, 0.9);
}

.con p a:hover {
	text-decoration: underline;
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
				<form action="/oaga/auth/loginProc" method="post">
					<div class="formRow1">
						<input type="text" class="form-control" placeholder="Enter ID"
							id="username" name="username" /> <input type="password"
							class="form-control" placeholder="Enter password" id="password"
							name="password" />
					</div>
					<!--formRow1-->

					<div class="formRow2">
						<button type="submit" id="btn_login" class="btn btn_login">로그인</button>
						<a class="btn btn_kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=31c71a748886ababf2df137e8f33a1a4&redirect_uri=http://localhost:9090/oaga/auth/kakao/callback&response_type=code">카카오아이디로 로그인</a>
					</div>
					<!--formRow2-->
				</form>
				<p>
					혹시, OaGa가 처음이신가요? <a href="/oaga/auth/join_form">회원가입</a>
				</p>
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

