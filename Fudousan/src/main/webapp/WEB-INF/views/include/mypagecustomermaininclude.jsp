<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<div class="container-fluid text-center">    
  <div class="row content">
  	<!-- 3D 작성 매물 확인 Start -->
    <div class="col-sm-5 text-center">
      <h1>3D 작성 매물 확인</h1>
		
		<!-- search button -->
		<div id="custom-search-input">
            <div class="input-group col-md-12">
                <input type="text" class="  search-query form-control" placeholder="Search" id ="roomSearch" name="roomSearch" />
                <span class="input-group-btn">
                    <button class="btn btn-danger" type="button" onclick="roomSearch()" >
                        <span class=" glyphicon glyphicon-search"></span>
                        <input type="hidden" id="memberId" name="memberId" value=1>
                    </button>
                </span>
            </div>
        </div>

		<hr>
		
		<!-- result -->      
		<h3>Test</h3>
		<c:forEach var="room" items="${rlist}">
			<div class="col-sm-12 form-group">
				<p><a href="/">${room.estate.estateName}</a><c:out value="${room.map} "/></p>
		 		<a class="btn btn-default" href="../../newRoom?estateId=${room.estate.estateId}&roomPublic=0">새로 꾸미기</a>
			</div>
		</c:forEach>
    </div> 
    <!-- 3D 작성 매물 확인 End -->
    <!-- 찜한 매물 보기 Start -->
    <div class="col-sm-5 text-center"> 
		<h1>찜한 매물 보기</h1>
		<!-- search button -->
		<div id="custom-search-input">
            <div class="input-group col-md-12">
                <input type="text" class="  search-query form-control" placeholder="Search"  name="favoSearch" id="favoSearch" />
                <span class="input-group-btn">
                    <button class="btn btn-danger" type="button" onclick="favoriteSearch()" >
                        <span class=" glyphicon glyphicon-search"></span>
                        <input type="hidden" id="memberId" name="memberId" value=1>
                    </button>
                </span>
            </div>
        </div>
		
		<hr>
		
		<!-- result -->
		<h3>Test</h3>
		<c:forEach var="favorite" items="${flist}">
			<div class="col-sm-12 form-group">
				<p><a href="/">${favorite.estate.estateName}</a><c:out value="${favorite.memberId}${favorite.creDate}}"/></p>
				<input type="button" value="팝업정보" onclick="popupInfoMaemul(${favorite.estate})">
			</div>
		</c:forEach>
    </div>
    
    <!-- side nav button Start -->
    <div class="col-sm-2 sidenav">
		
		<div class="well">
			<h6>인테리어 업자에게 도움 요청</h6>
			<c:forEach var="helper" items="${alist}">
				<p><c:out value="${helper.requestedMemberId}님에게 도움을 요청하셨습니다."/></p>
			</c:forEach>
			<!-- Clear -->
		<div style="clear: both;"></div>
		</div>
		
		<div class="well">
			<h6 >인테리어 업자 승인 여부</h6>
			<c:forEach var="helpRes" items="${rclist}">
			 		<div class="col-sm-12 form-group">
			 			<p><c:out value="${helpRes.requestedMemberId}님이 ${helpRes.requestMemberId }님의 요청을 승락하셨습니다. "/></p>
						<input type="button" value="거절" id="cancel" name="cancel" onclick="sayonara()">
						<input type="hidden" value="${helpRes.requestMemberId }" id="client" name="client">
						<input type="hidden" value="${helpRes.requestedMemberId }" id="accepter" name="accepter">
			 		</div>
			</c:forEach>
		<!-- Clear -->
		<div style="clear: both;"></div>
		</div>
		
    </div>
  </div>
</div>

