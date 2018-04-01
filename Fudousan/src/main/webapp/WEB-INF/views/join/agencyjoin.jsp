<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" media="screen" title="no title" charset="utf-8">

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
					<img alt="Fudousan" src="<c:url value="/resources/image/logo2.png"></c:url>">
				</a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
				<c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal">Login</a></li>
				</c:if>
				<c:if test="${sessionScope.loginEmail != null}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout">Logout</a></li>
				</c:if>
				
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Join <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="join">Customer Join</a></li>
							<li class="divider"></li>
							<li><a href="agencyjoin">Agency Join</a></li>
						</ul>
					</li>
					
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
   
 
 <!--  join form  -->
 
 <article class="container">
        <div class="page-header">
          <h1>공인중개업자 회원가입 <small>Agency basic form</small></h1>
        </div>
        <div class="col-md-6 col-md-offset-3">
          <form role="form" action="insertAgency" method="post" enctype="multipart/form-data">

	            <div class="form-group">
	              <label for="InputName">name</label>
	              <input type="text" class="form-control" id="InputName" placeholder="이름" name="memberName">
	            </div>
	            <div class="form-group">
	              <label for="InputPassword1">password</label>
	              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호" name="password">
	            </div>
	            <div class="form-group">
	              <label for="InputPassword2">confirm password</label>
	              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
	              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
	            </div>
	            <div class="form-group">
	              <label for="InputEmail">email</label>
	              <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소" name="email">
	            </div>
	            <div class="form-group">
	              <label for="InputText">phone</label>
	              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요" name="phone">
	            </div>
	            
				<div class="input-group">
				     <label for="InputText">Member Introduce</label>
				    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요" name="text"></textarea>     
				</div>
			
				<div class="form-group">
				    <label for="InputPhoto">photo</label>
					<div class="input-group input-file" name="Fichier1">
						<span class="input-group-btn">
			        		<button class="btn btn-default btn-choose" type="button">선택</button>
			    		</span>
			    		<input type="text" class="form-control" placeholder='파일을 업로드해주세요'  name="picture"/>
			    		<span class="input-group-btn">
			       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
			    		</span>
					</div>
				</div>
	
	            <div class="form-group">
	               <label for="InputDesigner">디자이너 이십니까?</label>
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
              <label for="InputText">agency name</label>
              <input type="text" class="form-control" id="agencyname" placeholder="중개소 이름을 입력해 주세요">
            </div>
            
             <div class="form-group">
              <label for="InputText">biznum</label>
              <input type="text" class="form-control" id="agencybiznum" placeholder="사업 번호를 입력해 주세요">
            </div>
            
			<div class="form-group">
				<label for="InputText">Address Main</label>
	            <select class="selectpicker" data-live-search="true" name="">
				  <option value='' selected>-- 選択 --</option>
				  <!-- 홋카이도 -->
				  <option value='北海道'>北海道</option>
				  <!-- 아오모리현 -->
				  <option value='青森県'>青森県</option>
				  <!-- 이와테현 -->
				  <option value='岩手県'>岩手県</option>
				  <!-- 미야기현 -->
				  <option value='宮城県'>宮城県</option>
				  <!-- 아키타현 -->
				  <option value='秋田県'>秋田県</option>
				   <!-- 야가마타현 -->
				  <option value='山形県'>山形県</option>
				  <!-- 후쿠시마현-->
				  <option value='福島県'>福島県</option>
				  <!-- 이바라키현 -->
				  <option value='茨城県'>茨城県</option>
				  <!-- 토치 기현 -->
				  <option value='栃木県'>栃木県</option>
				  <!-- 군마현 -->
				  <option value='群馬県'>群馬県</option>
				  <!-- 사이타마 현 -->
				  <option value='埼玉県'>埼玉県</option>
				  <!-- 치바현 -->
				  <option value='千葉県'>千葉県</option>
				 <!--  도쿄도 -->
				  <option value='東京都'>東京都</option>
				  <!-- 가나가와 현 -->
				  <option value='神奈川県'>神奈川県</option>
				  <!-- 니가타 현 -->
				  <option value='新潟県'>新潟県</option>
				  <!-- 도야마 현 -->
				  <option value='富山県'>富山県</option>
				  <!-- 이시카와 현 -->
				  <option value='石川県'>石川県</option>
				  <!-- 후쿠이 현 -->
				  <option value='福井県'>福井県</option>
				  <!-- 야마나시 현 -->
				  <option value='山梨県'>山梨県</option>
				  <!-- 나가노 현 -->
				  <option value='長野県'>長野県</option>
				  <!-- 기후현 -->
				  <option value='岐阜県'>岐阜県</option>
				  <!-- 스지오카현 -->
				  <option value='静岡県'>静岡県</option>
				  <!-- 아이치현 -->
				  <option value='愛知県'>愛知県</option>
				  <!-- 미에현 -->
				  <option value='三重県'>三重県</option>
				  <!-- 시가현 -->
				  <option value='滋賀県'>滋賀県</option>
				  <!-- 교토부 -->
				  <option value='京都府'>京都府</option>
				  <!-- 오사카부 -->
				  <option value='大阪府'>大阪府</option>
				  <!-- 효고현 -->
				  <option value='兵庫県'>兵庫県</option>
				  <!-- 나라현 -->
				  <option value='奈良県'>奈良県</option>
				  <!-- 와카야마현 -->
				  <option value='和歌山県'>和歌山県</option>
				  <!-- 돗토리현 -->
				  <option value='鳥取県'>鳥取県</option>
				  <!-- 시마네현 -->
				  <option value='島根県'>島根県</option>
				  <!-- 오카야마현 -->
				  <option value='岡山県'>岡山県</option>
				  <!-- 히로시마현 -->
				  <option value='広島県'>広島県</option>
				  <!-- 야마구치현 -->
				  <option value='山口県'>山口県</option>
				  <!-- 도쿠시마현 -->
				  <option value='徳島県'>徳島県</option>
				  <!-- 가가와현 -->
				  <option value='香川県'>香川県</option>
				  <!-- 에히메현 -->
				  <option value='愛媛県'>愛媛県</option>
				  <!-- 고치현 -->
				  <option value='高知県'>高知県</option>
				  <!-- 후쿠오카현 -->
				  <option value='福岡県'>福岡県</option>
				  <!-- 사가현 -->
				  <option value='佐賀県'>佐賀県</option>
				  <!-- 나가사키현 -->
				  <option value='長崎県'>長崎県</option>
				  <!-- 구마모토현 -->
				  <option value='熊本県'>熊本県</option>
				  <!-- 오이타현 -->
				  <option value='大分県'>大分県</option>
				  <!-- 미야자키현 -->
				  <option value='宮崎県'>宮崎県</option>
				  <!-- 가고시마현 -->
				  <option value='鹿児島県'>鹿児島県</option>
				  <!-- 오키나와 -->
				  <option value='沖縄県'>沖縄県</option>
				</select>
            </div>
            
             <div class="form-group">
              <label for="InputText">Address middle</label>
              <input type="text" class="form-control" id="agencyaddressmiddle" placeholder="주소(市区町村名)를 입력해 주세요">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address small</label>
              <input type="text" class="form-control" id="agencyaddresssmail" placeholder="주소(地区名)를입력해 주세요">
            </div>
            
             <div class="form-group">
              <label for="InputText">Address sub</label>
              <input type="text" class="form-control" id="agencyaddresssub" placeholder="주소(詳細)를 입력해 주세요">
            </div>
            
			<div class="input-group">
			     <label for="InputText">Agency Introduce</label>
			    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="중개소 소개를 입력해 주세요"></textarea>       
			</div>
         	
         	<br>
            <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
            </div>
         
         
 			<br>
            <div class="form-group text-center">
              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="submit" class="btn btn-warning">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
            
          </form>
        </div>
</article>
 
 





 
 
 
 
 
 
 
 
 <!-- script -->

    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlZMVBrvQGWP2QTDvf5ur7HrtEC3xlOf0 &callback=initMap">
    </script>
   

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
	
	



    
    
  </body>
</html>