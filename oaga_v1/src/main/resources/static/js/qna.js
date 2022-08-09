let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");


let index = {
	init: function() {
		$("#btn-save").bind("click", () => {
			this.qnasave();
			alert("save 버튼");
		});

		$("#QnA_delete").bind("click", () => {
			alert("delete 버튼");
			this.qnadelte();
		});
		$("#btn-qna-update").bind("click", () => {
			alert("update 버튼");
			this.qnaupdate();
		});
		$("#btn-qna-reply-save").bind("click", () => {
			this.replysave();
			alert("리플라이");
		});

		$("#btn-qna-reply-update").bind("click", () => {
			alert("수정 클릭");
			this.qnareplyupdate();
		});
		$("#qna-search").bind("click", () => {
			this.searchQnA();
		});
	},

	searchQnA: function() {
		let data = {
			title: $("#qna-search-title").val(),
		}

		$.ajax({

			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "GET",
			url: `/oaga/qna/search/${data.title}`,

			contentType: "application/json; charset=utf-8",
		})
			.done(function() {
				alert("성공");
				location.href = `/oaga/qna/search/${data.title}`;
			})
			.fail(function(error) {
				console.log(error);
			});
	},

	getMyQnAList: function(userId) {
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "GET",
			url: `/oaga/api/qna/mylist/${userId}`,
			dataType: "json"
		}).done(function(response) {
			console.log(response.data);
			myQnaListElement(response.data);
		}), fail(function(error) {
			console.log(error);
		});
	},


	qnasave: function() {

		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
			secretreply: $("#checkBox").prop("checked") ? 1 : 0,
		}
		$.ajax({

			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "POST",
			url: "/oaga/api/qna/save",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		})
			.done(function() {
				alert("성공");
				location.href = "/oaga/qna/qna_home";
			})
			.fail(function(error) {
				console.log(error);
			});
	},


	qnadelte: function() {

		qnaId = $("#qnaId").val();
		console.log(qnaId);
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "DELETE",
			url: `/oaga/api/qna/delete/${qnaId}`,

		}).done(function(response) {
			location.href = "/oaga/qna/qna_home";
			alert("QnA 삭제 성공!");
		}).fail(function(error) {
			alert("QnA 삭제 실패!");
		});
	},

	qnaupdate: function() {
		let data = {
			id: $("#id").val(),
			title: $("#title").val(),
			content: $("#content").val(),
		}
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "POST",
			url: `/oaga/api/QnA/update/${data.id}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",

		}).done(function() {
			alert("수정 성공!");
			location.href = "/oaga/qna/qna_home";

		}).fail(function(error) {
			alert("수정 실패!");
			console.log(error);
		});
	},
	replysave: function() {
		let data = {
			qnaId: $("#qnaId").val(),
			content: $("#replycontent").val(),
		}

		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "POST",
			url: `/oaga/api/QnAreply/save/${data.qnaId}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",

		}).done(function(response) {
			alert("리플라이 작성 성공!");

			appendreplyfindId(response.data);
		}).fail(function(error) {
			alert("리플라이 실패!");
			console.log(error);
		});
	},

	qnareplydelte: function() {

		let data = {
			id: $("#replyid").val(),

		}

		console.log(data.qnaId + "id@");
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "DELETE",
			url: `/oaga/api/qna/reply/delete/${data.id}`,

		}).done(function(response) {
			location.href = "/oaga/qna/qna_home";
			alert("reply 삭제 성공!");
		}).fail(function(error) {
			alert("reply 삭제 실패!");
		});
	},
	qnareplyupdate: function() {
		let data = {
			id: $("#replyid").val(),
			content: $("#content").val(),
		}
		console.log(data.id);
		console.log(data.content);
		$.ajax({
			beforeSend: function(xhr) {
				xhr.setRequestHeader(header, token)
			},
			type: "POST",
			url: `/oaga/api/QnA/reply/update/${data.id}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",

		}).done(function() {
			alert("수정 성공!");
			location.href = "/oaga/qna/qna_home";

		}).fail(function(error) {
			alert("수정 실패!");
			console.log(error);
		});
	},

}


function appendreplyfindId(response) {
	let data = response.id;
	console.log(data + "데이타");
	$.ajax({
		beforeSend: function(xhr) {
			xhr.setRequestHeader(header, token)
		},
		type: "GET",
		url: `/oaga/api/replyId/${data}`
	}).done(function(response) {
		viewappendreply(response);
	}).fail(function() {

	})
}

function myQnaListElement(myList) {
	$(".list-body").empty();
	let a = myList.length;
	console.log(a);
	if (a != 0) {
		var qnAList = new Array();
		for (let i = 0; i < a; i++) {
			let createDate = myList[i].createDate;
			let date = createDate.substr(0, 10);
			if(myList[i].secretreply == 0) {
				qnAList[i] = `<tr class="list-tr">
					<td>${myList[i].id}</td>
					<td class="tbl_contenttitle">
						<a href="/oaga/qna/qnadetailform/${myList[i].id}">${myList[i].title}</a></td>						
					<td>${myList[i].qnaType}</td>
					<td>${myList[i].user.userNickName}</td>
					<td>${date}</td>
					</tr>`
			} else {
				qnAList[i] = `<tr class="list-tr">
					<td>${myList[i].id}</td>
					<td class="tbl_contenttitle">
							<svg class="lock" xmlns="http://www.w3.org/2000/svg " viewBox="0 0 448 512">
									<path d="M80 192V144C80 64.47 144.5 0 224 0C303.5 0 368 64.47 368 144V192H384C419.3 192 448 220.7 448 256V448C448 483.3 419.3 512 384 512H64C28.65 512 0 483.3 0 448V256C0 220.7 28.65 192 64 192H80zM144 192H304V144C304 99.82 268.2 64 224 64C179.8 64 144 99.82 144 144V192z" /></svg>
						<a href="/oaga/qna/qnadetailform/${myList[i].id}">${myList[i].title}</a></td>						
					<td>${myList[i].qnaType}</td>
					<td>${myList[i].user.userNickName}</td>
					<td>${date}</td>
					</tr>`
			}
		}
		
		$(".list-body").append(qnAList);

	}

}

function viewappendreply(response) {
	
	let data = response.data;
	let time = data[0].createDate;
	let date = time.substr(0, 10);
	var appendreply = `<c:forEach var="qnAReply"  items="${data[0]}">
							<input type="hidden" value="${data[0].id}" id="replyid">
							<div class = "appendreply">
								<div class = replyuserNickNamediv>
									<div class = replyuserNickName><p>작성자 :</p></div>
									<div class = "adminNickName" ><p>${data[0].user.userNickName}</p></div>
									<div class = replyuserNickName><p>글작성 일 :</p></div>
									<div class = "adminNickName" ><p>${date}</p></div>
								</div>
								<div style="padding: 10px;">
									<div>${data[0].content}</div>
									<div style="margin-top: 170px;">
									
									
									<button id="QnA_reply_delete" class="deletebtn" onclick="index.qnareplydelte()">삭제하기</button>
									<button class="updatebtn" >
									<a href="/oaga/qna/qnareplyupdateform/${data[0].id}">수정하기</a>
									</butotn>
									
								</div>
				</div>
							</div>
					   </c:forEach>
					   <br>
					   
					   `


	$('#appendReply').prepend(appendreply);

}



index.init();














