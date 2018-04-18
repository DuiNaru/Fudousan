$(function(){
	let xhr = new XMLHttpRequest();
	let url = "/fudousan/resources/locale/translation.json";
	
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			translation(JSON.parse(xhr.responseText));
		}
	}
	xhr.open("GET", url, true);
	xhr.send();
	
	let translation = function(json){
		let lang = getCookie("lang");
		
		if (lang !== ""){
			changeLanguage(lang, json);
		}
		else {
			// 기본 설정 언어 -> 한국어
			lang = "ko";
			
			changeLanguage(lang, json);
		}
	};
	
	let changeLanguage = function(lang, json){
		let span = $.makeArray($("span").map(function(){
			return $(this).data("lang");
		}));
		
		let jsonLang = json[lang];
		
		for (let i = 0; i < span.length; i++){
			$("span[data-lang=" + span[i] + "]").html(jsonLang[span[i]]);
		}
	};
})

let selectLanguage = function(lang){
	setCookie("lang", lang, 365);
	
	window.location.reload();
};