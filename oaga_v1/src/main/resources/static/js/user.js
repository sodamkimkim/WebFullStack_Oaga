let index = {
	init: function() {

		$("#btn-update").bind("click", () => {
			this.update();
		});
		
		$("#btn-Follow").bind("click", () => {
			this.follow();
		});
		
		$("#btn-UnFollow").bind("click", () => {
			this.unFollow();
		});

	},

	update: function() {
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			userNickName: $("#userNickName").val(),
			email: $("#email").val()
		}
		$.ajax({
			type: "PUT",
			url: "/oaga/auth/user",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(data) {
			if (data.status) {
				alert("회원정보 수정이 완료되었습니다.")
				location.href = "/oaga/myPage_form";
			}

		}).fail(function(error) {
			alert("회원정보 수정에 실패하였습니다.")

		});
	}, // end of update
	
	follow: function() {
		
		let userId = $("#userId").val();
		
		$.ajax({
			type: "POST",
			url: `/oaga/api/follow/${userId}`,
		}).done(function() {
			alert("팔로우 정보 저장 완료!");
		}).fail(function() {
			alert("팔로우 정보 저장 실패!");
		});
	},
	
	unFollow: function() {
		let userId = $("#userId").val();
		
		$.ajax({
			type: "DELETE",
			url: `/oaga/api/follow/${userId}`
		}).done(function() {
			alert("언팔 성공");
		}).fail(function() {
			alert("언팔 실패");
		});
	}
}
index.init();