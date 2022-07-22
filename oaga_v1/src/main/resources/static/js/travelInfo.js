let index = {
	init: function() {
		$("#searchArea").autocomplete({
			source: function(request, response) { //source: 입력시 보일 목록
				$.ajax({
					url: "/oaga/ajax/autocomplete.do"
					, type: "POST"
					, dataType: "JSON"
					, data: { value: request.term }	// 검색 키워드
					, success: function(data) { 	// 성공
						response(
							$.map(data.resultList, function(item) {
								return {
									label: item.area    	// 목록에 표시되는 값
									, value: item.area 		// 선택 시 input창에 표시되는 값
									, idx: item.id // index
								};
							})
						);    //response
					}
					, error: function() { //실패
						alert("오류가 발생했습니다.");
					}
				});
			}
			, focus: function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength: 1,// 최소 글자수
			delay: 100	//autocomplete 딜레이 시간(ms),
			, select: function(evt, ui) {
				console.log(ui.item.label);
				console.log(ui.item.idx);
				location.href = `/oaga/travel/areainfo/${ui.item.idx}`;
			}
		}).autocomplete('instance')._renderItem = function(ul, item) {
			console.log(item);

			return $('<li style="display: block; width: 96%;">').append('<a class="area_search_item"><span class="search_name">' + item.label + '</span></a>')

			.appendTo(ul);
		};

	}
}

/*function addSearchElement(results) {
	var childElement = new Array();
	var a = results.length;
	console.log(a);
	if (a == 0) {
		$("#area_search_div").remove();
	} else {
		for (let i = 0; i <= a - 1; i++) {
			childElement[i] = `<a class="area_search_item"><span class="search_name">${results[i].area}</span></a>`;
		}
		$("#area_search_div").prepend(childElement);
	}

}*/
index.init();
