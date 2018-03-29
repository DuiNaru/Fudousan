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
	
	
	 <!-- font awesome -->
    
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    
    <!-- Custom style -->
    <link rel="stylesheet" href="../resources/css/style.css" media="screen" title="no title" charset="utf-8">
	
	
	
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
		        <li><a href="#">Login</a></li>
		    
		         <li class="dropdown">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Join <span class="caret"></span></a>
			          <ul class="dropdown-menu" role="menu">
			            <li><a href="#">Customer Join</a></li>
			            <li class="divider"></li>
			            <li><a href="#">Agency Join</a></li>
			           
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
          <form role="form">
            <div class="form-group">
              <label for="InputName">name</label>
              <input type="text" class="form-control" id="InputName" placeholder="이름">
            </div>
            <div class="form-group">
              <label for="InputPassword1">password1</label>
              <input type="password" class="form-control" id="InputPassword1" placeholder="비밀번호">
            </div>
            <div class="form-group">
              <label for="InputPassword2">password2</label>
              <input type="password" class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
              <p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
            </div>
            <div class="form-group">
              <label for="InputEmail">email</label>
              <input type="email" class="form-control" id="InputEmail" placeholder="이메일 주소">
            </div>
            <div class="form-group">
              <label for="InputText">phone</label>
              <input type="text" class="form-control" id="userphone" placeholder="전화번호를 입력해 주세요">
            </div>
            
			
			<div class="input-group">
			     <label for="InputText">Text</label>
			    <textarea class="form-control" rows="3" cols="100" style="resize:none" placeholder="자기소개를 입력해 주세요"></textarea>     
			  
			</div>
		
			<div class="form-group">
			    <label for="InputPhoto">photo</label>
				<div class="input-group input-file" name="Fichier1">
					<span class="input-group-btn">
		        		<button class="btn btn-default btn-choose" type="button">선택</button>
		    		</span>
		    		<input type="text" class="form-control" placeholder='파일을 업로드해주세요' />
		    		<span class="input-group-btn">
		       			 <button class="btn btn-warning btn-reset" type="button">Reset</button>
		    		</span>
				</div>
			</div>
			
            <div class="form-group">
               <label for="InputDesigner">디자이너 이십니까?</label>
               <div class="btn-group" data-toggle="buttons">
				  <label class="btn btn-secondary active">
				    <input type="radio" name="options" id="option1" autocomplete="off" checked> Yes
				  </label>
				  <label class="btn btn-secondary">
				    <input type="radio" name="options" id="option2" autocomplete="off"> No
				  </label>
				</div>
            </div>
         
         
         
         
         
         
         
         
         
         
         
         
         
         
            
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






    
    
  </body>
</html>