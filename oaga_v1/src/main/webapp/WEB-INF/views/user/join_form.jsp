<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/admin_header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>login_form</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	background-color: rgba(245, 161, 25, 0.9);
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

.checkId-label {
	font-size: 12px;
	border-radius: 5px;
	background-color: rgba(245, 161, 25, 0.9);
}

.btn_join_admin {
	cursor: pointer;
	width: 280px;
	height: 30px;
	border-radius: 5px;
	border: transparent;
	font-weight: bold;
	color: #fff;
	font-size: 14px;
	background-color: #66B2FF;
	margin-top: 20px;
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


				<form action="/oaga/auth/joinproc" method="post" onsubmit="return joinCheck()"  enctype="multipart/form-data">
>
					<!-- csrf???? xss -->
					<div class="formRow1">
					
						<input type="text" class="form-input" placeholder="Enter ID"
							id="username" name="username"/>
						<!-- 	
						<label class="checkId-label" for="btn-checkId">중복체크</label>
						 -->
						
						<button style="background: none;" id="btn-checkId" type="button">중복체크</button>
						
						 <input type="password"
							class="form-input" placeholder="Enter password" id="password"
							name="password" /> <br /> <input type="text" class="form-input"
							placeholder="Enter name" id="userNickName" name="userNickName" />
						<input type="email" class="form-input" placeholder="Enter email"
							id="email" name="email" />
						<div class="userProfileWrap">
							<label class="lblUserProfileFile" for="userProfileFile">사용자
								프로필 등록: </label> <input type="file" name="file"
								placeholder="upload user-Profile" class="form-input"
								id="userProfileFile">
						</div>


					</div>
					<!--formRow1-->
					<div class="formRow2">
						<button type="submit" id="btn_join" class="btn btn_join">회원가입</button>
						<button type="button" onclick="adminJoinPage();"
							class="btn btn_join_admin">관리자 회원가입 페이지</button>
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
<script>
	let usernameCheck = false;
	$("#btn-checkId").bind("click",function(){
		let data = {
				username: $("#username").val(),
		};
		$.ajax({
			type: "POST",
			url: "/oaga/api/checkId/",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(response) {
			console.log(response);
			if(response.username != null){
				alert("이미 사용중인 아이디 입니다.");
				return false;
			}else{
				alert("사용가능한 아이디 입니다.");
				usernameCheck = true;
			}

		}).fail(function(error) {
			console.log(error);
			alert("통신 오류. 다시 시도해주세요.");
			return false;
		});
	});
	
	
	function joinCheck(){
		
		if(usernameCheck == false) {
			alert("아이디 중복확인을 해주세요.");
			return false;

		}else{
			alert("회원가입 성공 했습니다.");
			return true;
		}
		
	}

</script>
</body>
<script type="text/javascript">
function adminJoinPage() {
	location.href = "/oaga/auth/admin_join_page";
}
</script>
</html>

