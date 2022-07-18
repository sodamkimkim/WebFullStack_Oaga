<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ include file="../layout/header.jsp"%>
<br />
<br />
<div class="imgcontainer"
	style="width: 100%; display: flex; justify-content: center; margin-top: 35px;">
	<div class="imgcontainer"
		style="width: 57%; display: flex; justify-content: flex-start;">
		<div class="imgcontainer" style="width: 600px; height: 400px">
			<!-- image -->
			<c:forEach var="restaurant" items="${restaurant}">
				<img alt="" src="${restaurant.imageUrl}"
					style="width: 100%; height: 100%; border-top-left-radius: 10px; border-bottom-left-radius: 10px;">
			</c:forEach>
		</div>
		<div
			style="padding: 15px; width: 43%; overflow: auto; border: 1px solid gray; border-top-right-radius: 10px; border-bottom-right-radius: 10px;">

			<c:forEach var="restaurant" items="${restaurant}">
				<div
					style="font-size: 25px; font-style: oblique; font-weight: bold; margin-bottom: 15px;">
					<h5 style="margin-top: -10px; margin-left: -10px;">이름:
						${restaurant.name}</h5>
					<p style="font-size: 20px; margin-top: -25px; margin-left: -10px;">주소:
						${restaurant.address}</p>
					<span style="font-size: 15px; margin-left: -10px;">${restaurant.content}</span>
				</div>
			</c:forEach>

		</div>
	</div>
</div>
<br />
<br />
<h3 style="margin-left: 407px; margin-bottom: -30px;">근처 식당/카페</h3>
<div class="container"
	style="width: 100%; height: 200px; display: flex; justify-content: center; margin-top: 35px;">
	<div class="container"
		style="width: 57%; display: flex; justify-content: flex-start;">
		<c:forEach var="restaurant" items="${restaurant}">
			<img alt="" src="${restaurant.imageUrl}"
				style="width: 180px; height: 180px; border-radius: 10px;">
		</c:forEach>
	</div>
</div>
<br />
<br />


<%@ include file="../layout/footer.jsp"%>