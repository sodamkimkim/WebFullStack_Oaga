arealist();

function arealist(){
	alert("hello student");
	let data = {
		id: $("#id").val(),
		content: $("#content").val,
		imageUrl: $("#imageUrl").val	
	}
	$.ajax({
		tpye: "POST",
		url: "/oaga/area_list/${data.id}",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataTpye: "json",
		
	})
	.done(function(data){
		alert("성공");
	})
	.fail(function(error){
		alert("실패");
	});
	
}
		

			
	
