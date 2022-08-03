<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/admin/deleteStyle.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/admin_header.jsp"%>

<div class="adD_mWrap">
	<div class="srchBox">
		<div class="searchInfo">

			<form class="adD_srch" action="/oaga/admin/srch_deleterestaurant"
				method="get">
				<input type="text" id="srchtitle" name="srchtitle"
					value="${srchtitle}" placeholder="삭제할 정보 검색" />
				<button class="adD_srch_btn" type="submit">
					<img src="/oaga/images/mainpage/icon_search1.gif" alt="" />
				</button>
			</form>


			<!--  -->
			<div class="keyword">
				<div class="words">
					키워드&nbsp: <a href="#">장소이름</a>
				</div>
				<!--city-->
			</div>
		</div>
		<!--srch2-->
		<!--words-->
	</div>
	<!--srchBox-->

	<table border="1" cellspacing="0" cellpadding="20px" id="adD_tbl"
		class="adD_tbl">
		<thead class="adD_tbl_thead">
			<tr>
				<th class="adD_tbl_coloumnName cN1">이름</th>
				<th class="adD_tbl_coloumnName cN2">주소</th>
				<th class="adD_tbl_coloumnName cN3"></th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="restaurant" items="${restaurants.content}">
				<tr class="adD_srcList_item">
					<td id="cl1" class="adD_listColumn adD_listColumn1"><input
						id="cl1_input" type="hidden" value="${restaurant.name}"
						class="form-control">${restaurant.name}<nobr></td>
					<td id="cl2" class="adD_listColumn adD_listColumn2"><input
						id="cl2_input" type="hidden" value="${restaurant.id}"
						class="form-control">${restaurant.address}<nobr></td>

					<td class="adD_listColumn adD_listColumn3"><button
							class="adD_listItem_btn" id="adD_listItem_btn">삭제
						</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class=adD_bottomWrap>
		<button class="adD_btnSubmit">삭제완료</button>
	</div>
</div>
<!--adminDelete_mWrap  -->


<script src="/oaga/js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>
