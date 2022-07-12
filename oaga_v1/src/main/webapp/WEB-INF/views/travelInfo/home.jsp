<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<style>
	.areaList_li li a{
		background-color: #F0F0F0;
		padding: 7px;
		border-radius: 40%;
		
	}
	
</style>
	
	
	<div class="main-container" style="width: 1200px; margin-left: 365px; margin-top: 70px;">
	<input type="hidden" id="arealist">
			<div style="font-size: 30px; display:flex; justify-content: center; font-weight: bold;"><span>어디 놀러 가고싶나요?</span></div>	
			<br/>
			<div class="areaList" style="font-size:15px;  green; width: 600px; height: 50px;margin-left: 300px; ">
				<ul class = "areaList_li" style="display: flex; flex-direction:row ;justify-content: space-around; padding-top: 12px;">
					<li class="area_list"><a href="/oaga/area_list">서울</a></li>
					<li><a>인천</a></li>
					<li><a>대전</a></li>
					<li><a>대구</a></li>
					<li><a>광주</a></li>
					<li><a>부산</a></li>
					<li><a>울산</a></li>
					<li><a>세종</a></li>
					<li><a>경기</a></li>
					<li><a>강원</a></li>
				</ul>
			</div>
				<div class="areaList" style="font-size:15px;  green; width: 600px; height: 50px;margin-left: 300px; ">
				<ul class = "areaList_li" style="display: flex; flex-direction:row ;justify-content: space-around; padding-top: 12px;">
					<li><a>충북</a></li>
					<li><a>충남</a></li>
					<li><a>경북</a></li>
					<li><a>경남</a></li>
					<li><a>전북</a></li>
					<li><a>전남</a></li>
					<li><a>제주도</a></li>
					
				</ul>
			</div>
			<div class="mdu_img1type">	
				<div style="font-size: 25px;font-style: oblique; margin-left: 50px; font-weight: bold;" >서울</div>
				
				<div class="img" style="display: flex; justify-content:space-around;" >
				<!--  슬라이드 처리@@@@ -->
				<a class="prev" style="display: flex; align-items: center; " id="prev_slide">&#10094;</a>
				
				
					<div style="display: flex; justify-content:space-around;" id = "slideShow">
					<c:forEach var="areaId" items="">
					<div>			
					<a href="/oaga/travel_randmark">		
					<!-- <input type="text" value ="${board.title}" class="form-control" placeholder="Enter title" name="title" id="title"> -->			
						<img class="imagePageList" style="width: 250px;border-radius: 1ex; margin: 15px;" id="imageUrl" src="" alt=""> 	
						<h3 style="margin-left: 13px;"></h3>
					</div> 	
					</a>
					</c:forEach>
					</div>	
					
					
					<a class="next" style="display: flex; align-items: center;" id="next_slide">&#10095;</a>	
				</div>
				<br/>
				<br/>
				<!-- 
				<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="/oaga/travel_randmark">		
						<img class="imagePageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.guname }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				 -->
				<br/>
				<br/>
				
			</div>
	
	</div>
	<br/>
	<br/>
	
	<br/>

<script src="../js/travelInfo.js"></script>
<%@ include file="../layout/footer.jsp" %>

