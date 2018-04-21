<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>boot</title>

    <!-- css -->
   
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/3dmodel.css" rel="stylesheet">
    <link href="../resources/css/detailedinfomationpage.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">


</head>
<body>
	<!-- 3d design modal  -->
 	<%@include file="/WEB-INF/views/include/3ddesignmodal.jsp" %>
 	
 	<!-- login modal  -->
 	<%@include file="/WEB-INF/views/include/loginmodal.jsp" %> 
	
	<!-- header -->
	<%@include file="/WEB-INF/views/include/header.jsp" %>


<!-- main layout -->
<div class="container-fluid text-center">    
  <div class="row content">
    
    <!-- side nav(left) -->
    <div class="col-sm-2 sidenav">
		<a data-toggle="modal" href="#3dDesignModal" class="btn btn-success btn-lg">
			<span class="glyphicon glyphicon-print"></span> 3D DESIGN
		</a>
    </div>
    
    <!-- text main -->
	<div class="col-sm-8 text-left"> 
		<h1>Details</h1>
		<p>${resultEstate.address},  ${resultEstate.region }</p>
    	
    	<hr>
		
		<!-- Favorite Button -->
		<label for="id-of-input" class="custom-checkbox">
  			<input type="checkbox" id="id-of-input"/>
  			<i class="glyphicon glyphicon-star-empty" id="empty"></i>
  			<i class="glyphicon glyphicon-star" id="full"></i>
		</label>
    
    	<!-- map  -->
    	<div id="map"></div>
    	
    	<hr>

    <div class="row row-flex" id="box">
      	<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          	<div class="price-table pt-bg-black">
	            <div>
					<span>PRICE</span>
	                <span>Price ${resultEstate.tradeprice}¥</span>
				</div>
				<ul>
    				<li>
				    	<h6>Trade Price</h6>
				    	${resultEstate.tradeprice}¥
					</li>
					<li>
						<h5>Unit Price</h5>
   						<c:choose>
							<c:when test="${resultEstate.priceperunit != null}">
								<h6>${resultEstate.unitprice}¥</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>
						</c:choose>
					</li>
					<li>
   						<h5>Price Per Unit</h5>
   						<c:choose>
							<c:when test="${resultEstate.priceperunit != null}">
								<h6>${resultEstate.priceperunit}¥</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>
             		</li>
          		</ul>
			</div>
		</div>
	<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
		<div class="price-table pt-bg-green">
			<div>
				<span>Over view</span>
				<span>About Estate</span>  
			</div>
            <ul>
            	<li>
					<h5>Area</h5>
                    <c:choose>
						<c:when test="${resultEstate.area != null}">
							<h6>${resultEstate.area}㎥</h6>
						</c:when>	
						<c:otherwise>
							<h6>Nothing</h6>
						</c:otherwise>                    	
					</c:choose>
            	</li>
            	<li>
					<h5>LandShape</h5>
           	   		<c:choose>
						<c:when test="${resultEstate.landshape != null}">
							<h6>${resultEstate.area}㎥</h6>
						</c:when>	
						<c:otherwise>
							<h6>Nothing</h6>
						</c:otherwise>                    	
					</c:choose>
				</li>
            	<li>
					<h5>Frontage</h5>
           	   		<c:choose>
						<c:when test="${resultEstate.frontage != null}">
							<h6>${resultEstate.frontage}</h6>
						</c:when>	
						<c:otherwise>
							<h6>Nothing</h6>
						</c:otherwise>                    	
					</c:choose>                    	
            	</li>
            	<li>
					<h5>Total Floor Area</h5>
           	   		<c:choose>
						<c:when test="${resultEstate.totalfloorarea != null}">
							<h6>${resultEstate.totalfloorarea}㎥</h6>
						</c:when>	
						<c:otherwise>
							<h6>Nothing</h6>
						</c:otherwise>                    	
					</c:choose>       
               </li>
				<li>
               		<h5>Breadth</h5>
              	   		<c:choose>
							<c:when test="${resultEstate.breadth != null}">
								<h6>${resultEstate.breadth}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
               </li>
<li>
               <h5>Coverage Ratio</h5>
              	   <c:choose>
<c:when test="${resultEstate.coverageratio != null}">
<h6>${resultEstate.coverageratio}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>    
</li>
<li>
<h5>Floor Area Ratio</h5>
   <c:choose>
<c:when test="${resultEstate.floorarearatio != null}">
<h6>${resultEstate.floorarearatio}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>    
            </li>
        </ul>
    </div>
</div>
      <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    <div class="price-table pt-bg-blue">
        <div>
            <span>OVER VIEW</span>
            <span>About Estate</span>        
        </div>
        <ul>
             <li>
            	<h5>BuildingYear</h5>
           	   <c:choose>
<c:when test="${resultEstate.buildingyear != null}">
<h6>${resultEstate.buildingyear}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>       
</li>
<li>
	<h5>Structure</h5>
   <c:choose>
<c:when test="${resultEstate.structure != null}">
<h6>${resultEstate.structure}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>    
</li>
<li>
<h5>Direction</h5>
   <c:choose>
<c:when test="${resultEstate.direction != null}">
<h6>${resultEstate.direction}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>    
            </li>
        </ul>
    </div>
</div>
<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    <div class="price-table pt-bg-red">
        <div>
            <span>ETC</span>
            <span>About estate</span>
        </div>
        <ul>
            <li>
            <h5>Use</h5>
           	   <c:choose>
<c:when test="${resultEstate.use != null}">
<h6>${resultEstate.use}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>                        
</li>
<li>
<h5>Renovation</h5>
   <c:choose>
<c:when test="${resultEstate.renovation != null}">
<h6>${resultEstate.renovation}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>                        
           </li>
           <li>
<h5>Classification</h5>
          	   <c:choose>
<c:when test="${resultEstate.classification != null}">
<h6>${resultEstate.classification}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>   
</li>
<li>
	<h5>City Planning</h5>
   <c:choose>
<c:when test="${resultEstate.cityplanning != null}">
<h6>${resultEstate.cityplanning}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>   
</li>
<li>
   <h5>Remarks</h5>
   <c:choose>
<c:when test="${resultEstate.remarks != null}">
<h6>${resultEstate.remarks}</h6>
</c:when>	
<c:otherwise>
<h6>Nothing</h6>
</c:otherwise>                    	
</c:choose>   
                    </li>
                </ul>
            </div>
        </div>
</div>
     

    </div>
    <div class="col-sm-2 sidenav">
    
      	 
		
      
      
   
    
      <br>	
    <div class="well">
        <p>인테리어 업자에게 연락하기</p>
      </div>
    </div>
  </div>
</div>


<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
<input type="hidden" value="${resultEstate.estateX}" id="lat">
<input type="hidden" value="${resultEstate.estateY}" id="lng">
<input type="hidden" value="${estateId}" id="estateId">
<input type="hidden" value="${sessionScope.memberId }" id="memberId">

<script src="../resources/js/jquery-3.3.1.js"></script>
<script src="../resources/js/login.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>

    <script>
      function initMap() {
    	var lat = document.getElementById('lat').value;
    	var lng = document.getElementById('lng').value;
    	
        var myOptions = {
                center: new google.maps.LatLng(lat, lng),
                zoom: 17,
                mapTypeId: google.maps.MapTypeId.ROADMAP

            };
        var map = new google.maps.Map(document.getElementById('map'),
                    myOptions);
            
        var marker = new google.maps.Marker({
          position:  new google.maps.LatLng(lat, lng),
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1tbIAqN0XqcgTR1-FxYoVTVq6Is6lD98&callback=initMap">
    </script>
    <script type="text/javascript">
    	// infinite scroll paging ajax
    	var page = 1; 
    	var result = true;	
    	var count = 1; // 페이지가 몇 번 째인가 알려주는 변수  
    	$(function(){
    		
    		getRoomSnapShot();
    		
    		// down scroll 
 			$('.modal-body').on("scroll", function(){
 				
 				var modalHeight = $('.modal-body').height();
 				var contentHeight = $('#aritcleView').height();
 				var scrollBottom = $('.modal-body').scrollTop()+$('.modal-body').height();
 				
 				console.log("modalHeight   " + modalHeight);
 				console.log("contentHeight " + contentHeight);
 				console.log("scrollBottom  " + scrollBottom);
 				
	 				if(scrollBottom>contentHeight-modalHeight){
	 						
 					if (result == true ) {
	 					
						getRoomSnapShot();
	 					
	 					result = false; 
 					};
				};
 			}); 
 			

 			
 
 		});
    
    function getRoomSnapShot() {
    	$.ajax({
			url : "../selectRoomEstate",
			type : "POST",
			data : { "estateId": $('#estateId').val(), "page": page},
			
			//서버로 부터 받아오는 타입
			dataType : "json",
			success : function(data){
					console.dir(data);
					// 마지막 페이지를 가져온다. 
					var endPage = data.totalPage;
					
					// 내용을 변경해줄 것을 가져온다. 
					var str = "";
					
					// 가져온 데이터가 마지막이면 마지막이라고 표시 해준다. 
				if (page < endPage ) {
					count++;
					page = count;
					console.log(count);
					$(data.list).each(
						function(index, room){
							str += "<div class="+ "'col-md-4 col-sm-6 co-xs-12 gal-item'" +">"
								+     "<div class="+"'box'"+">"
								+		"<a herg="+"'#'"+"data-toggle="+"'modal'"+">"
								+         "<img src="+"'"+room.snapshot+"'"+">"
								+	  	"</a>"
								+     "</div>"
								+	"</div>";
					result = true;
					}); //each end
					$(".gal-container").append(str);

				}else{
					console.log("page End");
				}
			},
			error : function(e){//에러 정보를 갖고 있는 
				alert(JSON.stringify(e));
				result = true;
			} 
		});
    }
    	
    </script>
    
    
    
    <script type="text/javascript">
	    $(function() {

	    	
	    	
	    	
	    	// select favorite
	    	setTimeout(function(){
			      	$.ajax({
						url : "../selectFavorite",
						type : "POST",
						data : { "estateId": $('#estateId').val(), "memberId": $('#memberId').val() },
						 //서버로 부터 받아오는 타입
						dataType : "json",
						success : function(obj){
							var oMemberId = obj.memberId
							var memberId = $('#memberId').val();
							var oEstateId = obj.estate.estateId
							var estateId = $('#estateId').val();
							console.log(oMemberId);
							console.log(memberId);
							console.log(oEstateId);
							console.log(estateId);
							if (oMemberId == memberId && oEstateId == estateId ) {
								$("#id-of-input").attr("checked", "checked");
							}else{
								$("input:checkbox[id='#id-of-input']").prop("checked", false);
								
							}
						},
						error : function(e){//에러 정보를 갖고 있는 
							alert(JSON.stringify(e));
						} 
						
		      	  });
	        }, 100);
	    });

		   $(function(){
		    $( '#id-of-input' ).on('click', function(){
 		    	var check =$('#id-of-input').is(":checked");
		    	
		    	if (check == true) {
					
		    		$.ajax({
						url : "../insertFavorite",
						type : "POST",
						data :   { "estateId": $('#estateId').val(), "memberId": $('#memberId').val() } ,
						 //서버로 부터 받아오는 타입
						dataType : "text",
						success : function(data){
								
						},
						error : function(e){//에러 정보를 갖고 있는 
							alert(JSON.stringify(e));
						} 
		    		});
		    		
				}else{
					
					$.ajax({
						url : "../deleteFavorite",
						type : "POST",
						data :   { "estateId": $('#estateId').val(), "memberId": $('#memberId').val() } ,
						 //서버로 부터 받아오는 타입
						dataType : "text",
						success : function(data){
								
						},
						error : function(e){//에러 정보를 갖고 있는 
							alert(JSON.stringify(e));
						} 
		    		});
				}
		    });
		   });

    </script>


</body>
</html>