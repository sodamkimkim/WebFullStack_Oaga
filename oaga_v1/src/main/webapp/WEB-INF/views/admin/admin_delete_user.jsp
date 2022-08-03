<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%@ include file="../layout/admin_header.jsp"%>

<style>
a:hover {
	color: inherit;
	text-decoration: none;
}

h1 {
	font-size: 2em;
	font-weight: bold;
}

.card-header {
	font-weight: bold;
}

.amin-user-sec {
	padding-top: 100px;
	display: flex;
	justify-content: center;
}

.admin-user-box {
	width: 1200px;
}

.user-delete-btn {
	border: none;
	width: 80px;
	height: 30px;
	background-color: rgba(6, 47, 74, 0.9);
	color: white;
	font-size: 12px;
	border-radius: 5px;
	position: absolute;
}

.search-box>form {
	position: relative;
}

.search-box {
	margin-bottom: 50px;
}

.search-user {
	position: absolute;
	right: 0px;
	border: 1px solid rgba(6, 47, 74, 0.9);
	border-radius: 5px;
	padding: 5px;
	height: 40px;
	width: 300px;
	font-size: 16px;
	color: #b3b3b3;
	padding: 5px;
}

.img-btn {
	border: 0px solid transparent;
	position: absolute;
	top: 10px;
	right: 25px;
	cursor: pointer;
}

.search-img {
	position: absolute;
}

.pasination-box {
	display: flex;
	justify-content: center;
	margin-top: 50px;
	margin-bottom: 50px;
}

.page-link {
	color: #fff;
	background-color: rgba(6, 47, 74, 0.9);
	border-color: rgba(6, 47, 74, 0.9);
}

.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: rgba(6, 47, 74, 0.7);
	border-color: rgba(6, 47, 74, 0.7);
}

.border-gray-200 {
	width: 14.2%;
}

.page-item>a:hover {
	z-index: 3;
	color: #fff;
	background-color: rgba(6, 47, 74, 0.7);
	border-color: rgba(6, 47, 74, 0.7);
}

.page-item:active {
	
}

.page-link:focus {
	outline: none;
	-webkit-tap-highlight-color: transparent;
}
</style>

<div class="amin-user-sec">
	<div class="admin-user-box">
		<div class="search-box">
			<form class="search-user-form" action="/oaga/admin/user" method="get">
				<input class="search-user" name="searchName" type="text" placeholder="닉네임으로 검색">
				<button class="img-btn">
					<img class="search-img"
						src="/oaga/images/mainpage/icon_search2.png" >
				</button>
			</form>
		</div>

		<div class="card mb-4" style="min-width: 800px;">
			<div class="card-header">회원 목록</div>
			<div class="card-body p-0">
				<!-- Billing history table-->
				<div class="table-responsive table-billing-history">
					<table class="table mb-0">
						<thead>
							<tr>
								<th class="border-gray-200" scope="col">ID</th>
								<th class="border-gray-200" scope="col">Name</th>
								<th class="border-gray-200" scope="col">NickName</th>
								<th class="border-gray-200" scope="col">Email</th>
								<th class="border-gray-200" scope="col">oauth</th>
								<th class="border-gray-200" scope="col">Date</th>
								<th class="border-gray-200" scope="col">Status</th>
							</tr>
						</thead>
						<input id="input_hidden" type="hidden" value="">
						<tbody>
							<c:forEach var="user" items="${userList.content}">
								<tr class="tr-user-delete">
									<td>${user.id}</td>
									<td>${user.username}</td>
									<td>${user.userNickName}</td>
									<td>${user.email}</td>
									<td>${user.oauth}</td>
									<td>${user.createDate}</td>
									<td class="td-user-delete" id="td-${user.id}"><button class="user-delete-btn" onclick="index.deleteUser(${user.id});" id="btn-delete-${user.id}">회원 삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="pasination-box">
			<ul class="pagination">
				<c:set var="isDisabled" value="disabled"></c:set>
				<c:set var="isNotdisabled" value=""></c:set>
				<c:set var="isNowPage" value="active"></c:set>

				<li class="page-item ${userList.first ? isDisabled : isNotDisabled}"><a class="page-link" href="#">Pre</a></li>
				<c:forEach var="pageNumber" items="${pageNumbers}">
					<c:choose>
						<c:when test="${userList.number + 1 eq pageNumber}">
							<li class="page-item active "><a class="page-link " >${pageNumber}</a></li>			
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/oaga/admin/user?page=${pageNumber-1}">${pageNumber}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li class="page-item ${userList.last ? isDisabled : isNotDisabled}"><a class="page-link" href="#">Next</a></li>
			</ul>

		</div>
	</div>
</div>

<script src="/oaga/js/admin_user.js"></script>

<%@ include file="../layout/footer.jsp"%>