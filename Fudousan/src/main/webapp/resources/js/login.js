function formCheck(){
	var memberID = $('#memberID');
	var password = $('#password');
	
	if (memberID.val() == ''){
		alert('Input your name');
		memberID.focus();
		
		return false;
	}
	if (password.val() == ''){
		alert('Input your password');
		password.focus();
		
		return false;
	}
	
	return true;
}
