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
					
					$('#navbar-ul').html(str);
					var lang = getCookie("lang");
					
					if (lang == "ko"){
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout" data-lang ="1">Logout</a></li>';
				
				
						if (result.permissionId == 1) {
								str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/mypageNormalUser">Member Page</a></li>';
							}else if(result.permissionId == 2){
								str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/interior/">Interior Page</a>';
							}else if(result.permissionId == 3){
								str += '<li><a href="/fudousan/memberupdate/agencyupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/bm">Agency Page</a></li>';
							}else if(result.permissionId == 4){
								str += '<li><a href="/fudousan/admin/">Admin page</a></li>';
								
							}
							$('#navbar-ul').html(str);
							
							
					} else if (lang == "jp"){
							str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout">Logout</a></li>';
					
							if (result.permissionId == 1) {
								str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/mypageNormalUser">Member Page</a></li>';
							}else if(result.permissionId == 2){
								str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/interior/">Interior Page</a>';
							}else if(result.permissionId == 3){
								str += '<li><a href="/fudousan/memberupdate/agencyupdate">Update Member</a></li>'
									+  '<li><a href="/fudousan/bm">Agency Page</a></li>';
							}else if(result.permissionId == 4){
								str += '<li><a href="/fudousan/admin/">Admin page</a></li>';
								
							}
							$('#navbar-ul').html(str);
						
						
					} else if (lang == "en"){
					
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout">Logout</a></li>';
				
				
						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate">Update Member</a></li>'
								+  '<li><a href="/fudousan/bm">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/">Admin page</a></li>';
							
						}
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