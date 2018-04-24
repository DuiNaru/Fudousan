$(function(){
	$('#loginBtn').on('click', function(){
		formCheck();
	});
})

function formCheck(){
	var memberEmail = $('#memberEmail');
	var password = $('#password');
	
	if (memberEmail.val() == ''){
		alert('Input your name');
		memberID.focus();
	}
	else if (password.val() == ''){
		alert('Input your password');
		password.focus();
	}
	else {
		$.ajax({
			url: '/fudousan/login',
			type: 'post',
			data: {email: memberEmail.val(), password: password.val()},
			dataType: 'json',
			success: function(result){
				console.dir(result);
				if (result.result == false && result.errCode == '1'){
					alert('Not found ID');
				}
				else if (result.result == false && result.errCode == '2'){
					alert('Incorrect password');
				}
				else {
					
					$('#loginModal').modal('hide');
					var str ="";
			
					var lang = getCookie("lang");
					
					if (lang == "ko"){
						
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout" data-lang ="1">Logout</a></li>';
						
				
						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="85">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="87">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate" data-lang ="85">Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="86">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="88">Admin page</a></li>';
							
						}
						
						str +=  '<li><a href="javascript:selectLanguage(\'ko\')">한국어</a></li>'+
								'<li><a href="javascript:selectLanguage(\'jp\')">日本語</a></li>'+
								'<li><a href="javascript:selectLanguage(\'en\')">English</a></li>';  
						
						
						$('#navbar-ul').html(str);
							
							
					} else if (lang == "jp"){
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout" data-lang ="1">Logout</a></li>';
						
						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="85">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="87">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="86">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="88">Admin page</a></li>';
									
					}
						str +=  '<li><a href="javascript:selectLanguage(\'ko\')">한국어</a></li>'+
								'<li><a href="javascript:selectLanguage(\'jp\')">日本語</a></li>'+
								'<li><a href="javascript:selectLanguage(\'en\')">English</a></li>';  
						
						$('#navbar-ul').html(str);
							
							
					} else if (lang == "en"){
						
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout">Logout</a></li>';

						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="85">Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="84">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate" data-lang ="85">Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="84">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate" data-lang ="85">Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="84">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="84">Admin page</a></li>';
							
						}
						
						str +=  '<li><a href="javascript:selectLanguage(\'ko\')">한국어</a></li>'+
								'<li><a href="javascript:selectLanguage(\'jp\')">日本語</a></li>'+
								'<li><a href="javascript:selectLanguage(\'en\')">English</a></li>';  
						
						$('#navbar-ul').html(str);							
					}
						
					
					
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}