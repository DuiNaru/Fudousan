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
			url: 'login',
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
					
					$('#loginAtag').html('<a href="/fudousan/logout">Logout</a>');
					
					var str = '<a>' + result.memberName + ', Welcome!</a>';
					$('#loginNameTag').html(str);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}