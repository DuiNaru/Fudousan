$(function(){
	let lang = getCookie("lang");
	let url = "";
	
	if (lang === ""){
		lang = "ko";
		url = "/fudousan/resources/locale/ko.json";
	}
	else {
		url = "/fudousan/resources/locale/" + lang + ".json";
	}
	
	$.ajax({
		url: url,
		type: "get",
		dataType: "json",
		success: function(res){
			changeLanguage(lang, res);
		},
		error: function(err){
			console.log(err);
		}
	});
	
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