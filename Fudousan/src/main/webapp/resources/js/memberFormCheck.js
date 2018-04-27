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
	if ($("#InputPassword1").val() != $("#InputPassword2").val()) {
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
	
	console.log($("#agree").prop("checked"));
	
	if ($("#agree").prop("checked")) {
		return false; 
	}
	
	return true;
}