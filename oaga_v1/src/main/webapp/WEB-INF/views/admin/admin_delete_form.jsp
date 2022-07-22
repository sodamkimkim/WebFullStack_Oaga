<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/admin/deleteStyle.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<div class="adD_mWrap">
	<div class="srchBox">
		<div class="searchInfo">
			<form class="srch2">
				<input type="text" id="searchInfo" name="searchInfo"
					placeholder="삭제할 정보 검색" />
				<button class="Q2">
					<img src="/oaga/images/mainpage/icon_search1.gif" alt="" />
				</button>
			</form>
			<!-- 검색했을 때 나올 결과 -->
			<div id="area_search_div" class="area_autocomplete"
				style="display: block;"></div>
			<!--  -->
			<div class="keyword">
				<div class="words">
					ㄴ 예시 키워드&nbsp: <a href="#">장소이름,&nbsp&nbsp</a> <a href="#">장소이름,&nbsp&nbsp</a><a
						href="#">장소이름</a>
				</div>
				<!--city-->
			</div>
		</div>
		<!--srch2-->
		<!--words-->
	</div>
	<!--srchBox-->
	<div class="adD_listWrap" >

		<div class="adD_coloumnName">
			<div class="cN1">장소이름</div>
			<div class="cN2">주소</div>
		</div>

		<div class="adD_srcList_item">
			<div class="adD_listColumn adD_listColumn1">이름이름이름이름이름이름이름이름이름</div>
			<div class="adD_listColumn adD_listColumn2">주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소주소</div>
		</div>



		<!-- adD_srcList -->
	</div>
	<!--adminDelete_listWrap  -->

	<div class=adD_bottomWrap>
		<button class="btn adD_btnSubmit">삭제완료</button>
	</div>
</div>
<!--adminDelete_mWrap  -->



<%@ include file="../layout/footer.jsp"%>