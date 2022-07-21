
		$('#select').bind("click",() => {
			alert("");
		
		});
		

	function selectList(selectedId){
		
		let data = selectedId;
		
		
		
		console.log(data + "@@");
		
		$.ajax({
			type: "GET",
			url: `/oaga/api/admin/areaId/${data}`
		}).done(function(){
			addSelectedOption();
			
		}).fail(function(error){
			console.log(error);
		});
		
		
		
	}

	









function areaguListView(){
	let areaguListView = ``
}



function addSelectedOption() {
	console.log("들어온다아아아");
	let test = "가나다";
	
	let select = `<div class ="areaGuList" style="width: 100%; height: 30px;" id ="areaGuList"
							onclick ="">${areaList.guname}</div>`;
	console.log(select);
	
	$('#areaGu').append(select);
}

