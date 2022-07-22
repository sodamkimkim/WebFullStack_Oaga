<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.label-container {
	margin-bottom: 15px;
}
</style>

<div
	style="width: 100%; height: 100%; display: flex; justify-content: center;">
	<div style="width: 1200px;">
		<div
			style="display: flex; justify-content: space-around; margin-top: 50px;">
			<button class="btn btn-primary" id="select"
				style="width: 120px; height: 35px; font-size: 20px;">추가하기</button>
		</div>

		<div
			style="width: 1200px; height: 800px; margin-top: 30px; display: flex; justify-content: center; align-items: center;">

			<div
				style="width: 1000px; height: 700px; background-color: silver; display: flex;">
				<div style="height: 100%; width: 33%; border: 1px solid;" id="test">
					<div
						style="width: 100%; height: 30px; text-align: center; border-bottom: 1px solid;">도시</div>

					<c:forEach var="areaList" items="${areaList}">
						<div class="areaList"
							style="width: 100%; height: 30px; margin-bottom: 10px; background-color: gray;"
							onclick="selectList('${areaList.id}')">

							<input type="hidden" value="${areaList}" id="areaId">${areaList.area}</div>
					</c:forEach>
				</div>

				<div
					style="width: 330px; height: 30px; text-align: center; border-bottom: 1px solid;">
					<input type="hidden" itemid="${areaGuList}"
						value="${areaGuList.content}" id="guname" />
					<div style="height: 30px; border-top: 1px solid">구</div>
					<div id="areaGu"></div>

				</div>

				<div style="height: 100%; width: 34%; border: 1px solid;">

					<input type="hidden" itemid="${areaGuName}"
						value="${areaGuName.guname }" id="" />
					<div
						style="height: 30px; border-top: 1px solid; text-align: center; border-bottom: 1px solid;">추가할
						항목</div>
					<div
						style="width: 100%; height: 60px; display: flex; justify-content: space-around; margin-top: 20px;"
						id="test">
					
						<div>
							<p>카페/식당</p>
							<input type="checkbox" id="restaurant" value="RESTAURANT" onclick="test()">
						</div>
						<div id="hot_place">
							<p>놀거리</p>
							<input type="checkbox" id="hotPlace" value="GUINFO" onclick="test()">
						</div>

					</div>

					<div style="width: 100%; height: 568px;">
					<form method="post" action="/oaga/api/damin/guinfo/infoSave" name="t_form" enctype="multipart/form-data">
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
							<input style="height: 35px;" name = "content" id="content">
						</div>

						<div style="width: 100%; height: 100px; text-align: center;">
							<input class="upload_name" id="r_imageUrl" readonly="readonly"
								placeholder="첨부파일"> 
								
								<label class="r_image_label" for="r_image" >파일 선택</label> 
								
								<input type="file"class="r_image_input" id="image" name="file" accept="image/*"
								required="required"
								onchange="javascript:document.getElementById('r_imageUrl').value = this.value">
						</div>

						<button class="btn btn-primary" id="btn-save" type="submit"
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">추가하기</button>
							
						</form>
					</div>

				</div>
			</div>
		</div>

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