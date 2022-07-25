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

			<a type="button" class="btn btn-primary" id="select" href="/oaga/admin/restaurant_save_page"
				style="width: 120px; height: 35px; font-size: 20px; text-align:center; cursor: pointer;">카페/식당</a>
			<a type="button" class="btn btn-primary" id="select" href="/oaga/admin/guinfo_save_page"
				style="width: 120px; height: 35px; font-size: 20px; text-align:center; cursor: pointer;">놀거리</a>
			

		</div>

		<div
			style="width: 1200px; height: 800px; margin-top: 30px; display: flex; justify-content: center; align-items: center;">

			<div
				style="width: 1000px; height: 700px; background-color:rgba(245, 161, 25, 0.9); border-radius:5px; display: flex;">
				<div style="height: 100%; width: 33%; border-right:1px solid white;" id="test">
					<div
						style="width: 100%; height: 30px;border-bottom: 1px solid white; text-align: center; ">도시</div>

					<c:forEach var="areaList" items="${areaList}">
					
						<div class="areaList"
							style="width: 95%; margin-left:5px; height: 30px; text-align:center; margin-bottom: 10px; cursor: pointer;"
							onclick="selectList('${areaList.id}')">
							${areaList.area}</div>
							<!-- <input type="hidden" value="${areaList}" id="areaId"> -->
					</c:forEach>
				</div>

				<div
					style="width: 330px; height: 30px; text-align: center; ">
					<input type="hidden" itemid="${areaGuList}"
						value="${areaGuList.content}" id="guname" />
					<div style="height: 30px;border-bottom: 1px solid white;">구</div>
					<div id="areaGu">
									
					</div>

				</div>
			<form method="post" action="/oaga/api/admin/guinfo/infoSave" name="t_form" enctype="multipart/form-data">
				<div style="height: 100%; width: 100%; border-left: 1px solid white " >

					<input type="hidden" itemid="${areaGuName}"
						value="${areaGuName.guname }" id="" />
					<div
						style="height: 30px; border-bottom: 1px solid white;text-align: center;">추가할
						항목</div>
						
					<div
						style="width: 100%; height: 60px;  display: flex; justify-content: space-around; margin-top: 20px; align-items: center;"
						id="test">	
						
					</div>

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

							
							<button class="btn btn-primary"  type="submit"
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">놀거리 추가</button>
							
						
					</div>
					
				</div>
				</form>
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