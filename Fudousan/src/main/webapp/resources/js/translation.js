$(function(){
	//$("style").append("* {font-family: 'Yu Gothic';}");
	
	let lang = getCookie("lang");
	let url = "";
	
	if (lang === ""){
		lang = "ko";
		url = "/fudousan/resources/locale/ko.json";
	}
	else {
		url = "/fudousan/resources/locale/" + lang + ".json";
	}
	
	let xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			changeLanguage(lang, JSON.parse(xhr.responseText));
		}
	}
	xhr.open("GET", url, true);
	xhr.send();
	
	let changeLanguage = function(lang, json){
		$("[data-lang]").each(function(){
			let element = $(this);
			
			if (element[0].tagName === "INPUT" || element[0].tagName === "TEXTAREA"){
				element.attr("placeholder", json[element.data("lang")]);
			}
			else {
				element.html(json[element.data("lang")]);
			}
		});
	};
})

let selectLanguage = function(lang){
	setCookie("lang", lang, 365);
	
	window.location.reload();
};