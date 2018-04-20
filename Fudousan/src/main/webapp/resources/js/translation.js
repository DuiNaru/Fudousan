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
		if (lang === "jp"){
			$("style").append("* {font-family: 'Yu Gothic Medium'}");
		}
		
		let jsonLang = json[lang];
		
		let span = $.makeArray($("span").map(function(){
			return $(this).data("lang");
		}));
		
		for (let i = 0; i < span.length; i++){
			$("span[data-lang=" + span[i] + "]").html(jsonLang[span[i]]);
		}
		
		let input = $.makeArray($("input").map(function(){
			return $(this).data("lang");
		}));
		
		if (input.length > 0){
			for (let i = 0; i < input.length; i++){
				$("input[data-lang=" + input[i] + "]").attr("placeholder", jsonLang[input[i]]);
			}
		}
		
		let textarea = $.makeArray($("textarea").map(function(){
			return $(this).data("lang");
		}));
		
		if (textarea.length > 0){
			for (let i = 0; i < textarea.length; i++){
				$("textarea[data-lang=" + textarea[i] + "]").attr("placeholder", jsonLang[textarea[i]]);
			}
		}
	};
})

let selectLanguage = function(lang){
	setCookie("lang", lang, 365);
	
	window.location.reload();
};