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
				<button onclick="savePage();" class="btn-addForm" id="btn-addForm">
					<p>데이터 추가하기</p>
					<img class="rightIcon" src="/oaga/images/mainPage/right.png">
				</button>
				<button onclick="updatePage();" class="btn-updateForm" id="btn-updateForm">
					<p>데이터 수정하기</p>
					<img class="rightIcon" src="/oaga/images/mainPage/right.png">
				</button>
				<button onclick="deletePage();" class="btn-deleteForm" id="btn-deleteForm">
					<p>데이터 삭제하기</p>
					<img class="rightIcon" src="/oaga/images/mainPage/right.png">
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

<%@ include file="../layout/footer.jsp"%>

