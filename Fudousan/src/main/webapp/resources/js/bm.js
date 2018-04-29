/**
 * 
 */

function roomDeleteListener(roomId) {
	
	$.ajax({
		url:"./deleteRoom",
		type:"GET",
		data:{
			roomId : roomId
		},
		success:function(data) {
			if(data || data == "true") {
				$("#room"+roomId).remove();
			} else {
				alert("삭제에 실패하였습니다.");
			}
		},
		error:function(e) {
			console.log(e);
			alert("삭제 중 오류가 발생하였습니다.");
		}
	});
	
}