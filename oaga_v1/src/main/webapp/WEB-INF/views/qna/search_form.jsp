<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/oaga/css/qna/homeStyle.css" />
<div class="qna_row1">
	<div class="wrap">
		<p>Q&A</p>
		<p>
			<span>Oaga</span>서비스 이용에 대하여 궁금한 점이나 문의사항을 등록해 주시면<br />빠른시간 내에 답변해
			드리겠습니다.
		</p>
	</div>
	<!-- wrap -->
</div>
<!-- qna_row1 -->
<div class="qna_row2">
	<div class="wrap">
		<p class="tbl_totalcount">
			
			<input type="text" class="qnasearch" id="qna-search-title"  name="searchTitle">
			<button class="qnasearchbtn" id="qna-search" >검색</button>
			
		</p>
		<br>
		<table cellspacing="0" cellpadding="20px" id="qna_tbl" class="qna_tbl">
			<thead>
				<tr>
					<th class="cN1">번호</th>
					<th class="cN2">제목</th>
					<th class="cN3">처리상태</th>
					<th class="cN4">작성자</th>
					<th class="cN5">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="searchQnaList" items="${searchQnaList}" >
				<tr>
					<td>${searchQnaList.id}</td>
					<td class="tbl_contenttitle"><svg class="lock"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
							<!--! Font Awesome Pro 6.1.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
							<c:choose>
								<c:when test="${searchQnaList.secretreply eq 0 }">
									<path/></svg>
								<a href="/oaga/qna/qnadetailform/${searchQnaList.id}">${searchQnaList.title}</a></td>
								</c:when>
								<c:otherwise>
								<path
								d="M80 192V144C80 64.47 144.5 0 224 0C303.5 0 368 64.47 368 144V192H384C419.3 192 448 220.7 448 256V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V256C0 220.7 28.65 192 64 192H80zM144 192H304V144C304 99.82 268.2 64 224 64C179.8 64 144 99.82 144 144V192z" /></svg>

								<c:choose>
									<c:when test="${principal.user.role eq 'ADMIN' || searchQnaList.user.id eq principal.user.id}">
										<a href="/oaga/qna/qnadetailform/${searchQnaList.id}">${searchQnaList.title}</a></td>
									</c:when>
									<c:otherwise>
										<a>${searchQnaList.title}   (비밀글 입니다.)</a></td>
									</c:otherwise>
								</c:choose>
								</c:otherwise>
							</c:choose>
							
							
					<td>${searchQnaList.qnaType}</td>
					<td>${searchQnaList.user.userNickName}</td>
					<td>${searchQnaList.createDate}</td>
				</tr>
				</c:forEach>
					
			</tbody>
		</table>
		<button class="qna_btn"> <a href="/oaga/qna/qnawriteform">질문작성하기</a> </button>
	</div>
	<!-- wrap -->

</div>
<!-- qna_row2 -->

<script src="../../js/qna.js"></script>
<%@ include file="../layout/footer.jsp"%>