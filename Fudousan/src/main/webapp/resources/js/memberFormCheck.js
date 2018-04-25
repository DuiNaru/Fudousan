/**
 * Member Form Check 
 */

function formsubmit() {
	if ($("#InputName").val() == null || $("#InputName").val() == "") {
		$("#InputName").focus();
		return false;
	}
	if ($("#InputPassword1").val() == null || $("#InputPassword1").val() == "") {
		$("#InputPassword1").focus();
		return false;
	}
	if ($("#InputPassword1").val() == $("#InputPassword2").val()) {
		return false;
	}
	if ($("#InputPassword2").val() == null || $("#InputPassword2").val() == "") {
		$("#InputPassword2").focus();
		return false;
	}
	if ($("#InputEmail").val() == null || $("#InputEmail").val() == "") {
		$("#InputEmail").focus();
		return false;
	}
	if ($("#InputText").val() == null || $("#InputText").val() == "") {
		$("#InputText").focus();
		return false;
	}
	if ($("#InputPhoto").val() == null || $("#InputPhoto").val() == "") {
		$("#InputPhoto").focus();
		return false;
	}
	if ($("#agree").is(":checked") == false) {
		return false; 
	}
	
	return true;
}