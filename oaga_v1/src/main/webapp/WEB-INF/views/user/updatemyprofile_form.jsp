<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>update_myprofile_form</title>
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

input {
	width: 300px;
	height: 40px;
	margin-bottom: 36px;
	border-top: transparent;
	border-left: transparent;
	border-right: transparent;
	border-bottom: 1px solid rgba(3, 3, 3, 0.4);
	font-size: 15px;
	text-indent: 3px;
	background-color: transparent;
	color: rgba(3, 3, 3, 0.4);
	margin-top: 30px;
}

.input-file-button1 {
	width: 120px;
	height: 30px;
	color: #fff;
	text-align: center;
	line-height: 30px;
	background-color: rgba(245, 161, 25, 0.9);
	border-radius: 4px;
	position: absolute;
	top: 130px;
	left: 30px;
}

.input-file-button2 {
	border-bottom: 1px solid rgba(51, 51, 51, 0.7);
	color: rgba(51, 51, 51, 0.7); width : 300px;
	text-indent: 40px; text-align : left;
	background-color: transparent;
	cursor: pointer;
	position: absolute;
	width: 300px; text-indent : 40px; text-align : left; background-color :
	transparent; cursor : pointer; position : absolute;
	top: 147px;
	left: 149px;
	text-align: left;
}

.lblUserProfileFile {
	position: absolute;
	left: 30px;
	top: 90px;
	color: rgba(51, 51, 51, 0.85);
}

.inputWrap {
	width: 500px;
	height: 400px;
	position: relative;
}

.form-input {
	display: none;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
	color: rgba(245, 161, 25, 0.9);
}

.userProfileWrap {
	position: relative;
	width: 500px;
	height: 500px;
}

.userProfileWrap .input-file-button1 {
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 16px;
	color: #333;
}
</style>
</head>
<body>

	<div class="main mWrap">
		<h1>
			<a href="/oaga">OaGa</a>
		</h1>


		<div class="userProfileWrap">
			<div class="inputWrap">
				<label class="lblUserProfileFile" for="userProfileFile">사용자
					프로필 수정: </label> <label class="input-file-button input-file-button1"
					for="input-file"> 파일 선택2 </label> <label
					class="input-file-button input-file-button2" for="input-file">
					프로필을 선택하세요.</label> <input type="file" name="file"
					placeholder="upload user-Profile" class="form-input"
					id="input-file">
			</div>
		</div>

	</div>
	<!--mWrap-->

</body>
</html>
