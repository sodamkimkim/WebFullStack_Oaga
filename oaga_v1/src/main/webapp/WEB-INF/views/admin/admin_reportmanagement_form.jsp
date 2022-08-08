<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/oaga/css/admin/reportManagementStyle.css">
<%@ include file="../layout/admin_header.jsp"%>

<div class="reportWrap">
<div class = "checkContainer">
	<div class="selectBox">
		<select>
			<option value="none">댓글/회원</option>
			<option value="byReply">댓글 별 정렬</option>
			<option value="byUser">회원 별 정렬</option>
		</select> <select>
			<option value="none">신고시간 별 정렬</option>
			<option value="byReply">최신 순</option>
			<option value="byUser">오래된 순</option>
		</select>

		<form class="searchReplyForm">
			<input>
			<button">검색</button>
		</form>
		<!-- searchReplyForm -->
	</div>
	<!-- selectBox -->

	<form method="get" action="form-action.html" class="checkboxForm">

		<label> <input class="checkBtn" type="checkbox" name="reply"
			value="reply">
			<div class="replyBox">
				<p class="reportedAt">신고된 날짜 : 2022-08-08</p>
				<p class="replyContent">댓글 내요오오오오오오오오오오오옹</p>
				<p class="boardTitle">[게시글 제목] 게시글 제목 갖고오기</p>
			</div> <!-- replyBox -->
		</label>
<!-- 		<p class="checkboxFormBtn"> -->
<!-- 			<input type="submit" value="Submit">  -->
<!-- 			<input type="reset"	value="Reset"> -->
<!-- 		</p> -->
<!-- 		<!-- checkboxFormBtn -->
	</form>


</div><!-- checkContainer -->
</div>
<!-- reportWrap -->

<%@ include file="../layout/footer.jsp"%>




<table border="1" cellspacing="0" cellpadding="20px" id="report_tbl"
	class="report_tbl">
	<thead>
		<tr>
			<th>선택</th>
			<th>신고된 댓글</th>
		</tr>
	</thead>

	<tbody>
		<tr>
			<td></td>
			<td>
				<div>신고된 날짜 :</div>
				<p>댓글 내요오오오오오오오오오오오옹</p>
				<p>게시글 제목</p>


			</td>
		</tr>
	</tbody>
</table>