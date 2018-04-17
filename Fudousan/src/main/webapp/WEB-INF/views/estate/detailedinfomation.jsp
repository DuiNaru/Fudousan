<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>boot</title>

    <!-- 부트스트랩 -->
    <link href="<c:url value="../resources/css/bootstrap.min.css"/>" rel="stylesheet">
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
      
    }
    /* map */
    #map {
        height: 500px;
        width: 80%;
        margin-top: 50px; 
        margin-left: 10%;
       }
       
    /* PRICE TABLE */
.row-flex {
    display: flex;
    flex-wrap: wrap;
    -webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
    -moz-flex-wrap: wrap;
}

.price-table {
    max-width: 400px;
    min-height: 320px;
    background-color: #fff;
    border-radius: 0 0 0 25px;
    border: 1px solid #ccc;
    box-shadow: 5px 5px 8px #ccc;
    display: block;
    margin: 10px auto;
    padding: 0 0 8px 0;
    text-align: center;
}

.price-table span {
    display: block;
}

.price-table span:first-child {
    padding: 16px 0 0 0;
    font-size: 2em;
    text-transform: uppercase;
    font-weight: bold;
}

.price-table span:nth-child(2) {
    padding: 0 0 16px 0;
}

.price-table span:nth-child(3) {
    padding: 8px 0;
    font-weight: bold;
    font-size: 1.2em;
}

.price-table > ul {
    list-style: none;
    display: block;
    padding: 0;
    margin: 0;
}

.price-table > ul > li {
    display: block;
    padding: 8px 0;
}

.price-table > ul > li:first-child {
    border-top: 1px solid #ccc;
}

.price-table > ul > li {
    border-bottom: 1px solid #ccc;
}

.price-table a,
.price-table a:active,
.price-table a:focus,
.price-table a:hover,
.price-table a:visited {
    text-transform: uppercase;
    display: inline-block;
    padding: 8px 16px;
    text-decoration: none;
    font-weight: bold;
    transition-duration: .2s;
}

/* Colors */
.pt-bg-black span:first-child {
    background-color: #212121;
    color: #fcfcfc;
}

.pt-bg-black span:nth-child(2) {
    background-color: #212121;
    color: #D5D8DC;
}

.pt-bg-black a {
    border: 3px solid #212121;
    color: #212121;
    margin-top: 8px;
}

.pt-bg-black a:hover {
    background-color: #212121;
    color: #fff;
} /* End Color Black */

.pt-bg-green span:first-child {
    background-color: #27AE60;
    color: #fcfcfc;
}

.pt-bg-green span:nth-child(2) {
    background-color: #27AE60;
    color: #D5D8DC;
}

.pt-bg-green a {
    border: 3px solid #27AE60;
    color: #27AE60;
    margin-top: 8px;
}

.pt-bg-green a:hover {
    background-color: #27AE60;
    color: #fff;
} /* End Color Green */

.pt-bg-red span:first-child {
    background-color: #C0392B;
    color: #fcfcfc;
}

.pt-bg-red span:nth-child(2) {
    background-color: #C0392B;
    color: #D5D8DC;
}

.pt-bg-red a {
    border: 3px solid #C0392B;
    color: #C0392B;
    margin-top: 8px;
}

.pt-bg-red a:hover {
    background-color: #C0392B;
    color: #fff;
} /* End Color Red */

.pt-bg-blue span:first-child {
    background-color: #2980B9;
    color: #fcfcfc;
}

.pt-bg-blue span:nth-child(2) {
    background-color: #2980B9;
    color: #D5D8DC;
}

.pt-bg-blue a {
    border: 3px solid #2980B9;
    color: #2980B9;
    margin-top: 8px;
}

.pt-bg-blue a:hover {
    background-color: #2980B9;
    color: #fff;
} /* End Color Blue */
/* END PRICE TABLE */   
       
       
       
  </style>	

</head>
<body>


	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Login</h4>
				</div>
				
				<div class="modal-body">
					Email <input type="text" id="memberEmail" name="memberID">
					Password <input type="password" id="password" name="password">
					<button type="button" id="loginBtn">Login</button>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->
	
	<!-- Header -->
	<nav class="navbar navbar-default" style="margin: auto 0"> 
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
				<a class="navbar-brand" href="#" style="margin-bottom: 10px;">
					<img alt="Fudousan" src="../resources/image/logo2.png">
				</a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
				<c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal">Login</a></li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 1 || sessionScope.permissionId == 2 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout">Logout</a></li>
					<li><a href="memberupdate/memberupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 3 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout">Logout</a></li>
					<li><a href="memberupdate/agencyupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 99 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout">Logout</a></li>
				</c:if>
				
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Join <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/fudousan/join/join">Customer Join</a></li>
							<li class="divider"></li>
							
							<li><a href="../join/agencyjoin">Agency Join</a></li>
						</ul>
					</li>
					
					
					<c:if test="${sessionScope.loginId != null && sessionScope.isNormal == normal}">
						<li><a href="mypageNormalUser" style="color: blue;">ahm test</a></li>
					</c:if>
					
					
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
   
 
<!-- agency Location List -->
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
    
      <h1>Details</h1>
      	<p>${resultEstate.address},  ${resultEstate.region }</p>
      <hr>
      
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
      <div class="well">
        <p>매물 찜하기</p>
      </div>
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

<script src="../resources/js/jquery-3.3.1.js"></script>
<script src="../resources/js/login.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>

    <script>
      function initMap() {
    	var lat = document.getElementById('lat').value;
    	var lng = document.getElementById('lng').value;
    	
        var myOptions = {
                center: new google.maps.LatLng(lat, lng),
                zoom: 13,
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

</body>
</html>