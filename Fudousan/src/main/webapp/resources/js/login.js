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
			url: '/fudousan/login',
			type: 'post',
			data: {email: memberEmail.val(), password: password.val()},
			dataType: 'json',
			success: function(result){
				console.dir("result email:"+result.email);
				if (result.result == false && result.errCode == '1'){
					alert('Not found ID');
				}
				else if (result.result == false && result.errCode == '2'){
					alert('Incorrect password');
				}
				else {
					
					$('#loginModal').modal('hide');
					var str ="";
					var buttonBar ="";
					var favoriteButton ="";
					var commentBox = "";
					var lang = getCookie("lang");
					console.dir("result email:"+result.email);
					if (lang == "ko"){
						
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout" data-lang ="1">Logout</a></li>';
						
						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="84">Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="85">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="84"  >Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="87">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate?email='+result.email+'" data-lang ="85" >Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="86">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="88">Admin page</a></li>';
						}
						
						str +=  '<li><a href="javascript:selectLanguage(\'ko\')"><img  src="/fudousan/resources/image/if_South Korea_15986.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'jp\')"><img  src="/fudousan/resources/image/if_Japan_92149.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'en\')"><img  src="/fudousan/resources/image/if_United States of America(USA)_16036.png"></a></li>';
							
						$('#navbar-ul').html(str);
						
						/*button Bar*/
						
						buttonBar += '<a class="btn btn-success btn-lg" href="../newRoom?estateId=${estateId}&roomPublic=0" id="3dModelButton">'+
						'	<span class="glyphicon glyphicon-print"></span> MODEL'+
						'</a>'+
						'<br><br>'+
						'<a data-toggle="modal" href="#3dDesignModal" class="btn btn-info btn-lg">'+
						'	<span class="glyphicon glyphicon-search"></span> DESIGN'+
						'</a>';
							
						$('#buttonBar').html(buttonBar);
						
						/*favorite*/
						favoriteButton +='<label id="star" for="id-of-input" class="custom-checkbox">'+
						'	  		<input type="checkbox" id="id-of-input"/>'+
						'	  		<i class="glyphicon glyphicon-star-empty" id="empty"></i>'+
						'	  		<i class="glyphicon glyphicon-star" id="full"></i>'+
						'		</label>';
						
						$('#favoriteBox').html(favoriteButton);	
						console.log("favorite:::::::::::"+$('#favoriteBox').val());
						
						$.getScript('/fudousan/resources/js/estateFavorite.js', function(){
							
						})
						
						/*commentBox*/
						commentBox += '<div class="col-sm-12">'+
						'							<label>Comment here</label>'+
						'							<textarea rows="3" class="form-control" id="text"></textarea>'+
						'							'+
						'							<br>	'+
						'							<input type="button" class="btn btn-info" id="replyButton" value="reply">'+
						'						</div>';
						$('#commentBox').html(commentBox);
						
						/*reply delete & update*/
				    	
							
					} else if (lang == "jp"){
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout" data-lang ="1">Logout</a></li>';
						
						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="84" >Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="85">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="84" >Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="87">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate?email='+result.email+'" data-lang ="84"  >Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="86">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="88">Admin page</a></li>';			
						}
						str +=  '<li><a href="javascript:selectLanguage(\'ko\')"><img  src="/fudousan/resources/image/if_South Korea_15986.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'jp\')"><img  src="/fudousan/resources/image/if_Japan_92149.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'en\')"><img  src="/fudousan/resources/image/if_United States of America(USA)_16036.png"></a></li>';

						
						$('#navbar-ul').html(str);
						
						/*button Bar*/
						
						buttonBar += '<a class="btn btn-success btn-lg" href="../newRoom?estateId=${estateId}&roomPublic=0" id="3dModelButton">'+
						'	<span class="glyphicon glyphicon-print"></span> MODEL'+
						'</a>'+
						'<br><br>'+
						'<a data-toggle="modal" href="#3dDesignModal" class="btn btn-info btn-lg">'+
						'	<span class="glyphicon glyphicon-search"></span> DESIGN'+
						'</a>';
							
						$('#buttonBar').html(buttonBar);
						
						/*favorite*/
						favoriteButton +='<label id="star" for="id-of-input" class="custom-checkbox">'+
						'	  		<input type="checkbox" id="id-of-input"/>'+
						'	  		<i class="glyphicon glyphicon-star-empty" id="empty"></i>'+
						'	  		<i class="glyphicon glyphicon-star" id="full"></i>'+
						'		</label>';
						$('#favoriteBox').html(favoriteButton);	
					
							
							
					} else if (lang == "en"){
						
						str +=   '<li><a>' + result.memberName + ', Welcome!</a></li>' 
							+	 '<li><a href="/fudousan/logout">Logout</a></li>';

						if (result.permissionId == 1) {
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="85"  >Update Member</a></li>'
								+  '<li><a href="/fudousan/mypageNormalUser" data-lang ="84">Member Page</a></li>';
						}else if(result.permissionId == 2){
							str += '<li><a href="/fudousan/memberupdate/memberupdate?email='+result.email+'" data-lang ="85" >Update Member</a></li>'
								+  '<li><a href="/fudousan/interior/" data-lang ="84">Interior Page</a>';
						}else if(result.permissionId == 3){
							str += '<li><a href="/fudousan/memberupdate/agencyupdate?email='+result.email+'" data-lang ="85"  >Update Member</a></li>'
								+  '<li><a href="/fudousan/bm" data-lang ="84">Agency Page</a></li>';
						}else if(result.permissionId == 4){
							str += '<li><a href="/fudousan/admin/" data-lang ="84">Admin page</a></li>';
						}
						
						str +=   '<li><a href="javascript:selectLanguage(\'ko\')"><img  src="/fudousan/resources/image/if_South Korea_15986.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'jp\')"><img  src="/fudousan/resources/image/if_Japan_92149.png"></a></li>'+
						'<li><a href="javascript:selectLanguage(\'en\')"><img  src="/fudousan/resources/image/if_United States of America(USA)_16036.png"></a></li>';

						$('#navbar-ul').html(str);	
						
					
						
						buttonBar += '<a class="btn btn-success btn-lg" href="../newRoom?estateId=${estateId}&roomPublic=0" id="3dModelButton">'+
						'	<span class="glyphicon glyphicon-print"></span> MODEL'+
						'</a>'+
						'<br><br>'+
						'<a data-toggle="modal" href="#3dDesignModal" class="btn btn-info btn-lg">'+
						'	<span class="glyphicon glyphicon-search"></span> DESIGN'+
						'</a>';
							
						$('#buttonBar').html(buttonBar);
						
						/*favorite*/
						favoriteButton +='<label id="star" for="id-of-input" class="custom-checkbox">'+
						'	  		<input type="checkbox" id="id-of-input"/>'+
						'	  		<i class="glyphicon glyphicon-star-empty" id="empty"></i>'+
						'	  		<i class="glyphicon glyphicon-star" id="full"></i>'+
						'		</label>';
						$('#favoriteBox').html(favoriteButton);	
						
					}

				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
}