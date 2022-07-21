
		$('#select').bind("click",() => {
			alert("");
		
		});
		

	function selectList(selectedId){
		
		let data = selectedId;

		$.ajax({
			type: "GET",
			url: `/oaga/api/admin/areaId/${data}`
		}).done(function(response){
			addSelectedOption(response);
		}).fail(function(error){
			console.log(error);
		});
		
		
		
	}

	









function areaguListView(){
	let areaguListView = ``
}



function addSelectedOption(response) {
	$('#areaGu').empty();
	var test = response.data; 
	var a = test.length ; 
	var select = new Array();
	
	for(let i = 0; i <= a-1; i++){
		select[i] = `
					 <div  style="height: 100%; width: 100%; border: 1px solid; margin-bottom:5px; ">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">
								<div class ="areaGuList" style="width: 100%; height: 30px;" id ="areaGuList"
								onclick ="">${test[i].guname}</div>
						</c:forEach>				
					</div>`;

	}
	$('#areaGu').append(select);	

	 
	
	
}

