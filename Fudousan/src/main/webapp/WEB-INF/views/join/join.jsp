<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
	
	<title>boot</title>
	
	<!-- 부트스트랩 -->
	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	
	<!-- font awesome -->
	<link rel="stylesheet" href="../resources/css/font-awesome.min.css" media="screen" title="no title">
	
	<!-- Custom style -->
	<link rel="stylesheet" href="../resources/css/style.css" media="screen" title="no title">
    
	<!-- style -->
	<style type="text/css">
		/* Always set the map height explicitly to define the size of the div
		* element that contains the map. */
		#map {
			height: 91%;
		}
		/* Optional: Makes the sample page fill the window. */
		html, body {
			height: 100%;
			margin: 0;
			padding: 0;
		}
	</style>
</head>
<body>
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" data-lang="0"></h4>
				</div>
				
				<div class="modal-body">
					<span data-lang="2"></span> <input type="text" id="memberEmail" name="memberID">
					<span data-lang="3"></span> <input type="password" id="password" name="password">
					<button type="button" id="loginBtn" data-lang="0"></button>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal" data-lang="4"></button>
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
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal" data-lang="0"></a></li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 1 || sessionScope.permissionId == 2 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout" data-lang="1"></a></li>
					<li><a href="memberupdate/memberupdate">update member</a>
				</c:if>
				<c:if test="${sessionScope.permissionId == 3 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
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
					
					<li><a href="bm">[okh test]</a></li>
					
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
	
	<!--  join form  -->
	<article class="container">
        <div class="page-header">
			<h1><span data-lang="6"></span>&nbsp;<small>basic form</small></h1>
		</div>
		
		<div class="col-md-6 col-md-offset-3">
			<form role="form" action="insertMember" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="InputName" data-lang="8"></label>
					<input type="text" class="form-control" id="InputName" name="memberName" data-lang="8">
				</div>
				
				<div class="form-group">
					<label for="InputPassword1" data-lang="3"></label>
					<input type="password" class="form-control" id="InputPassword1" name="password" data-lang="3">
				</div>
				
				<div class="form-group">
					<label for="InputPassword2" data-lang="9"></label>
					<input type="password" class="form-control" id="InputPassword2" data-lang="9">
					<p class="help-block" data-lang="10"></p>
				</div>
				
				<div class="form-group">
					<label for="InputEmail" data-lang="2"></label>
					<input type="email" class="form-control" id="InputEmail" name="email" data-lang="2">
				</div>
				
				<div class="form-group">
					<label for="InputText" data-lang="11"></label>
					<input type="text" class="form-control" id="userphone" name="phone" data-lang="12">
				</div>
	            
				<div class="input-group">
					<label for="InputText" data-lang="13"></label>
					<textarea class="form-control" rows="3" cols="100" style="resize:none" name="text" data-lang="14"></textarea>
				</div>
			
				<div class="form-group">
					<label for="InputPhoto" data-lang="15"></label>
					<div class="input-group input-file" name="Fichier1">
						<span class="input-group-btn">
							<button class="btn btn-default btn-choose" type="button" data-lang="16"></button>
						</span>
						<input type="text" class="form-control" data-lang="17" name="picture"/>
						<span class="input-group-btn">
							<button class="btn btn-warning btn-reset" type="button" data-lang="18"></button>
						</span>
					</div>
				</div>
	
				<div class="form-group">
					<label for="InputDesigner" data-lang="19"></label>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary active">
							<input type="radio" name="designer" id="option1" autocomplete="off" value="1" checked> Yes
						</label>
						<label class="btn btn-secondary">
							<input type="radio" name="designer" id="option2" autocomplete="off" value="0"> No
						</label>
					</div>
				</div>
	         
				<div class="form-group">
					<label data-lang="20"></label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active">
							<span class="fa fa-check"></span>
							<input id="agree" type="checkbox" autocomplete="off" name="checkbox" value="checked">
						</label>
						<span data-lang="21"></span>&nbsp;<a href="#" data-lang="22"></a>
					</div>
				</div>
	         
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info"><span data-lang="5"></span><i class="fa fa-check spaceLeft"></i></button>
					<button type="submit" class="btn btn-warning"><span data-lang="4"></span><i class="fa fa-times spaceLeft"></i></button>
				</div>
			</form>
		</div>
	</article>
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
	<!-- join.js -->
	<script src="<c:url value="/resources/js/join.js"></c:url>"></script>
	<!-- 다국어 처리 -->
	<script src="../resources/js/cookie.js"></script>
	<script src="../resources/js/translation.js"></script>
</body>
</html>