let token=$("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {
	init: function() {
		$("#btn-reply-save").bind("click", () => {
			this.replySave();
		});

		$("#btn-delete").bind("click", () => {
			this.reviewDelete();
		});
		
		$("#recent-btn").bind("click", () => {
			this.recentReview();
		});


	},

	replySave: function() {
		let data = {
			reviewId: $("#reviewId").val(),
			content: $("#reply-content").val()
		}
			

		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)  
            },
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

			location.href = "";
		}).fail(function(error) {

			alert("댓글 삭제 실패");
		});

	},

	reviewDelete: function() {

		let reviewId = $("#reviewId").val();

		$.ajax({
			
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)
            },
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

	recentReview: function() {
		
		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)
            },
			type: "GET",
			url: "/oaga/api/recentReview"
		}).done(function(response) {

			addRecentReview(response.data);
		}).fail(function(error) {
			console.log(error)
		});
		
	}
	

}

function addReply(reply) {

	let principalId = $("#principal--id");
	let childElement = `<div class="replyBox">
					<img class="reply_image" alt=""
						src="http://localhost:9090/oaga/upload/${reply.user.userProfileImgUrl}">
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

function addRecentReview(reviewList) {

	$(".box").remove();
	var listLength = reviewList.length;
	if(listLength != 0) {
		var recentList1 = new Array();
		var recentList2 = new Array();
		for(let i = 0; i < 3; i++){
			recentList1[i] = `<div class="box">
					<a href="/oaga/detail/${reviewList[i].id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviewList[i].reviewImageUrl}"
								alt="" />
							<div class="txt">
								<p>${reviewList[i].title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviewList[i].areaName}</li>
								<li class="withFriend">${reviewList[i].theme}</li>
								<li class="userName">${reviewList[i].user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="location">25</li>
								<li class="view">${reviewList[i].count}</li>
								<li class="copy">27</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>`
		}
		for(let i = 3; i < 7; i++){
			recentList2[i] = `<div class="box">
					<a href="/oaga/detail/${reviewList[i].id}">
						<div class="ImgBox">
							<img
								src="http://localhost:9090/oaga/upload/${reviewList[i].reviewImageUrl}"
								alt="" />
							<div class="txt">
								<p>${reviewList[i].title}</p>
							</div>
							<!--txt-->
						</div> <!--ImgBox-->

						<div class="data">
							<ul class="info">
								<li class="placeName">${reviewList[i].areaName}</li>
								<li class="withFriend">${reviewList[i].theme}</li>
								<li class="userName">${reviewList[i].user.userNickName}</li>
							</ul>
							<!--info-->

							<ul class="count">
								<li class="location">25</li>
								<li class="view">${reviewList[i].count}</li>
								<li class="copy">27</li>
							</ul>
							<!--view-->
						</div> <!--data-->
					</a>
				</div>`
		}
	}

	$("#row1").prepend(recentList1);
	$("#row2").prepend(recentList2);
}

index.init();