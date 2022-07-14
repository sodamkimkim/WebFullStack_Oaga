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
		
		var formData = new FormData();
		var inputFile = $("input[name='r_image']");
		console.log(inputFile);
		formData.append("file", inputFile);
		formData.append("title", $("#r_title").val());
		formData.append("areaName", $("#r_place").val());
		formData.append("theme", ($("input[type=radio][name=r_theme]:checked").val()));
		formData.append("content", $("#content").val());
		formData.append("isWriting", $("#btn-save").val())

		console.log("데이터 확인")
		console.log(formData);
		
		$.ajax({
			type: "POST",
			url: "/oaga/api/review",
			processData : false,
			contentType: false,
			data: formData
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

