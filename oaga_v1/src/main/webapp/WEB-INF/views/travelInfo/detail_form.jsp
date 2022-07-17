<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="../layout/header.jsp" %>
<br/>
<br/>
<div class ="imgcontainer" style="width: 100%; display: flex; justify-content: center; margin-top: 35px;">
	<div class ="imgcontainer"  style="width: 57%; display: flex; justify-content:flex-start; ;">
		<div class ="imgcontainer" style="background-color: gray; width: 600px; height: 400px">
			<!-- image -->
			<c:forEach var = "restaurant" items=" ">
				 <img alt="" src=" ">
			</c:forEach>
		</div>
		<div style="padding: 15px;width: 43%;  background-color: olive; overflow: auto;">
			<!-- content -->
			<c:forEach var = "restaurant" items="">
				<div style="font-size: 25px;font-style: oblique;font-weight: bold; margin-bottom: 15px;"></div>
			</c:forEach>
		</div>
	</div>
</div>
<br/>
<br/>
		<h3 style="margin-left: 407px; margin-bottom: -30px; ">근처 식당/카페</h3>
		<div class="container" style="width: 100%; height:200px; display: flex; justify-content: center; margin-top: 35px;">
			<div class="container" style="width: 57%; display: flex; justify-content:flex-start; ; background-color:gray; ;">
				<!-- 다른 식당에 대한 이미지 
				<for>
					<img alt="" src="">
				<for>
				-->
			</div>
		</div>
		<br/>
		<br/>
		<h3 style="margin-left: 407px; margin-bottom: -30px; ">다른 도시</h3>
		<div class="area_container" style="width: 100%; height:200px; display: flex; justify-content: center; margin-top: 35px;">
			<div class="area_container" style="width: 57%; display: flex; justify-content:flex-start; ; background-color:gray; ;">
				<!-- 다른 도시에 대한 이미지 
				<for>
					<img alt="" src="">
				<for>
				-->
			</div>
		</div>
		<br/>
		<br/>
		
<%@ include file="../layout/footer.jsp" %>