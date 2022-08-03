
let index = {
	init: function() {
		$(".adD_listItem_btn").click(function() {
			var str = "";
			var tdArr = new Array();
			var adD_listItem_btn = $(this);
			console.log(adD_listItem_btn.text());

			var tr = adD_listItem_btn.parent().parent();
			var td = tr.children();
			console.log(td.eq(0).text()); // 레스토랑 이름
			console.log(td.eq(1).text()); // 레스토랑 주소

			let id = td.eq(1).children().val();
			console.log(id);
			$.ajax({
				type: "delete",
				url: "/oaga/admin/deleterestaurant/" + id,
			}).done(function(data) {
				if (data.status) {
					alert("삭제가 완료되었습니다.");
					location.href = "/oaga/admin/deletepage/";
				}
			}).fail(function(error) {
				alert(" 수정에 실패하였습니다.")

			});
		});
	},
}
index.init();

// =====================================restaurant update
function selectrestaurantList(selectedId) { // area 선택 시

	let data = selectedId;
	console.log(data.data);
	
	
	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList3(response);
	}).fail(function(error) {

	});

}

function addSelectedGuList3(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	console.log(test + " test");
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div  style=" width: 100%; ">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList" style="width: 100%; height: 35px; cursor: pointer;" id ="getAreaGuList"
								onclick ="areaGuClick3(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}
function areaGuClick3(id) {



	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/restaurantUpdate/${id}`
	}).done(function(response) {
		addSelectedRestaurant(response);
		console.log(response.data);
	}).fail(function(error) {

	});

}
function addSelectedRestaurant(response) { //guinfo 리스트 뿌리기 

	$('#restaurantList').empty();

	var restaurantName = response.data;
	var a = restaurantName.length;
	if (a != 0) {
		var restaurantNameList = new Array();
		for (let i = 0; i < a; i++) {
			restaurantNameList[i] = `<c:forEach var="restaurant" items="${restaurantName}">
								<div style="width: 100%; height: 30px;border: 1px solid; margin-bottom:5px; cursor: pointer;"
								onclick ="restaurantclick(${restaurantName[i].id})">
									${restaurantName[i].name}
								</div>
							</c:forEach>`
		}


		$('#restaurantList').append(restaurantNameList);
	} else if (a == 0) {
		var error = `<div>데이터가 없습니다.</div>`
		$('#restaurantList').append(error);
	}






}

function restaurantclick(updateId) { // guinfo 리스트 클릭했을때 어펜듬

	let data = updateId;
	console.log(data);
	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/restaurant_info/${data}`
	}).done(function(response) {
		console.log(response + "dsa,[pdasm,p]");

		setRestaurantData(response);
	}).fail(function() {

	})
}


function setRestaurantData(estaurantData) {
	$('#restaurantList').empty();

	let setData = estaurantData.data;
	console.log(setData[0].id);
	var restaurantDataApend = `<br/>
						<br/>
						
						
						<form action="/oaga/api/admin/restaurant/update/${setData[0].id}" method="post" enctype="multipart/form-data">
						<input type="hidden" id = "categoryType" name = "areaGuId" value="${setData[0].areaGuId}"> 
						<input type="hidden" id = "categoryType" name = "categoryType" value="${setData[0].categoryType}"> 
						<label >이름 :</label>
						<input style="margin-bottom: 20px; height: 35px;" name = "name"id = "setname" value = ${setData[0].name}>
						<br/>
						<br/>
						<label>주소 :</label>
						<input style="margin-bottom: 20px; height: 35px;"name = "address" id = "setaddress" value = ${setData[0].address}>
						<br/>
						<br/>
						<label>내용 :</label>
						<input style="margin-bottom: 20px; height: 35px;"name = "content" id = "setcontent" value = ${setData[0].content}>
						<br/>
						<br/>
						<label class="r_image_label" for="r_image" >파일 선택</label> 						
						<input type="file"class="r_image_input" id="image" name="file" accept="image/*"
						required="required"
						onchange="javascript:document.getElementById('r_imageUrl').value = ${setData[0].image}">
								
						<input class="upload_name" id="setimage" name = "image" readonly="readonly"placeholder="${setData[0].image}"">
						
						<div>
							<button class="btn btn-primary" id="btn-update" type="submit""
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">수정</button>
							
							<a type="button" class="btn btn-primary" onclick="addSelectedRestaurant(${setData[0].areaGu.id})";
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">뒤로가기</a>
						</div>
						</form>
						`

	$('#restaurantList').append(restaurantDataApend);
}







// end of update




// =====================================end restaurant update

// =====================================guinfo update
function selectList2(selectedId) { // area 선택 시

	let data = selectedId;

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList2(response);
	}).fail(function(error) {

	});

}

function addSelectedGuList2(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div>
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList"id ="getAreaGuList"
								onclick ="areaGuClick2(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}
function areaGuClick2(id) {


	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/guinfoupdate/${id}`
	}).done(function(response) {
		addSelectedGuInfo(response);

	}).fail(function(error) {

	});

}
function addSelectedGuInfo(response) { //guinfo 리스트 뿌리기 

	$('#guinfoList').empty();

	var guinfoName = response.data;
	var a = guinfoName.length;
	if (a != 0) {
		var guinfoNameList = new Array();
		for (let i = 0; i < a; i++) {
			guinfoNameList[i] = `<c:forEach var="guinfoList" items="${guinfoName}">
								<div style="width: 100%; height: 33px;  border-bottom: 2px solid #333;cursor: pointer;"
								onclick ="guinfoclick(${guinfoName[i].id})">
									${guinfoName[i].name}
								</div>
							</c:forEach>`
		}


		$('#guinfoList').append(guinfoNameList);
	} else if (a == 0) {
		var error = `<div>데이터가 없습니다.</div>`
		$('#guinfoList').append(error);
	}






}

function guinfoclick(updateId) { // guinfo 리스트 클릭했을때 어펜듬

	let data = updateId;
	console.log(data);
	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/guinfo_info/${data}`
	}).done(function(response) {
		console.log(response);
		setGuinfoData(response);
	}).fail(function() {

	})
}


function setGuinfoData(guinfoData) {
	$('#guinfoList').empty();

	let setData = guinfoData.data;
	console.log(setData[0].id);
	var guinfoDataApend = `<br/>
						<br/>
						
						
						<form action="/oaga/api/admin/guinfo/update/${setData[0].id}" method="post" enctype="multipart/form-data">
						<input type="hidden" id = "categoryType" name = "areaGuId" value="${setData[0].areaGuId}"> 
						<input type="hidden" id = "categoryType" name = "categoryType" value="${setData[0].categoryType}"> 
						<label >이름 :</label>
						<input style="margin-bottom: 20px; height: 35px;" name = "name" id = "name" value = ${setData[0].name}>
						<br/>
						<br/>
						<label>주소 :</label>
						<input style="margin-bottom: 20px; height: 35px;"name = "address" id = "address" value = ${setData[0].address}>
						<br/>
						<br/>
						<label>내용 :</label>
						<input style="margin-bottom: 20px; height: 35px;"name = "content" id = "content" value = ${setData[0].content}>
						<br/>
						<br/>
						
						<input class="upload_name" id="r_imageUrl" readonly="readonly" name = "originImageUrl"
						type = "hidden" value="${setData[0].originImageUrl}">
						
						<input type="file"class="r_image_input" id="image" name="file" accept="image/*"
						required="required"
						onchange="javascript:document.getElementById('r_imageUrl').value = this.value">

						<div>
							<button class="btn btn-primary" id="btn-update" type="submit"
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">수정</button>
							
							<a type="button" class="btn btn-primary" onclick="addSelectedGuInfo(${setData[0].areaGu.id})";
							style="width: 100px; height: 30px; float: right; margin-top: 80px; margin-right: 15px;">뒤로가기</a>
						</div>
						</form>
						`

	$('#guinfoList').append(guinfoDataApend);
}




// =====================================end update


// ==============================================
function selectList(selectedId) { // area 선택 시

	let data = selectedId;

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaId/${data}`
	}).done(function(response) {
		addSelectedGuList(response);
	}).fail(function(error) {

	});


}





function addSelectedGuName(response) {
	$('#areaGuName').empty();
	var setName = response.data;
	console.log(setName[0].guname + "@@#!#!#!#!");
	var guName = `<h3 style="font-size: 40px;">${setName.guname}</h3>`;
	$('#areaGuName').append(guName);

}

function addSelectedGuList(response) {//구칸에 구이름 뿌리기
	$('#areaGu').empty();

	var test = response.data;

	var a = test.length;

	var test = response.data;
	console.log(test);
	var a = test.length;

	var select = new Array();

	for (let i = 0; i <= a - 1; i++) {
		select[i] = `
					 <div  class="li_item">
						<c:forEach var="areaGuList" items="${test}" id ="areaGuList">


								<div class ="areaGuList" style="width: 100%; height: 35px; cursor: pointer;" id ="getAreaGuList"
								onclick ="areaGuClick(${test[i].id})">${test[i].guname}</div>

						</c:forEach>				
					</div>`;


	}
	$('#areaGu').append(select);
}


// ====================================
function areaGuClick(id) { // 추가칸에 추가 할 항목에 어느 areaGu인지 보여주는 녀석

	$.ajax({
		type: "GET",
		url: `/oaga/api/admin/areaIdGu/${id}`
	}).done(function(response) {
		addSelectedGuName(response);

	}).fail(function(error) {

	});

}


function addSelectedGuName(response) {

	$('#areaGuName').empty();
	var setName = response.data;

	var guName1 = `<input type ="hidden" value ="${setName[0].id}"  id = "areaGuId" name ="areaGuId">
					<h3 style="margin-bottom: 10px; font-size: 40px;">${setName[0].guname}</h3>`;
	$('#areaGuName').append(guName1);
}

