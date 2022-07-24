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

			<a type="button" class="btn btn-primary" id="select" href="/oaga/admin/restaurant_updatepage"
				style="width: 120px; height: 35px; font-size: 20px; text-align:center; cursor: pointer;">카페/식당</a>
			<a type="button" class="btn btn-primary" id="select" href="/oaga/admin/updatepage"
				style="width: 120px; height: 35px; font-size: 20px; text-align:center; cursor: pointer;">놀거리</a>
			

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
							onclick="selectrestaurantList('${areaList.id}')">

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
				
				<div style="width: 350px;  height: 100%;  text-align: center; border-bottom: 1px solid;">
					<h4 style="height: 29px; border: 1px solid;">수정</h4>
					<div style="height: 668px; border: 1px solid;"  >
					<input type="hidden" value="${restaurantList}">
						<div style="width: 100%; height: 668px; "id="restaurantList">
						
						</div>
					
						
					</div>
				</div>
					
			
			
			</div>
		</div>

	</div>
</div>







<script src="../js/admin.js"></script>
<%@ include file="../layout/footer.jsp"%>