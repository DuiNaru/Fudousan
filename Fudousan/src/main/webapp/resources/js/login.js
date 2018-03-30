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
				if (!result){
					alert('Login failed');
				}
				else {
					$('#loginModal').modal('hide');
					
					$('#loginAtag').html('<a href="/fudousan/logout">Logout</a>');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}