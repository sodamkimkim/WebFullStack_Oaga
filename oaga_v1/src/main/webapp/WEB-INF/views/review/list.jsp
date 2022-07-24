<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<link rel="canonical"
	href="https://startbootstrap.com/previews/sb-ui-kit-pro-angular">
	
<link rel="stylesheet" href="/oaga/css/review/liststyle.css" />

<header class="list-header">
	<div class="list-header-content">
		<div class="container-box">
			<div class="row-center">
				<div class="list-header-txtbox">
					<h1 class="list-header-title">Oaga 사용자들의 자세한 국내 여행지 리뷰</h1>
					<p class="list-header-text">생생한 경험자들의 여행리뷰를 참고하여 성공적인 여행을 만들 수
						있어요</p>
					<a href="/oaga/write"><button class="list-write-btn">나도 리뷰 작성하러 가기</button></a>
				</div>
				<div class="list-header-img-box">
					<img class="list-header-img" src="/oaga/images/reviewPage/list.png">
				</div>

			</div>
		</div>
		<div></div>
	</div>
	<sbpro-border _ngcontent-jaq-c36="" _nghost-jaq-c35="">
	<div _ngcontent-jaq-c35="" class="svg-border-rounded text-light">
		<svg class="svg" _ngcontent-jaq-c35=""
			xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144.54 17.34"
			preserveAspectRatio="none" fill="#E0E0E0">
			<path _ngcontent-jaq-c35=""
				d="M144.54,17.34H0V0H144.54ZM0,0S32.36,17.34,72.27,17.34,144.54,0,144.54,0"></path></svg>
	</div>
	<!----><!----><!----></sbpro-border>
</header>
<section class="list-body-sec">
	<div class="list-body-box">
		<c:forEach var="review" items="${reviews.content}">
			<!-- 리뷰 하나 -->
			<div class="list-body-container">
				<div>
					<h6 class="list-body-title">${review.title}</h6>
					<a href="/oaga/detail/${review.id}" class="list-body-a"><img class="list-body-img"
						src="http://localhost:9090/oaga/upload/${review.reviewImageUrl}"></a>
				</div>
			</div>
			<!-- 리뷰 하나 -->
		</c:forEach>


	</div>

</section>

<div class="pasination-box">
	<ul class="pagination">
		<c:set var="isDisabled" value="disabled"></c:set>
		<c:set var="isNotdisabled" value=""></c:set>
		<c:set var="isNowPage" value="active"></c:set>

		<li class="page-item ${reviews.first ? isDisabled : isNotdisabled}"><a
			class="page-link" href="/oaga/list?page=${reviews.number - 1}">Pre</a></li>
		<c:forEach var="pageNumber" items="${pageNumbers}">
			<c:choose>
				<c:when test="${reviews.number + 1 eq pageNumber}">
					<li class="page-item active"><a class="page-link" href="/oaga/list?page=${pageNumber -1}">${pageNumber}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/oaga/list?page=${pageNumber -1}">${pageNumber}</a></li>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<li class="page-item ${reviews.last ? isDisabled : isNotdisabled}"><a
			class="page-link" href="/oaga/list?page=${reviews.number + 1}">Next</a></li>
	</ul>

</div>



<%@ include file="../layout/footer.jsp"%>