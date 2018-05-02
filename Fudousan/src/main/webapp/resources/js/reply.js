/**
 *  reply 
 */
// select Reply 
$(function(){
	$.ajax({
		url: "../selectReplyEstate",
		type: "POST",
		data:{
			"estateId":$('#estateId').val()		
		},
		dataType: "json",
		success : function(data){
			
			var memberId = $('#memberId').val();
			var str = "";
			
			$(data).each(function(index, reply){
				console.log(index);
				console.log(str);
				
				str +=
					'<div id="topBox'+reply.replyId+'">'+
					'<div class="col-sm-1" id="innerBox'+reply.replyId+'">'+
					'<div class="thumbnail">';
				if(reply.member.picture !=null){
					str +=	'<img class="img-responsive user-photo" src="/fudousan'+reply.member.picture+'">';
					
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
				'<p id="textBox'+reply.replyId+'">'+reply.text+'</p>';
				
				if (reply.member.memberId == memberId) {
					str +=
						'<hr>'+
						'<div>'+
						'<button type="button" class="btn btn-info"  data-lang="181" onclick="updateReply('+reply.replyId+')"></button>'+
						'&nbsp;'+
						'<button type="button" class="btn btn-warning delete"  data-lang="182" onclick="deleteReply('+reply.replyId+')"></button>';
				}	
				str+='</div>'+
				'</div>'+
				'</div><!-- /panel panel-default -->'+
				'</div><!-- /col-sm-5 -->'
				+'</div>';				
			});
			
			$('#replyBox').append(str);
			translation();
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
							str +=	'<img class="img-responsive user-photo" src="/fudousan'+reply.member.picture+'">';
						
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
							'<p id="textBox'+reply.replyId+'">'+reply.text+'</p>'+
							'<hr>'+
							'<div>'+
							'<button type="button" class="btn btn-info" data-lang="181" onclick="updateReply('+reply.replyId+')"></button>'+
							'&nbsp;'+
							'<button type="button" class="btn btn-warning delete" data-lang="182" onclick="deleteReply('+reply.replyId+')"></button>'+
							'</div>'+
							'</div>'+
							'</div><!-- /panel panel-default -->'+
							'</div><!-- /col-sm-5 -->'
							+'</div>';
								
						/*-----------------------------html tag--------------------------------*/

						$('#replyBox').append(str);
						$('#text').val("");
						 
						translation();
					}
				});
			} 
		});
	});
});

function deleteReply(replyId){
	
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
	
	$('#textBox'+replyId).after(
			'<div id="updateDiv'+replyId+'">'
			+'<input type="text" id="updateBox'+replyId+'" class="form-control" data-lang="183">'
			+'<br>'
			+'<button type="button" class="btn btn-success" data-lang="184" id="okButton'+replyId+'"  onclick="okButton('+replyId+')"></button>'
			+'&nbsp;'
			+'<button type="button" class="btn btn-danger" data-lang="185" id="cancelButton'+replyId+'"  onclick="cancelButton('+replyId+')"></button>'
			+'</div>'
	);
	
	translation();

	
}

function okButton(replyId){
	
	$.ajax({
		url: "../updateReply",
		type: "POST",
		data:{
			"replyId":replyId,
			"text": $('#updateBox'+replyId).val()
		},
		dataType: "json",
		success : function(reply){
			
			$('#updateDiv'+replyId).remove();
			$('#textBox'+replyId).html(reply.text);	
		} 
	});
}

function cancelButton(replyId){
	$('#updateDiv'+replyId).remove();
}

function changeSecond(m){
	var date = new Date(m);
	return date.toString("yyyy-mm-dd");
}
