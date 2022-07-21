let index = {
	init: function() {
		$("#searchArea").autocomplete({
			source: function(request, response) {
				var a = $("#searchArea").val();
				console.log(a);
				$.ajax({
					type: "GET",
					url: `/oaga/api/searchArea/${a}`
					//data: {searchArea: $("#searchArea").val()}
				}).done(function(response) {
					if (response.status) {
						console.log(response.data);
						addSearchElement(response.data);
					}
				}).fail(function() {
					console.log("통신 실패");
				});
			}
		});

	}
}

function addSearchElement(results) {
	var childElement = new Array();
	var a = results.length;
	if (a == 0) {
		$("#area_search_div").remove();
	} else {
		for (let i = 0; i <= a - 1; i++) {
			childElement[i] = `<a class="area_search_item"><span class="search_name">${results[i].area}</span></a>`;
		}
	}

	$("#area_search_div").prepend(childElement);
}
index.init();

