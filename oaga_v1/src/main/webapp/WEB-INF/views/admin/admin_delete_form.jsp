<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/admin/deleteStyle.css" />
<%@ include file="../layout/admin_header.jsp"%>

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
							class="adD_listItem_btn" id="adD_listItem_btn">삭제
						</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
				<ul class="pagination">
			<li
				class="page-item btnPrv ${resultList.first ? passive : Page-item-active}"><a
				class="page-link" href="/oaga/admin/restaurantDeletepage?page=${number-1}">Prv</a></li>
			<!-- page-item -->


			<c:forEach var="num" items="${pageNumbers}">
				<c:choose>
					<c:when test="${resultList.number+1 eq num}">
						<li class="page-item Page-item-active"><a class="page-link"
							href="/oaga/admin/restaurantDeletepage?page=${num-1}">${num}</a></li>
						<!-- page-item -->
					</c:when>
					<c:otherwise>
						<li class="page-item passive"><a class="page-link"
							href="/oaga/admin/restaurantDeletepage?page=${num-1}">${num}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<li
				class="page-item btnNxt ${resultList.last ? passive : Page-item-active}">
				<a
				class="page-link" href="/oaga/admin/restaurantDeletepage?page=${pageable.number+1}">Nxt</a></li>
			<!-- page-item -->
		</ul>
</div>
<!--adminDelete_mWrap  -->


<script src="/oaga/js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>