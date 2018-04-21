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
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
	
	<!-- font awesome -->
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" media="screen" title="no title">
    <!-- Custom style -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" media="screen" title="no title">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    
    <![endif]-->
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	
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
					<span data-lang="email"></span> <input type="text" id="memberEmail" name="memberID">
					<span data-lang="password"></span> <input type="password" id="password" name="password">
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
			<h1><span data-lang="7"></span>&nbsp;<small>Agency basic form</small></h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" action="insertAgency" method="post" enctype="multipart/form-data">
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
						<input type="text" class="form-control" name="picture" data-lang="17"/>
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
         
				<!-- agency join menu  -->
				<div class="form-group">
					<label for="InputText" data-lang="23"></label>
					<input type="text" class="form-control" id="agencyname" name="name" data-lang="24">
				</div>
            
				<div class="form-group">
					<label for="InputText" data-lang="25"></label>
					<input type="text" class="form-control" id="agencybiznum" name="biznum" data-lang="26">
				</div>
            
				<div class="form-group">
					<label for="InputText" data-lang="27"></label>
					<select class="selectpicker" data-live-search="true" name="main">
						<option value='0' selected="selected" data-lang="28"></option>
						<!-- 홋카이도 -->
						<option value='北海道' data-lang="29">北海道</option>
						<!-- 아오모리현 -->
						<option value='青森県' data-lang="30">青森県</option>
						<!-- 이와테현 -->
						<option value='岩手県' data-lang="31">岩手県</option>
						<!-- 미야기현 -->
						<option value='宮城県' data-lang="32">宮城県</option>
						<!-- 아키타현 -->
						<option value='秋田県' data-lang="33">秋田県</option>
						<!-- 야마가타현 -->
						<option value='山形県' data-lang="34">山形県</option>
						<!-- 후쿠시마현-->
						<option value='福島県' data-lang="35">福島県</option>
						<!-- 이바라키현 -->
						<option value='茨城県' data-lang="36">茨城県</option>
						<!-- 토치기현 -->
						<option value='栃木県' data-lang="37">栃木県</option>
						<!-- 군마현 -->
						<option value='群馬県' data-lang="38">群馬県</option>
						<!-- 사이타마현 -->
						<option value='埼玉県' data-lang="39">埼玉県</option>
						<!-- 치바현 -->
						<option value='千葉県' data-lang="40">千葉県</option>
						<!--  도쿄도 -->
						<option value='東京都' data-lang="41">東京都</option>
						<!-- 가나가와현 -->
						<option value='神奈川県' data-lang="42">神奈川県</option>
						<!-- 니가타현 -->
						<option value='新潟県' data-lang="43">新潟県</option>
						<!-- 도야마현 -->
						<option value='富山県' data-lang="44">富山県</option>
						<!-- 이시카와현 -->
						<option value='石川県' data-lang="45">石川県</option>
						<!-- 후쿠이현 -->
						<option value='福井県' data-lang="46">福井県</option>
						<!-- 야마나시현 -->
						<option value='山梨県' data-lang="47">山梨県</option>
						<!-- 나가노현 -->
						<option value='長野県' data-lang="48">長野県</option>
						<!-- 기후현 -->
						<option value='岐阜県' data-lang="49">岐阜県</option>
						<!-- 스지오카현 -->
						<option value='静岡県' data-lang="50">静岡県</option>
						<!-- 아이치현 -->
						<option value='愛知県' data-lang="51">愛知県</option>
						<!-- 미에현 -->
						<option value='三重県' data-lang="52">三重県</option>
						<!-- 시가현 -->
						<option value='滋賀県' data-lang="53">滋賀県</option>
						<!-- 교토부 -->
						<option value='京都府' data-lang="54">京都府</option>
						<!-- 오사카부 -->
						<option value='大阪府' data-lang="55">大阪府</option>
						<!-- 효고현 -->
						<option value='兵庫県' data-lang="56">兵庫県</option>
						<!-- 나라현 -->
						<option value='奈良県' data-lang="57">奈良県</option>
						<!-- 와카야마현 -->
						<option value='和歌山県' data-lang="58">和歌山県</option>
						<!-- 돗토리현 -->
						<option value='鳥取県' data-lang="59">鳥取県</option>
						<!-- 시마네현 -->
						<option value='島根県' data-lang="60">島根県</option>
						<!-- 오카야마현 -->
						<option value='岡山県' data-lang="61">岡山県</option>
						<!-- 히로시마현 -->
						<option value='広島県' data-lang="62">広島県</option>
						<!-- 야마구치현 -->
						<option value='山口県' data-lang="63">山口県</option>
						<!-- 도쿠시마현 -->
						<option value='徳島県' data-lang="64">徳島県</option>
						<!-- 가가와현 -->
						<option value='香川県' data-lang="65">香川県</option>
						<!-- 에히메현 -->
						<option value='愛媛県' data-lang="66">愛媛県</option>
						<!-- 고치현 -->
						<option value='高知県' data-lang="67">高知県</option>
						<!-- 후쿠오카현 -->
						<option value='福岡県' data-lang="68">福岡県</option>
						<!-- 사가현 -->
						<option value='佐賀県' data-lang="69">佐賀県</option>
						<!-- 나가사키현 -->
						<option value='長崎県' data-lang="70">長崎県</option>
						<!-- 구마모토현 -->
						<option value='熊本県' data-lang="71">熊本県</option>
						<!-- 오이타현 -->
						<option value='大分県' data-lang="72">大分県</option>
						<!-- 미야자키현 -->
						<option value='宮崎県' data-lang="73">宮崎県</option>
						<!-- 가고시마현 -->
						<option value='鹿児島県' data-lang="74">鹿児島県</option>
						<!-- 오키나와현 -->
						<option value='沖縄県' data-lang="75">沖縄県</option>
					</select>
				</div>
            
				<div class="form-group">
					<label for="InputText" data-lang="76"></label>
					<input type="text" class="form-control" id="agencyaddressmiddle" name="addressMiddle" data-lang="77">
				</div>
            
				<div class="form-group">
					<label for="InputText" data-lang="78"></label>
					<input type="text" class="form-control" id="agencyaddresssmail" name="addressSmall" data-lang="79">
				</div>
            
				<div class="form-group">
					<label for="InputText" data-lang="80"></label>
					<input type="text" class="form-control" id="agencyaddresssub" name="addressSub" data-lang="81">
				</div>
				 
				<div class="input-group">
					<label for="InputText" data-lang="82"><span data-lang="agency-introduction"></span></label>
					<textarea class="form-control" rows="3" cols="100" style="resize:none" name="text" data-lang="83"></textarea>       
				</div>
				
				<br>
				
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
				
				<br>
	         
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info"><span data-lang="5"></span><i class="fa fa-check spaceLeft"></i></button>
					<button type="submit" class="btn btn-warning"><span data-lang="4"></span><i class="fa fa-times spaceLeft"></i></button>
				</div>
			</form>
		</div>
	</article>
	
	<!-- script -->
	<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlZMVBrvQGWP2QTDvf5ur7HrtEC3xlOf0 &callback=initMap" async defer></script>
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
	
	<!-- join.js -->
	<script src="<c:url value="/resources/js/join.js"></c:url>"></script>
	
	<!-- login.js -->
	<script src="<c:url value="/resources/js/login.js"></c:url>"></script>
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
	
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
	
	<!-- 다국어 처리 -->
	<script src="../resources/js/cookie.js"></script>
	<script src="../resources/js/translation.js"></script>
</body>
</html>