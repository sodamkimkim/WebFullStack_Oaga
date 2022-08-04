let token=$("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");



let index = {
	init: function() {

		$("#btn-myInfoUpdate").bind("click", () => {
			this.myInfoUpdate();
		});
		$("#btn_myProfileUpdate").bind("click", () => {
			this.myProfileUpdate();
		});

		$("#btn-Follow").bind("click", () => {
			this.follow();
		});

		$("#btn-UnFollow").bind("click", () => {
			this.unFollow();
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
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)
            },
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
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)
            },
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
	},


	follow: function() {

		let userId = $("#userId").val();

		$.ajax({
			beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token)
            },
			type: "POST",
			url: `/oaga/api/follow/${userId}`,
		}).done(function() {
			location.href = `/oaga/userpage_form_l/${userId}`;
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
			location.href = `/oaga/userpage_form_l/${userId}`;
		}).fail(function() {
			alert("언팔 실패");
		});
	},



}

index.init();









