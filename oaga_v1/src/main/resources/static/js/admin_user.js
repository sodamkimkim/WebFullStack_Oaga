let token = $("meta[name='_csrf']").attr("content");
let header = $("meta[name='_csrf_header']").attr("content");

index = {
	deleteUser: function(userId) {
		var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
		if (deleteConfirm) {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},
				type: "DELETE",
				url: `/oaga/admin/deleteUser/${userId}`,
				dataType: "json"
			}).done(function(response) {
				console.log(response.data);
				updateDeleteUser(userId);
			}).fail(function(error) {
				console.log(error);
			});
		}
	},

	getUserList: function(value) {
		if (value == 1) {
			// 전체보기
			location.href = "/oaga/admin/user";
		} else {
			$.ajax({
				beforeSend: function(xhr) {
					xhr.setRequestHeader(header, token)
				},
				type: "GET",
				url: `/oaga/admin/getUser/${value}`,
				dataType: "json"
			}).done(function(response) {
				console.log(response.data);
				changeUserList(response.data.content);
			}).fail(function(error) {
				console.log(error);
			});
		}
	}
}

function updateDeleteUser(userId) {
	$('#btn-delete-' + userId).remove();
	$('#td-' + userId).text("삭제완료");
}

function changeUserList(userList) {

	$('#admin-user-tbody').empty();
	let a = userList.length;
	console.log(a);
	if (a != 0) {
		var userListElement = new Array();
		for (let i = 0; i < a; i++) {
			userListElement[i] = `
								<tr class="tr-user-delete">
									<td>${userList[i].id}</td>
									<td>${userList[i].username}</td>
									<td>${userList[i].userNickName}</td>
									<td>${userList[i].email}</td>
									<td>${userList[i].oauth}</td>
									<td>${userList[i].createDate}</td>
									<td class="td-user-delete" id="td-${userList[i].id}"><button
											class="user-delete-btn"
											onclick="index.deleteUser(${userList[i].id});"
											id="btn-delete-${userList[i].id}">회원 삭제</button></td>
								</tr>`
		}

		$('#admin-user-tbody').append(userListElement);
	}



}