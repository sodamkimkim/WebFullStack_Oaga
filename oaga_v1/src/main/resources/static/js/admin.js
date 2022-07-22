function test(){
	if($("#hotPlace").is(":checked")){
		$("#restaurant").disabled(true);
    console.log("hotPlace 체크 됨");
    
}else if($("#restaurant").is(":checked")){

    console.log("restaurant 체크 안됨");
    
}

}

	
	  $('#btn-save').bind("click",() => {
			alert("버튼 클릭");
			
		});
		
/*
function infoSave() {
		let data = {
			areaGuId : $("#areaGuId").val(),
			name: $("#name").val(),
			address: $("#address").val(),
			content: $("#content").val(),
			image: $("#image").val(),
			
		}
		
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: "/oaga/api/damin/guinfo/infoSave",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(data) {
			alert("여행지 정보 생성 성공");
		}).fail(function(error) {
			
			alert("생성 실패");
		});
		
	}
*/


		



// ==============================================
function selectList(selectedId){ // area 선택 시
		
		let data = selectedId;

		$.ajax({
			type: "GET",
			url: `/oaga/api/admin/areaId/${data}`
		}).done(function(response){
			addSelectedGuList(response); 
		}).fail(function(error){

		});
		
}
function addSelectedGuList(response) {// 구이름 뿌리기
	$('#areaGu').empty();
	var test = response.data; 

	var a = test.length ; 
	var select = new Array();
	
	for(let i = 0; i <= a-1; i++){
		select[i] = `
					 <div  style="height: 100%; width: 100%; border: 1px solid; margin-bottom:5px; ">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">
								<div class ="areaGuList" style="width: 100%; height: 30px;" id ="getAreaGuList"
								onclick ="areaGuClick(${test[i].id})">${test[i].guname}</div>
						</c:forEach>				
					</div>`;
		

	}
	
	$('#areaGu').append(select);		
}

// ====================================
	function areaGuClick(id){ // 추가 할 항목에 어느 areaGu인지 보여주는 녀석

		$.ajax({
			type: "GET",
			url: `/oaga/api/admin/areaIdGu/${id}`
		}).done(function(response){
			addSelectedGuName(response);
			
		}).fail(function(error){
			
		});
		
	}
	
	
function addSelectedGuName(response){

	$('#areaGuName').empty();
	var setName = response.data;
	
	var guName1 = `<input type ="hidden" value ="${setName[0].id}"  id = "areaGuId" name ="areaGuId">
					<h3 style="margin-bottom: 10px; font-size: 40px;">${setName[0].guname}</h3>`;
	$('#areaGuName').append(guName1);
}
	
