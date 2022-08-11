let index = {
	mapf: function() {
		let data = {
			address: $("#addressInfo").val(),
		}

		$.ajax({
			url: 'https://dapi.kakao.com/v2/local/search/address.json?query=' + encodeURIComponent(data.address),
			type: 'GET',
			headers: { 'Authorization': 'KakaoAK 41f12d87aaeb5a7da3f35f70e190c310' },
			success: function(data) {
				console.log(data);
				console.log(data.documents[0].x);
				console.log(data.documents[0].y);

				//x: "127.202128029885"
				//y: "37.294066695953"

				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					//	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
					center: new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x), //지도의 중심좌표.

					level: 3 //지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

			},
			error: function(e) { console.log(e); }
		});

	},
}

index.mapf();





