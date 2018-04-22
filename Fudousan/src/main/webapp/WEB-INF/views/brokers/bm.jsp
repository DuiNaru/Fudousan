<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>





  <head>
 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" cestateIdsontent="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>공인중개사 매니저</title>
	


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
      
      
      /* -- */
      
      
      
   
	</style>
<body>
<!-- -- -->
<!-- Header -->
 <!-- 로그인 모달 시작 -->
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
		      <a class="navbar-brand" href="../fudousan" style="margin-bottom: 10px;">
		      	<img alt="Fudousan" src="resources/image/logo2.png">
		      </a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		     
		    
		      <ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
		       <c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal">Login</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Join <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="join/join">Customer Join</a></li>
							<li class="divider"></li>
							<li><a href="join/agencyjoin">Agency Join</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${sessionScope.loginEmail != null}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/bw">Logout</a></li>
				</c:if>
		    
		        
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		 </nav> 
   



 <!-- 헤더 영역 -->
 

<div style="width: 80%; margin-left: 15%">
<h3> 매물 관리</h3>
 <div style="margin-top: 20px"> 
<input  type="button" value="매물 작성" class="btn btn-info" onclick="location.href='/fudousan/bw'"/>
 </div>

<!-- 테스쳐 업로드 페이지로 이동 -->
<input type="button" value="텍스쳐 업로드" class="btn btn-info" onclick="location.href='/fudousan/textureuproadpage'" > 



	<table border="1">
		<tr>
			<th>매물 번호</th>
			<th>매물 이름</th>
			<th>매물 관리</th>
			
		</tr>
		
		<c:forEach var="estate" items="${select}">
		<tr>
			<td>${estate.estateId}</td>
			<td>${estate.estateName} </td>
			
			<td>
			<input type="button" value="삭제"  class="btn btn-info" 
			onclick="location.href='deleteEntry?agencyId=${agencyId}&estateId=${estate.estateId}'">
			
			
			<input type="button" value="수정" class="btn btn-info" onclick="location.href='/fudousan/bc?estateId=${estate.estateId}'">
			<!-- 매물 작성으로 이동 -->
		</tr>
		
		</c:forEach>
	</table>




<!-- <div class="btn-group" data-toggle="buttons">
<label class="btn btn-secondary active">
<input type="radio" name="publicprivate" id="option1" autocomplete="off" value="1" checked>공개
</label>

<label class="btn btn-secondary">
<input type="radio" name="publicprivate" id="option2" autocomplete="off" value="0">비공개
</label>
</div>
 -->



</div>
<br>
<div >
<h3> 매물 3D 모델링 관리</h3>
<!-- 모델링 스냅 샷 자리  -->
<input type="radio" name="cr_page2">공개 
<input type="radio" name="cr_page2">비공개
<input type="button" class="btn btn-info" value="매물 작성">
<input type="button" value="삭제" class="btn btn-info" onclick="snapshot_delete">
 <input type="button" class="btn btn-info" value="수정">
</div>

<!-- footer 영역 -->


</html>

