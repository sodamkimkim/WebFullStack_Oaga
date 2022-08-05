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
		
	},
	
	qnasave : function(){
		
		let data = {
			title : $("#title").val(),
			content : $("#content").val(),
			password : $("#password").val(),
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
			id : $("id").val(),
			title : $("#title").val(),
			content : $("#content").val(),
		}
		console.log(data);
		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)  
            },
			type: "POST",
			url: `/oaga/api/QnA/update/${id}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(){
			
		}).fail(function(error){
			console.log(error);
		});
	},
	
	
	
}

index.init();