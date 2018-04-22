<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
				
				<a class="navbar-brand" href="/fudousan" style="margin-bottom: 10px;">
					<img alt="Fudousan" src="/fudousan/resources/image/logo2.png">
				</a>
				
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right" style="margin-top: 8px;">
				<c:if test="${sessionScope.loginEmail == null}">
					<li id="loginNameTag"></li>
					<li id="loginAtag"><a data-toggle="modal" href="#loginModal" data-lang="0"></a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span data-lang="5"></span><span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/fudousan/join/join" data-lang="6"></a></li>
							<li class="divider"></li>
							<li><a href="/fudousan/join/agencyjoin" data-lang="7"></a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 1}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>

					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>

					<li><a href="/fudousan/logout" data-lang="1"></a></li>

					<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a></li>
					
					<li><a href="/fudousan/mypageNormalUser">Member Page</a></li>
					
										
				</c:if>
				<c:if test="${sessionScope.permissionId == 2}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>

					
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>

					<li><a href="/fudousan/logout" data-lang="1"></a></li>

					<li><a href="/fudousan/memberupdate/memberupdate">Update Member</a>
					
					<li><a href="/fudousan/interior/">Interior Page</a></li>
					
				</c:if>
				 
				<c:if test="${sessionScope.permissionId == 3}">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>

					<li><a href="bm"> 매물 확인 </a></li>
					<li><a href="/fudousan/logout"><span data-lang="logout"></span></a></li>

					<li><a href="/fudousan/logout" data-lang="1"></a></li>

					<li><a href="/fudousan/memberupdate/agencyupdate">Update Member</a></li>
					
					<li><a href="/fudousan/bm">Agency Page</a></li>
				</c:if>
				<c:if test="${sessionScope.permissionId == 99 }">
					<li><a>${sessionScope.loginMemberName}, Welcome!</a></li>
					<li><a href="/fudousan/logout" data-lang="1"></a></li>
					<li><a href="/fudousan/admin">Admin page</a></li>
				</c:if>
				
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