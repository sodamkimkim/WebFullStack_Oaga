let token=$("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");


 let index = {
	init:function(){
		$("#btn-save").bind("click", () =>{
			this.qnasave();
			alert("save 버튼");
		});
		
		$("#QnA_delete").bind("click", () =>{
		alert("delete 버튼");
		 	this.qnadelte();
		});
		$("#btn-qna-update").bind("click", () =>{
			alert("update 버튼");
			this.qnaupdate();
		});
		$("#btn-qna-reply-save").bind("click", () =>{
			this.replysave();
			alert("리플라이");
		});

		$("#btn-qna-reply-update").bind("click", () =>{
			alert("수정 클릭");
			this.qnareplyupdate();	
		});
		
	},
	
	qnasave : function(){
		
		let data = {
			title : $("#title").val(),
			content : $("#content").val(),
			secretreply : $("#checkBox").prop("checked") ? 1:0,
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
		.done(function(){
			alert("성공");
			location.href = "/oaga/qna/qna_home";
		})
		.fail(function(error){
			console.log(error);
		});
	},
	
	
	qnadelte : function(){
		
		qnaId = $("#qnaId").val();
		console.log(qnaId);
		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)  
            },
			type: "DELETE",
			url: `/oaga/api/qna/delete/${qnaId}`,
			
		}).done(function(response){
			location.href = "/oaga/qna/qna_home";
			alert("QnA 삭제 성공!");
		}).fail(function(error){
			alert("QnA 삭제 실패!");
		});
	},
	
	qnaupdate : function(){
		let data = {
			id : $("#id").val(),
			title : $("#title").val(),
			content : $("#content").val(),
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
			
		}).done(function(){
			alert("수정 성공!");
			location.href = "/oaga/qna/qna_home";
			
		}).fail(function(error){
			alert("수정 실패!");
			console.log(error);
		});
	},
	replysave : function(){
		let data = {
			qnaId : $("#qnaId").val(),
			content :$("#replycontent").val(),
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
			
		}).done(function(response){
			alert("리플라이 작성 성공!");
			
			appendreplyfindId(response.data);
		}).fail(function(error){
			alert("리플라이 실패!");
			console.log(error);
		});
	},
	
	qnareplydelte : function(){
		
		let data = {
			id : $("#replyid").val(),
			
		}

		console.log(data.qnaId + "id@");
		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)  
            },
			type: "DELETE",
			url: `/oaga/api/qna/reply/delete/${data.id}`,
			
		}).done(function(response){
			location.href = "/oaga/qna/qna_home";
			alert("reply 삭제 성공!");
		}).fail(function(error){
			alert("reply 삭제 실패!");
		});
	},
	qnareplyupdate :function(){
		let data = {
			id : $("#replyid").val(),
			content : $("#content").val(),
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
			
		}).done(function(){
			alert("수정 성공!");
			location.href = "/oaga/qna/qna_home";
			
		}).fail(function(error){
			alert("수정 실패!");
			console.log(error);
		});
	}
}


function appendreplyfindId(response){
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

function viewappendreply(response){
	
	let data = response.data;
	var appendreply = `<c:forEach var="qnAReply"  items="${data[0]}">
							<input type="hidden" value="${data[0].id}" id="replyid">
							<div class = "appendreply">
								<div class = replyuserNickNamediv>
									<div class = replyuserNickName><p>작성자 :</p></div>
									<div class = "adminNickName" ><p>${data[0].user.userNickName}</p></div>
									<div class = replyuserNickName><p>글작성 일 :</p></div>
									<div class = "adminNickName" ><p>${data[0].createDate}</p></div>
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














