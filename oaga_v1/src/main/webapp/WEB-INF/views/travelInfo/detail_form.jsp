<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="../layout/header.jsp" %>
<div class ="imgcontainer" style="width: 100%; display: flex; justify-content: center; margin-top: 35px;">
	<div class ="imgcontainer"  style="width: 57%; display: flex; justify-content:flex-start; ; background-color: lime;">
		<div class ="imgcontainer" style="background-color: gray; width: 600px; height: 400px">
			<c:forEach var = "restaurant" items="${findById}">
				<img alt="" src="${findById.imageUrl}">
			</c:forEach>
		</div>
		<div style="padding: 15px;width: 43%; height: 93%; background-color: olive; overflow: auto;">
			<c:forEach var = "restaurant" items="${findById}">
				<div style="font-size: 25px;font-style: oblique;font-weight: bold; margin-bottom: 15px;">${findById.content}</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="../layout/footer.jsp" %>