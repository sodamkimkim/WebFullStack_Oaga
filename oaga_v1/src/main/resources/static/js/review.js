let index = {
	init: function() {
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});
		
	},
	
	replySave: function() {
		let data = {
			reviewId: $("#reviewId").val(),
			content: $("#reply-content").val()
		}
		
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: `/oaga/api/review/${data.reviewId}/reply`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(response) {
			console.log(response);
			alert("댓글 작성 성공");
		}).fail(function(error) {
			console.log(error);
			alert("댓글 작성 실패");
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
		
	}
	
}

index.init();