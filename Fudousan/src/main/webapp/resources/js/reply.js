/**
 *  reply 
 */



// select Reply 
$(function(){

	var text = $('#text').val();
	var estateId = $('#estateId').val();
	var memberId = $('#memberId').val();
	$.ajax({
		url: "../selectReply",
		type: "POST",
		dataType: "json",
		success : function(data){
			var str = "";
			console.log(data);
			$(data).each(function(index, reply){		
			str +=
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
				'<strong >'+reply.member.memberId+'</strong><span class="text-muted" >'+reply.creDate+'</span>'+
				'</div>'+
				'<div class="panel-body">'+
				'<p>'+reply.text+'</p>'+
				'<hr>'+
				'<div>'+
				'<input type="button" class="btn btn-info" value="update" >'+
				'<input type="button" class="btn btn-warning delete" value="delete">'+
				'</div>'+
				'</div>'+
				'</div><!-- /panel panel-default -->'+
				'</div><!-- /col-sm-5 -->'
				+'<input type="hidden" class="replyId" value="'+reply.replyId+'">'
				;
					
				
			});
			$('#replyBox').append(str);
			
		},
		error: function(e){
			console.log(e);
			alert("리플 가져오기 실패");
		}
	});



	$('#replyButton').on('click', function(){
		$.ajax({
			url: "../insertReply",
			type: "POST",
			data:{
			
				"estateId":estateId,
				"memberId":memberId,
				"text":text
			},
			dataType: "json",
			success : function(data){
				var str = "";
				
			} 
			
		});

	});

	$('#replyBox').on('click' , function(e){
		
		var replyId = $('.replyId').val();
		console.log(replyId);
		if ($(e.target).is(".delete")) {
			
			$.ajax({
				url: "../deleteReply",
				type: "POST",
				data:{
					"replyId":replyId
				},
				dataType: "json",
				success : function(data){
					
				} 
			});
		}
	});
});


