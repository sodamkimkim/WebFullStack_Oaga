<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>
	<br/>
	<!-- 
	 <c:foreach var="abc" items="${aa}">
	 ifs --- 2 
	 
	 else 1   	
	 </c:foreach>
	 -->
	<div style="width: 100%;display: flex; justify-content: center;">
		<div style="width: 1200px; height: 500px;" >
			 <img alt="" src="" style="width: 170px; height:170px; border-radius: 1ex; margin: 15px;">
		</div>
	</div>
	
	
	<div style="font-size: 25px;font-style: oblique; padding-top: 10px;  margin-left: 350px; font-weight: bold;" >주요도시</div>
	
	<div class="content-randmark" style="display: flex; justify-content: center;">
	
		<div style="width: 1200px; height: 260px; display: flex; justify-content: center; align-items: center;">
			<div>
			<c:forEach var="guInfoList" items="${guInfoList}">
			<a href="/oaga/travel_datail" style="width: auto; height: auto;">
				<img alt="" src="${guInfoList.imageUrl}"style="width: 170px; height:170px; border-radius: 1ex; margin: 15px;" >
			</a>
			</c:forEach>
			</div>
		</div>
		
	</div>
	
	<div style="font-size: 25px;font-style: oblique; padding-top: 10px;  margin-left: 350px; font-weight: bold;" >HOT플레이스</div>
	<div class="content-randmark" style="display: flex; justify-content: center;">
	<a class="prev" style="display: flex; align-items: center; " id="prev_slide">&#10094;</a>
		<div style="width: 1200px; height: 260px; display: flex; justify-content: center; align-items: center;">
			<div style=" background-color:green; ; width: 250px; height: 250px; border-radius: 1ex;">
				<img alt="" src="" style="">
			</div>
		</div>
		<a class="next" style="display: flex; align-items: center;" id="next_slide">&#10095;</a>
	</div>
	
	
	<div style="font-size: 25px;font-style: oblique; padding-top: 10px;  margin-left: 350px; font-weight: bold;" >맛집/카페</div>
	<div class="content-randmark" style="display: flex; justify-content: center;">
	<a class="prev" style="display: flex; align-items: center; " id="prev_slide">&#10094;</a>
		<div style="width: 1200px; height: 260px; display: flex; justify-content: center; align-items: center;">
			<div style=" background-color:green; ; width: 250px; height: 250px; border-radius: 1ex;">
				<img alt="" src="" style="">
			</div>
		</div>
		<a class="next" style="display: flex; align-items: center;" id="next_slide">&#10095;</a>
	</div>
	

	<br/>
	<br/>
	

<%@ include file="../layout/footer.jsp" %>


