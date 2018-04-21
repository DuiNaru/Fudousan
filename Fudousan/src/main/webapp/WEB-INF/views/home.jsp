<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
    <title>boot</title>

    <!-- css -->
    <link href="<c:url value="resources/css/bootstrap.min.css"/>" rel="stylesheet">
	<link href="<c:url value="resources/css/home.css"/>" rel="stylesheet">
</head>

<body onload="initialize()">
 	<!-- login modal  -->
 	<%@include file="/WEB-INF/views/include/loginmodal.jsp" %> 
	

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
					<img alt="Fudousan" src="./resources/image/logo2.png">
				</a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
				<c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal" data-lang="0"></a></li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 1 || sessionScope.permissionId == 2 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>

					
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>

					<li><a href="/fudousan/logout" data-lang="1"></a></li>

					<li><a href="memberupdate/memberupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 3 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>

					<li><a href="bm"> 매물 확인 </a></li>
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>

					<li><a href="/fudousan/logout" data-lang="1"></a></li>

					<li><a href="memberupdate/agencyupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 99 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout" data-lang="1"></a></li>
				</c:if>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span data-lang="5"></span><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/fudousan/join/join" data-lang="6"></a></li>
							<li class="divider"></li>
							
							<li><a href="/fudousan/join/agencyjoin" data-lang="7"></a></li>
						</ul>
					</li>
					
					
					
					
					
					<li><a href="helpCallPage">메일 보내기</a></li>
					
					<li><a href="javascript:selectLanguage('ko')">한국어</a></li>
					<li><a href="javascript:selectLanguage('jp')">日本語</a></li>
					<li><a href="javascript:selectLanguage('en')">English</a></li>
					
					<c:if test="${sessionScope.loginId != null && sessionScope.isNormal == normal}">
						<li><a href="mypageNormalUser" style="color: blue;">ahm test</a></li>
					</c:if>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>

	<!-- header -->
	<%@include file="/WEB-INF/views/include/header.jsp" %>

	



	<!-- Map -->
	<div class="form-group">
		<input id="pac-input" class="controls form-control" type="text" placeholder="Search Box" style="z-index: 1; margin: 100px 0 0 0">
	</div>
	<div id="map" style="width:100%; height:100%"></div>
	
	<!-- include js List -->
	<script src="resources/js/jquery-3.3.1.js"></script>
	<script src="resources/js/login.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
	<!-- map js -->
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script type="text/javascript">
		var locations = [
		/* 중개소 위치  */
		<c:forEach items="${locationList}" var="location" varStatus="status">
			${location},
		</c:forEach>
		/* 매물 위치  */
		<c:forEach items="${elocationList}" var="elocation" varStatus="status">
			${elocation}<c:if test="${status.last eq false}">,</c:if>
		</c:forEach>
	];
	</script>
	<script src="resources/js/googlemaps-settings.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1tbIAqN0XqcgTR1-FxYoVTVq6Is6lD98&libraries=places&callback=initialize" async defer></script>
	
	<!-- 다국어 처리 -->
	<script src="resources/js/cookie.js"></script>
	<script src="resources/js/translation.js"></script>
</body>
</html>
