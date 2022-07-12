let index = {
	init: function() {
		$("#btn_join").bind("click", ()=>{
			this.save();
		});
		
		//TODO update 만들어 주기
		
	},
	save: function() {
		let data = {
			userInputId: $("#userInputID").val(),
			password: $("#password").val(),
			email: $("#email").val()
		}
		console.log("user-save-data"+data);
	},
	update: function() {
		
		
	}

	
}
index.init();
