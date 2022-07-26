<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/admin_header.jsp"%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
	<div class="mainbox">
		<div class="container">
			<div class="t_box">
				<div class="title">WELCOME TO</div>
				<div class="title">OAGA ADMIN PAGE</div>
			</div>
			<div class="b_box">
				<button onclick="savePage();" class="btn-addForm btnForm"
					id="btn-addForm">
					<p>데이터 추가하기</p>
					<div class="arrowBtn">
						<a href="#"> <i class="fas fa-angle-double-right btn2"></i> <i
							class="fas fa-angle-double-right btn3"></i>
						</a>
					</div>
				</button>
				<button onclick="updatePage();" class="btn-updateForm btnForm"
					id="btn-updateForm">
					<p>데이터 수정하기</p>
					<!-- 					<img class="rightIcon" src="/oaga/images/mainPage/right.png"> -->
					<div class="arrowBtn">
						<a href="#"> <i class="fas fa-angle-double-right btn2"></i> <i
							class="fas fa-angle-double-right btn3"></i>
						</a>
					</div>
				</button>
				<button onclick="deletePage();" class="btn-deleteForm btnForm"
					id="btn-deleteForm">
					<p>데이터 삭제하기</p>
					<!-- 					<img class="rightIcon" src="/oaga/images/mainPage/right.png"> -->
					<div class="arrowBtn">
						<a href="#"> <i class="fas fa-angle-double-right btn2"></i> <i
							class="fas fa-angle-double-right btn3"></i>
						</a>
					</div>
				</button>
			</div>
		</div>
	</div>

</body>

<script>
	function savePage() {
		location.href = "/oaga/admin/guinfo_save_page";
	}
	function updatePage() {
		location.href = "/oaga/admin/updatepage"
	}
	function deletePage() {
		location.href = "/oaga/admin/deletepage"
	}
</script>
<script src="https://kit.fontawesome.com/01dbce6922.js"
	crossorigin="anonymous"></script>
<%@ include file="../layout/footer.jsp"%>
