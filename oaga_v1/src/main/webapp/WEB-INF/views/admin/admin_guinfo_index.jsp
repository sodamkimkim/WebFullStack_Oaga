<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/admin_header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/oaga/css/admin/adminGuinfoIndexStyle.css" />

<div class="admin_add_mainWrap">
	<div>
		<div class="admin_add_subTitle">
			<a type="button" class="btn btn-primary" id="select"
				href="/oaga/admin/restaurant_save_page"
				style="width: 120px; height: 35px; font-size: 20px; text-align: center; cursor: pointer;">카페/식당</a>
			<a type="button" class="btn btn-primary" id="select"
				href="/oaga/admin/guinfo_save_page"
				style="width: 120px; height: 35px; font-size: 20px; text-align: center; cursor: pointer;">놀거리</a>
		</div>
		<!-- admin_add_subTitle -->


		<div class="admin_add_bodyWrap">
			<div class=admin_add_body_tbl>
				<div class="col1 col" id="test">
					<div class = "colName">도시</div>


					<c:forEach var="areaList" items="${areaList}">

						<div class="areaList li_item" onclick="selectList('${areaList.id}')">${areaList.area}</div>
						<!-- <input type="hidden" value="${areaList}" id="areaId"> -->
					</c:forEach>
				</div>
				<!-- col1 -->

				<div class = "col col2"">
					<input type="hidden" itemid="${areaGuList}"
						value="${areaGuList.content}" id="guname" />
					<div class = "colName">구</div>
					<div id="areaGu" class = "li_item"></div>

				</div>
				<form method="post" action="/oaga/api/admin/guinfo/infoSave"
					name="t_form" enctype="multipart/form-data">
					<input type="hidden" name ="${_csrf.parameterName}" value = "${_csrf.token}">
					<div
						style="width: 100%; border-left: 1px solid white">

						<input type="hidden" itemid="${areaGuName}"
							value="${areaGuName.guname }" id="" />
						<div class = "colName">추가할
							항목</div>

						<div
							style="width: 100%; height: 60px; display: flex; justify-content: space-around; margin-top: 20px; align-items: center;"
							id="test"></div>

						<div style="width: 100%; height: 568px;">

							<div style="width: 100%; text-align: center;" id="areaGuName">

							</div>

							<div style="width: 100%; height: 100px; text-align: center;">
								<h3 style="margin-top: 10px; margin-bottom: 10px;">이름 :</h3>
								<input style="height: 35px;" name="name" id="name">
							</div>
							<div style="width: 100%; height: 100px; text-align: center;">
								<h3 style="margin-bottom: 10px;">주소 :</h3>
								<input style="height: 35px;" name="address" id="address">
							</div>
							<div style="width: 100%; height: 100px; text-align: center;">
								<h3 style="margin-bottom: 10px;">소개 :</h3>
								<input style="height: 35px;" name="content" id="content">
							</div>

							<div style="width: 100%; height: 100px; text-align: center;">
								<input class="upload_name" id="r_imageUrl" readonly="readonly"
									placeholder="첨부파일"> <label class="r_image_label"
									for="r_image">파일 선택</label> <input type="file"
									class="r_image_input" id="image" name="file" accept="image/*"
									required="required"
									onchange="javascript:document.getElementById('r_imageUrl').value = this.value">
							</div>


							<button class="btn btn-primary" type="submit"
								style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">놀거리
								추가</button>
						</div>

					</div>
				</form>
			</div>
		</div>
		<!-- admin_add_bodyWrap -->

	</div>
</div>




<!-- 
	// 메서드 매개변수를 사용하는 이유
	//function selectList(selectedId){
	// id -> 유일성을 보장하는 식별자 
	// selectedId
	//	var a = document.getElementById('areaId');
	//	console.log(a);
	//	console.log(selectedId);
	//	}
-->



<script src="../js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>