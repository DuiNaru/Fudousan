/**
 * email modal 
 */

$(function(){
	$.ajax({
		url:"/fudousan/helpCallPage",
		type : "POST",
		data : { "memberId": $('#memberId').val()},
		
		//서버로 부터 받아오는 타입
		dataType : "json",
		success : function(data){
			console.dir(data);
			var count=1;
			var tag = "table table-striped";
			var str="";
			
			var str = '<table class="table">'+
			'    <thead class="'+tag+'">'+
			'        <tr>'+
			'            <th>#</th>'+
			'            <th>Email</th>'+
			'            <th>Text</th>'+
			'            <th>Phone</th>'+
			'            <th>Send</th>'+
			'        </tr>';
			
			
			$(data).each(
				function(index, member){
					str +='    </thead>'+
					'    <tbody>'+
					'        <tr>'+
					'            <th scope="row">'+count+'</th>'+
					'            <td>'+member.email+'</td>'+
					'            <td>'+member.text+'</td>'+
					'            <td>'+member.phone+'</td>'+
					'			 <td> <a href="helpCall?tomail='+member.email+'" class="btn btn-warning" OnClick="alert(\'Send to Interior\')">Send</a></td>'+	
					'        </tr>';
					count++;

			}); //each end
				str+='    </tbody>'+
					 '</table>';
				
			$('.emailModal').append(str);
			
			
		},
		error : function(e){//에러 정보를 갖고 있는 
			alert(JSON.stringify(e));
			result = true;
		} 
		
	});
	
	
	
	
});