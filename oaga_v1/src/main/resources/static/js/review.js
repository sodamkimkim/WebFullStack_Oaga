let index = {
	init: function() {
		$("#btn-save").bind("click", () => {
			this.save();
		});
		
		$("#btn-t-save").bind("click", () => {
			this.temSave();
		});
	},
	
	save: function() {
		
		let data = {
			title: $("#r_title").val(),
			areaName: $("#r_place").val(),
			theme: $("input[type=radio][name=r_theme]:checked").val(),
			content: $("#content").val(),
			isWriting: $("#btn-save").val(),
			originImageUrl: $("#r_imageUrl").val()
		}
		
		console.log("데이터 확인")
		console.log(data);
		

		$.ajax({
			type: "POST",
			url: "/oaga/api/review",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			datatype: "json"
		}).done(function(xhr){
			console.log(xhr)
			alert("등록 성공");
		}).fail(function(error) {
			console.log(error)
			alert("등록 실패");
		});
		
	},
	
	temSave: function() {
		
		let data = {
			title: $("#r_title").val(),
			areaName: $("#r_place").val(),
			theme: $("input[type=radio][name=r_theme]:checked").val(),
			content: $("#content").val(),
			isWriting: $("#btn-t-save").val()
		}
		
		console.log("데이터 확인")
		console.log(data);
		

		$.ajax({
			type: "POST",
			url: "/oaga/api/review",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			datatype: "json"
		}).done(function(xhr){
			console.log(xhr)
			alert("임시 저장 성공");
		}).fail(function(error) {
			console.log(error)
			alert("임시 저장 실패");
		});
		
	},
	
	
	
}

index.init();

