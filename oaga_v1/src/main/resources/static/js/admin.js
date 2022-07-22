function areaGuClick(guname, id) {

	console.log(guname);
	console.log(id);
	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaIdGu/${id}`
	}).done(function(response) {
		console.log(response);
		addSelectedGuName(response);

	}).fail(function(error) {

	});

}


function selectList(selectedId) {

	let data = selectedId;

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList(response);
	}).fail(function(error) {
		console.log(error);
	});



}

function infoSave12() {
	let data = {

		name: $("#name").val(),
		address: $("#address").val(),
		content: $("#content").val(),
		imgUrl: $("#imgUrl").val(),

	}

	console.log(data);

	$.ajax({
		type: "POST",
		url: "/oaga/api/damin/infoSave",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(response) {
		console.log(response);
		alert("여행지 정보 생성 성공");
	}).fail(function(error) {
		console.log(error);
		alert("생성 실패");
	});

}


function addSelectedGuName(response) {
	$('#areaGuName').empty();
	var setName = response.data;
	console.log(setName[0].guname + "@@#!#!#!#!");
	var guName = `<h3 style="margin-bottom: 10px; font-size: 40px;">${setName.guname}</h3>`;
	$('#areaGuName').append(guName);
}




function addSelectedGuList(response) {
	$('#areaGu').empty();
	var test = response.data;
	console.log(test);
	var a = test.length;
	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div  style="height: 100%; width: 100%; border: 1px solid; margin-bottom:5px; ">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">
								<div class ="areaGuList" style="width: 100%; height: 30px; cursor: pointer;" id ="getAreaGuList"
								onclick ="areaGuClick(${test[i].guname},${test[i].id})">${test[i].guname}</div>
						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}
