let index = {
	init: function() {

		$("#btn-update").bind("click", () => {
			this.update();
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
	} // end of update
}
index.init();