let index = {
	init: function() {
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});

		$("#btn-delete").bind("click", () => {
			this.reviewDelete();
		});


	},

	replySave: function() {
		let data = {
			reviewId: $("#reviewId").val(),
			content: $("#reply-content").val()
		}


		$.ajax({
			type: "POST",
			url: `/oaga/api/review/${data.reviewId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			addReply(response.data);
		}).fail(function(error) {
			console.log(error);
		});

	},

	replyDelete: function(replyId) {

		$.ajax({
			type: "DELETE",
			url: `/oaga/api/review/reply/${replyId}`,
			dataType: "json"
		}).done(function(response) {
			console.log(response);
			alert("댓글 삭제 성공");
		}).fail(function(error) {
			console.log(error);
			alert("댓글 삭제 실패");
		});

	},

	reviewDelete: function() {

		let reviewId = $("#reviewId").val();

		$.ajax({
			type: "DELETE",
			url: `/oaga/api/review/${reviewId}/delete`,
			dataType: "json"
		}).done(function(response) {
			alert("리뷰가 삭제되었습니다.");
			location.href = "/oaga/review";
		}).fail(function(error) {
			console.log(error);
			alert("리뷰 삭제 실패")
		});

	},

	

}

function addReply(reply) {
	console.log(reply);
	let principalId = $("#principal--id");
	let childElement = `<div class="replyBox">
					<img class="reply_image" alt=""
						src="../images/reviewPage/profile_basic.png">
					<div class="reply_i">
						<h4 class="reply_u">${reply.user.userNickName}</h4>
						<h6 class="reply_t">${reply.timestamp}</h6>
					</div>
					<c:if test="${reply.user.id} == principalId">
						<button type="button" onclick="index.replyDelete(${reply.id});"
							id="btn-reply-delete" class="reply_d">삭제</button>
					</c:if>
				</div>
				<div class="reply_c">${reply.content}</div>`;
	$("#replysec").prepend(childElement);
	$("#reply-content").val("");
}

index.init();