let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

let index = {
	init: function() {
		$(".searchArea-input").keypress(function(e) {
			if (e.keyCode == 13) e.preventDefault();
		});
		$("#searchArea").autocomplete({
			source: function(request, response) { 
				$.ajax({
					beforeSend: function(xhr) {
						xhr.setRequestHeader(header, token)
					},
					url: "/oaga/ajax/autocomplete.do"
					, type: "POST"
					, dataType: "JSON"
					, data: { value: request.term }	
					, success: function(data) { 	
						response(
							$.map(data.resultList, function(item) {
								return {
									label: item.area    	
									, value: item.area 		
									, idx: item.id 
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
			return $('<li style="display: block; width: 96.5%;">').append('<a class="area_search_item" style = "display-block; width: 99.5%;"><span class="search_name" style = "display-block; width: 97%;">' + item.label + '</span></a>')
				.appendTo(ul);
		};

	}
}


index.init();
