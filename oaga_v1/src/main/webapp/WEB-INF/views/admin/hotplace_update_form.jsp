<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/admin_header.jsp"%>
<link rel="stylesheet" href="/oaga/css/admin/adminGuinfoUpdateStyle.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<div class="admin_update_mainWrap">

	<div class="subtitle">
		<a type="button" class="btn btn-primary" id="select"
			href="/oaga/admin/restaurant_updatepage"
			style="width: 120px; height: 35px; font-size: 20px; text-align: center; cursor: pointer;">카페/식당</a>
		<a type="button" class="btn btn-primary" id="select"
			href="/oaga/admin/updatepage"
			style="width: 120px; height: 35px; font-size: 20px; text-align: center; cursor: pointer;">놀거리</a>
	</div>
	<div class="admin_update_bodyWrap">
		<div class="admin_update_tbl">
			<div class="col1 col" id="test">
				<div class="colName col1Name">도시</div>

				<c:forEach var="areaList" items="${areaList}">

					<div class="areaList"
						onclick="selectList2('${areaList.id}')">${areaList.area}</div>
					<!-- <input type="hidden" value="${areaList}" id="areaId"> -->
				</c:forEach>
			</div>
			<!-- col1 -->


			<div
				style="width: 330px; height: 35px; ">
				<input type="hidden" itemid="${areaGuList}"
					value="${areaGuList.content}" id="guname" />
				<div class="col col1" >
					<div class="colName col2Name">구</div>
					<div id="areaGu"></div>
				</div>

			</div>

			<div
				style="width: 337px; text-align: center;">
				<div class="colName col3Name">수정</div>
				<div style="">
					<input type="hidden" style="height: 700px;" value="${guinfoList.content}" itemid="${guinfoList}">
					<div style="background-color: white; border-top:2px solid #333; line-height: 35px;box-sizing: border-box;"id ="hotplaceList" >
						
					</div>


				</div>
			</div>



		</div>
		<!-- admin_update_tbl -->
	</div>
	<!-- admin_update_bodyWrap -->

</div>
<!-- admin_update_mainWrap -->

<script src="../js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>