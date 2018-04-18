$(function(){
	let xhr = new XMLHttpRequest();
	let url = "/fudousan/resources/locale/translation.json";
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			translation(xhr.responseText);
		}
	}
	xhr.open("GET", url, true);
	xhr.send();
	
	let translation = function(transJSON){
		let lang = getCookie("lang");
		
		if (lang !== ""){
			
		}
		else {
			lang = "ko";
			
			let transObject = JSON.parse(transJSON);
			
			console.log(transObject["ko"]);
			
			/*let span = $.makeArray($("span").map(function(){
				return $(this).data("lang");
			}));
			
			for (let i = 0; i < span.length; i++){
				
			}*/
		}
	}
})