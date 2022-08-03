index = {
	deleteUser: function(userId) {
		var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
		if (deleteConfirm) {
			$.ajax({
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
	}
}

function updateDeleteUser(userId) {
	$('#btn-delete-' + userId).remove();
	$('#td-' + userId).text("삭제완료");
}