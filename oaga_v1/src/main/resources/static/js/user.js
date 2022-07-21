let index = {
	init: function() {

		$("#btn-myInfoUpdate").bind("click", () => {
			this.myInfoUpdate();
		});
		$("#btn_myProfileUpdate").bind("click", () => {
			this.myProfileUpdate();
		});

	},

	myInfoUpdate: function() {
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			userNickName: $("#userNickName").val(),
			email: $("#email").val()
		}
		$.ajax({
			type: "put",
			url: "/oaga/api/myinfoupdate",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(data) {
			if (data.status) {
				alert("회원정보 수정이 완료되었습니다.")
				location.href = "/oaga/mypage_form";
			}

		}).fail(function(error) {
			alert("회원정보 수정에 실패하였습니다.")

		});
	}, // end of update

	myProfileUpdate: function() {
		var form = $("#updateMyProfileForm")[0];
		var data = new FormData(form);
		$.ajax({
			type: "put",
			enctype: 'multipart/form-data',
			url: "/oaga/api/userprofileupdate",
			data: data,
			processData: false,
			contentType: false,
			success: function(data) {
				alert("complete");
				
				location.href = "/oaga";
			},
			error: function(e) {
				console.log("ERROR : ", e);
				alert("fail");
			}
		});


	}
}
index.init();