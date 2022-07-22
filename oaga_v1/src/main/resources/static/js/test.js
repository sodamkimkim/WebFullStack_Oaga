$(function() {    //화면 다 뜨면 시작
	$("#searchInput").autocomplete({
		source: function(request, response) {
			$.ajax({
				type: 'get',
				url: "/json",
				dataType: "json",
				//data: {"param":"param"},
				success: function(data) {
					//서버에서 json 데이터 response 후 목록에 추가
					response(
						$.map(data, function(item) {    //json[i] 번째 에 있는게 item 임.
							return {
								label: item + "label",    //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
								value: item,    //그냥 사용자 설정값?
								test: item + "test"    //이런식으로 사용

								//[
								//    {"name": "하늘이", "dogType": "푸들", "age": 1, "weight": 2.14},
								//    {"name": "콩이", "dogType": "푸들", "age": 3, "weight": 2.5},
								//    {"name": "람이", "dogType": "허스키", "age": 7, "weight": 3.1}
								//]
								// json이 다음 처럼 넘어오면
								// 상황 : name으로 찾고 dogType을 넘겨야 하는 상황이면 
								// label : item.dogType ,    //오토컴플릿이 되고 싶은 단어 
								// value : item.family ,    //넘겨야 하는 단어
								// age : item.age ,
								// weight : item.weight
							}
						})
					);
				}
			});
		},    // source 는 자동 완성 대상
		select: function(event, ui) {    //아이템 선택시
			console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
			console.log(ui.item.label);    //김치 볶음밥label
			console.log(ui.item.value);    //김치 볶음밥
			console.log(ui.item.test);    //김치 볶음밥test

		},
		focus: function(event, ui) {    //포커스 가면
			return false;//한글 에러 잡기용도로 사용됨
		},
		minLength: 1,// 최소 글자수
		autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
		classes: {    //잘 모르겠음
			"ui-autocomplete": "highlight"
		},
		delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
		//            disabled: true, //자동완성 기능 끄기
		position: { my: "right top", at: "right bottom" },    //잘 모르겠음
		close: function(event) {    //자동완성창 닫아질때 호출
			console.log(event);
		}
	});

});

$(function() {    //화면 다 뜨면 시작
	$("#searchInput").autocomplete({
		source: function(request, response) {

			//위에 있는 코드랑 동일 생략//


		}
	}).autocomplete("instance")._renderItem = function(ul, item) {    //요 부분이 UI를 마음대로 변경하는 부분
		return $("<li>")    //기본 tag가 li로 되어 있음 
			.append("<div>" + item.value + "<br>" + item.label + "</div>")    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
			.appendTo(ul);
	};
});
