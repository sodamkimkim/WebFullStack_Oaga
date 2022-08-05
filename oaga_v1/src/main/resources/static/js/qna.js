let token=$("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");


 let index = {
	init:function(){
		$("#btn-save").bind("click", () =>{
			this.qnasave();
			alert("save 버튼");
		});
	},
	
	qnasave : function(){
		
		let data = {
			title : $("#title").val(),
			content : $("#content").val(),
			password : $("#password").val(),
		}
		console.log(data);
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
			console.log("성공");
		})
		.fail(function(error){
			console.log(error);
		});
	}
	
	
	
}

index.init();