<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/style.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

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
			<button type="button" class="btn btn-primary" id="select"
				style="width: 120px; height: 35px; font-size: 20px; cursor: pointer;">추가하기</button>
			<button type="button" class="btn btn-primary" id="update"
				style="width: 120px; height: 35px; font-size: 20px; cursor: pointer;">수정하기</button>
			<button type="button" class="btn btn-primary" id="delete"
				style="width: 120px; height: 35px; font-size: 20px; cursor: pointer;">삭제하기</button>
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
							style="width: 100%; height: 30px; margin-bottom: 10px; background-color: gray; cursor: pointer;"
							onclick="selectList('${areaList.id}')">

							<input type="hidden" value="${areaList}" id="areaId">${areaList.area}</div>
					</c:forEach>
				</div>
				
				<div  style="width: 330px; height: 30px; text-align: center; border-bottom: 1px solid; ">
					<input type="hidden" itemid="${areaGuList}" value="${areaGuList.content}"id="guname" />
					<div style="height:30px; border-top: 1px solid">구</div>
						<div id="areaGu" >
						
						</div>
					
				</div>		
				
				<div style="height: 100%; width: 34%; border: 1px solid;">
				
						<input type="hidden" itemid="${areaGuList}" value="${areaGuList.content }" id="" />
					<div style="height:30px; border-top: 1px solid; text-align: center; border-bottom: 1px solid;">추가할 항목</div>
					<div style="width: 100%; height: 60px;display: flex; justify-content: space-around; margin-top: 20px;">
						<div id="restaurant" >
								<p>카페/식당</p>
								<input type="checkbox">
						</div>
						<div id="hot_place" >
								<p>놀거리</p>
								<input type="checkbox">
						</div>
					</div>
					
					<div style="width: 100%; height: 568px;">
						<div style="width: 100%;  text-align: center;" id = "areaGuName">
							
						</div>
					
						<div style="width: 100%; height: 100px;text-align: center;">
							<h3 style="margin-top: 10px; margin-bottom: 10px;">이름 : </h3>
							<input style="height: 35px;" id="name">
						</div>
						<div style="width: 100%; height: 100px;text-align: center;">
							<h3 style="margin-bottom: 10px;">주소 : </h3>
							<input style="height: 35px;" id="address">
						</div>
						<div style="width: 100%; height: 100px;text-align: center;">
							<h3 style="margin-bottom: 10px;">소개 : </h3>
							<input style="height: 35px;" id="content">
						</div>
						<div style="width: 100%; height: 100px;text-align: center;">
							<h3 style="margin-bottom: 10px;">이미지 : </h3>
							<input style="height: 35px;" id="imgUrl">
						</div>
						
						<button class="btn btn-primary" id="btn-save" type="submit" style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">추가하기</button>
						
					
					</div>
					
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