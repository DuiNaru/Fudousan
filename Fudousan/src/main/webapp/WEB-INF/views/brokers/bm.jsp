<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리 페이지</title>
<script>
function estateId_delete(){
	if(confirm("정말로 삭제할 건가요?") == true){
		document.form.submit();
	}else{
		return ;
	}
}

function snapshot_delete(){
	if(confirm("정말로 삭제할 건가요 ?") ==true){
		document.form.submit();
	}else{
		return;
	}
}


</script>


</head>
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

<hr>
<h3> 매물 관리 </h3>


<img alt="" src="">
<input type="radio" name="cr_page">공개 
<input type="radio" name="cr_page">비공개
<input type="button" value="삭제" onclick="estateId_delete"> 
<!-- 매물 수정으로 이동 -->
<input type="button" value="수정" onclick="location.href='/brokers/bc.jsp'">
<!-- 매물 작성으로 이동 -->

<input type="button" value="매물 작성" onclick="location.href='/brokers/br.jsp'"/>
<hr>

<h3> 매물 3D 모델링 관리</h3>
<!-- 모델링 스냅 샷 자리  -->
<input type="button" value="작성">
<input type="button" value="삭제" onclick="snapshot_delete"> <input type="button" value="수정">


<!-- footer 영역 -->



</html>

