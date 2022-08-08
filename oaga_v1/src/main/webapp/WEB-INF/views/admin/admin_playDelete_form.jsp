<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/admin/deleteStyle.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/admin_header.jsp"%>
<style>
.deleteDone {
	color: red;
	pointer-events: none;
}
</style>
<div class="adD_mWrap">
	<div class="srchBox">
		<div class="searchInfo">
			<form class="adD_srch" method="get">
				<input type="hidden" name ="${_csrf.parameterName}" value = "${_csrf.token}">
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
			<c:forEach var="result" items="${resultList.content}">
				<tr class="adD_srcList_item">
					<td id="cl1" class="adD_listColumn adD_listColumn1"><input
						id="cl1_input" type="hidden" value="${result.name}"
						class="form-control">${result.name}<nobr></td>
					<td id="cl2" class="adD_listColumn adD_listColumn2"><input
						id="cl2_input" type="hidden" value="${result.id}"
						class="form-control">${result.address}<nobr></td>
					<td class="adD_listColumn adD_listColumn3"><button
							id="play-delete-btn-${result.id}" onclick="deletePlay(${result.id});">삭제
						</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!--adminDelete_mWrap  -->


<script src="/oaga/js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>
