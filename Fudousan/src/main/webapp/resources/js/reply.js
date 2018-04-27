/**
 *  reply 
 */

var text = $('#text').val();
var estateId = $('#estateId').val();
var memberId = $('#memberId').val();

$.ajax({
	url: "../insertReply",
	type: "POST",
	data:{
	
		"estateId":estateId,
		"memberId":memberId,
		"text":text
	},
	dataType: "jason",
	success : function(data){
		var str = "";
		
	} 
	
});
