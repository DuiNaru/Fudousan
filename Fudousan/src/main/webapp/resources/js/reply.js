/**
 *  reply 
 */
// select Reply 
$(function(){
	$.ajax({
		url: "../selectReply",
		type: "POST",
		dataType: "json",
		success : function(data){
			var str = "";
			$(data).each(function(index, reply){
				
			str +=
				'<div id="topBox'+reply.replyId+'">'+
				'<div class="col-sm-1">'+
				'<div class="thumbnail">';
			if(reply.member.picture !=null){
				str +=	'<img class="img-responsive user-photo" src="'+reply.member.picture+'">';
			
			}else{	
				str +=	'<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">';
			}
			str	+='</div><!-- /thumbnail -->'+
				'</div><!-- /col-sm-1 -->'+
				'<div class="col-sm-5">'+
				'<div class="panel panel-default" id="replyBox">'+
				'<div class="panel-heading">'+
				'<strong >'+reply.member.email+'</strong><br><span class="text-muted" >'+changeSecond(reply.creDate)+'</span>'+
				'</div>'+
				'<div class="panel-body">'+
				'<p id="textBox'+reply.replyId+'">'+reply.text+'</p>'+
				'<hr>'+
				'<div>'+
				'<input type="button" class="btn btn-info" value="Update" onclick="updateReply('+reply.replyId+')">'+
				'&nbsp;'+
				'<input type="button" class="btn btn-warning delete" value="Delete" onclick="deleteReply('+reply.replyId+')">'+
				'</div>'+
				'</div>'+
				'</div><!-- /panel panel-default -->'+
				'</div><!-- /col-sm-5 -->'
				+'</div>';
					
				
			});
			$('#replyBox').append(str);
			
		},
		error: function(e){
			console.log(e);
			alert("리플 가져오기 실패");
		}
	});
	
	$('#replyButton').on('click', function(){
		// insert
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
			dataType: "json",
			success : function(replyId){

				var result = Number(replyId);
				$.ajax({
					url: "../selectOne",
					type:"POST",
					data:{"replyId": result},
					dataType:"json",
					success: function(reply){
						var str = "";
						
						
						/*-----------------------------html tag--------------------------------*/
						str +=
							'<div id="topBox'+reply.replyId+'">'+
							'<div class="col-sm-1">'+
							'<div class="thumbnail">';
						if(reply.member.picture !=null){
							str +=	'<img class="img-responsive user-photo" src="'+reply.member.picture+'">';
						
						}else{	
							str +=	'<img class="img-responsive user-photo" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">';
						}
						str	+='</div><!-- /thumbnail -->'+
							'</div><!-- /col-sm-1 -->'+
							'<div class="col-sm-5">'+
							'<div class="panel panel-default" id="replyBox">'+
							'<div class="panel-heading">'+
							'<strong>'+reply.member.email+'</strong><br><span class="text-muted" >'+changeSecond(reply.creDate)+'</span>'+
							'</div>'+
							'<div class="panel-body">'+
							'<p>'+reply.text+'</p>'+
							'<hr>'+
							'<div>'+
							'<input type="button" class="btn btn-info" value="Update" onclick="updateReply('+reply.replyId+')">'+
							'&nbsp;'+
							'<input type="button" class="btn btn-warning delete" value="Delete" onclick="deleteReply('+reply.replyId+')">'+
							'</div>'+
							'</div>'+
							'</div><!-- /panel panel-default -->'+
							'</div><!-- /col-sm-5 -->'
							+'</div>';
								
						/*-----------------------------html tag--------------------------------*/

						$('#replyBox').append(str);
						$('#text').val("");
						 
						
					}
				});
			} 
		});
	});
});

function deleteReply(replyId){
	console.log("delete Reply");
	$.ajax({
		url: "../deleteReply",
		type: "POST",
		data:{
			"replyId":replyId
		},
		dataType: "json",
		success : function(obj){
			$('#topBox'+replyId).remove();
		} 
	});
}

function updateReply(replyId){
	console.log("update Reply");
	$('#textBox'+replyId).after(
			'<div id="updateDiv'+replyId+'">'
			+'<input type="text" id="updateBox'+replyId+'" class="form-control" placeholder="input your new update texts">'
			+'<br>'
			+'<input type="button" class="btn btn-success" value="Ok" id="okButton'+replyId+'"  onclick="okButton('+replyId+')">'
			+'&nbsp;'
			+'<input type="button" class="btn btn-danger" value="Cancel" id="cancelButton'+replyId+'"  onclick="cancelButton('+replyId+')">'
			+'</div>'
	);


	
}

function okButton(replyId){
	console.log("dd");
	/*$.ajax({
		url: "../updateReply",
		type: "POST",
		data:{
			"replyId":replyId
		},
		dataType: "json",
		success : function(obj){
			$('#topBox'+replyId).remove();
		} 
	});*/
}

function cancelButton(replyId){
	$('#updateDiv'+replyId).remove();
}

function changeSecond(m){
	var date = new Date(m);
	return date.toString("yyyy-mm-dd");
}