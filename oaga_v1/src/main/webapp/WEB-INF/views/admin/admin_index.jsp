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
			<button class="btn btn-primary" id="select"
				style="width: 120px; height: 35px; font-size: 20px;">추가하기</button>
			<button class="btn btn-primary" id ="update"
				style="width: 120px; height: 35px; font-size: 20px;">수정하기</button>
			<button class="btn btn-primary"id ="delete"
				style="width: 120px; height: 35px; font-size: 20px;">삭제하기</button>
		</div>

		<div
			style="width: 1200px; height: 800px; margin-top: 30px; display: flex; justify-content: center; align-items: center;">

			<div style="width: 1000px; height: 700px; background-color:silver; display: flex;">
				<div style="height: 100%; width: 33%;  border: 1px solid;" id="test">
					<div style="width: 100%; height: 30px; text-align: center; border-bottom: 1px solid;">도시</div>	

						<c:forEach var="areaList" items="${areaList}">
							<div class ="areaList" style="width: 100%; height: 30px; margin-bottom: 10px; background-color:gray; "
							 onclick="selectList('${areaList.id}')" >
							 
							<input  type="hidden" value ="${areaList}" id = "areaId">${areaList.area}</div>
						</c:forEach>
				</div>
			<div 
					style="height: 100%; width: 33%; border: 1px solid;">
					<div 
						style="width: 100%; height: 30px; text-align: center;  border-bottom: 1px solid;">구</div>

						<c:forEach var="areaGuList" items="${areaGuList}" id = "areaGu">
							<input type="hidden" value ="${areaGuList.id}"  id = "guname"/>
						</c:forEach>
						
				</div>
				<div
					style="height: 100%; width: 34%; border: 1px solid;">
					<div
						style="width: 100%; height: 30px; text-align: center;  border-bottom: 1px solid;">추가할
						항목</div>
				</div>
			</div>

		</div>
	</div>

</div>


<script>
		
		// 메서드 매개변수를 사용하는 이유
		//function selectList(selectedId){
			// id -> 유일성을 보장하는 식별자 
			// selectedId
		//	var a = document.getElementById('areaId');
		//	console.log(a);
		//	console.log(selectedId);
	//	}

		

</script>

<!-- document.getElementById('areaList1').onclick = function() {
					alert(document.getElementById('areaId').val); -->

<script src="../js/admin.js"></script>	
<%@ include file="../layout/footer.jsp"%>