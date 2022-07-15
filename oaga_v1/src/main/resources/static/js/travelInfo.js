var swiperContainer = new Swiper('.swiper-container', {
    slidesPerView: 2, //슬라이드 엘리먼트를 몇개나 보여줄 것인지 설정
    loop: false,
   
});
 
 
 
function getAreaId(){
	let data = {
		id: $(".id").val(),
	}
	console.log(data);
	$.ajax({
		type: "POST",
		url: "/api/getAreaId/" + id,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(function(){
		alert("ddd");
	}).fail(function(){
		
	});
}