<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

	
	
	
	<div class="main-container" style="width: 1200px; margin-left: 365px; margin-top: 70px;">		
		<div class="article mWide type1">		
			<div class="mdu_img1type" >	
				<div style="font-size: 25px;font-style: oblique; margin-left: 50px; font-weight: bold;" >서울</div>
				
				<div class="img" style="display: flex; justify-content:space-around;" >
				<!--  슬라이드 처리@@@@ -->
				<a class="prev" style="display: flex; align-items: center; " id="prev_slide">&#10094;</a>
					<div style="display: flex; justify-content:space-around;" id = "slideShow">
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<div>			
					<a href="/area_randMark">					
						<img class="imageList" style="width: 250px;border-radius: 1ex; margin: 15px;"  src="${imagePageList.imageUrl }" alt=""> 	
						<h3 style="margin-left: 13px;">${imagePageList.areaGu}</h3>
					</div> 	
					</a>
					</c:forEach>
					</div>	
					<a class="next" style="display: flex; align-items: center;" id="next_slide">&#10095;</a>	
				</div>
				<br/>
				<br/>
				<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">
						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.areaGu }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				<br/>
				<br/>
				<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;" >제주도</div>
				<div class="img" style="display: flex; justify-content:space-around;" >		
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>		
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="..."> 
						<h3>${imagePageList.areaGu }</h3>						
					</a>
					</c:forEach>		
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>	
				</div>
				<br/>
				<br/>
					<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">
						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.areaGu }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				<br/>
				<br/>
					<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">
						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.areaGu }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				<br/>
				<br/>
					<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">
						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.areaGu }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				<br/>
				<br/>
					<div style="font-size: 25px; background-color: white; font-style: oblique;  margin-left: 50px; font-weight: bold;"  >부산</div>
				<div class="img" style="display: flex; justify-content:space-around;" >			
				<a class="prev" style="display: flex; align-items: center;" onclick="plusSlides(-1)">&#10094;</a>
					<c:forEach var="imagePageList" items="${imagePageList.content}">
					<a href="#">
						
						<img class="imageList" style="width: 250px;border-radius: 1ex; "  src="${imagePageList.imageUrl }" alt="...">
						<h3 >${imagePageList.areaGu }</h3> 	
					</a>
					</c:forEach>
					<a class="next" style="display: flex; align-items: center; onclick="plusSlides(1)">&#10095;</a>			
				</div>
				<br/>
				<br/>
			</div>
		</div>
	</div>
	<br/>
	<br/>
	
	<br/>


<%@ include file="../layout/footer.jsp" %>
<script>


</script>

