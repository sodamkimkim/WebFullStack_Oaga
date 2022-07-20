
let index = {
	init: function() {
		$('#select').bind("click",() => {
			alert("");
		
		});
		$('.areaList').bind("click",() =>{
			this.selectList();
		});

	},
	
	selectList : function(){
		for(let i =1; i<=5; i++){
			let data = {
			
			id : $("#areaId" + i).val(),
		}
		let datanum = $("#areaId").val()
			console.log(datanum);
		console.log(data.id + "@@");
		$.ajax({
			type: "POST",
			url: `/oaga/api/admin/areaId/${data.id}`,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(datanum){
			areaguListView(datanum);
			
		}).fail(function(){
			
		});
		}
		
		
	}
}
	





index.init();



function areaguListView(){
	let areaguListView = ``
}



function addSelectedOption() {
	let select = `<option value=1">1</option>`
	console.log('옵션');
	$('#dropdown').append(select);
}

