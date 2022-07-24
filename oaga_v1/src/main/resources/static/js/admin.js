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
				alert("회원정보 수정에 실패하였습니다.")

			});
		});
	},
}

index.init();

//	deleteById: function() {
//		let id = $("#board-id").text(); // board-id의 value가 아니라 content를 들고와야 하기 때문에 .val()이 아니라 .text()
//		$.ajax({
//			type: "DELETE",
//			url: "/api/board/" + id//data를 return이라서 api에 요청
//		}).done(function(data) {
//			if (data.status) {
//				alert("삭제가 완료되었습니다.");
//				location.href = "/";
//			}
//		})
//			.fail(function() {
//				alert("삭제에 실패하였습니다.")
//			});
//	},
//