<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<div class="container-fluid text-center">    
  <div class="row content">
  	<div class="col-sm-3 sidenav"></div>
  
  	<div class="col-sm-6">
  		<br>
  		<div class="col-sm-12 text-left" >
  			<div role="tabpanel">

  			<!-- Nav tabs -->
  			<ul class="nav nav-tabs" role="tablist">
  				<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">3D</a></li>
    			<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Favorite</a></li>
  			</ul>
  
  			<!-- Tab panes -->
  			<div class="tab-content">
    			<div role="tabpanel" class="tab-pane active" id="home">
    				<h1>3D 작성 매물 확인</h1>
					<!-- search button -->
					<div id="custom-search-input">
            			<div class="input-group col-md-12">
                			<input type="text" class="  search-query form-control" placeholder="Search" id ="roomSearch" name="roomSearch" />
                			<span class="input-group-btn">
	                    		<button class="btn btn-danger" type="button" onclick="roomSearch()" >
	                        		<span class=" glyphicon glyphicon-search"></span>
	                        		<input type="hidden" id="memberId" name="memberId" value=${sessionScope.loginId }>
	                    		</button>
                			</span>
            			</div>
        			</div>
        			<br>
        			<!-- result -->      
        			<table class="table">
        				<tr>
        					<th>Name</th>
        					<th>Create</th>
        					<th>Delete</th>
        				</tr>
        				<tbody>
        					<c:forEach var="room" items="${rlist}">
	        					<tr>
	        						<td>
	        							<p><a href="<c:url value="/estate/detailedinfomation?id=EstateId:${room.estate.estateId}"/>">${room.estate.estateName}</a><c:out value="${room.map}"/></p>
	        						</td>
	        						<td>	
	        							<a class="btn btn-info" href="<c:url value="/newRoom?estateId=${room.estate.estateId}&roomPublic=0"/>">내집꾸미기</a>
	        						</td>
	        						<td>
	        							<a class="btn btn-warning" href="<c:url value="/deletionLogical?memberId=${sessionScope.loginId}&roomId=${room.estate.estateId}"/>">논리삭제</a>
	        						</td>
	        					</tr>
        					</c:forEach>
        				</tbody>
        			</table>
    			</div>
   				<div role="tabpanel" class="tab-pane" id="profile">
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
					<c:forEach var="favorite" items="${flist}">
						<div class="col-sm-12 form-group">
							<p><a href="/">${favorite.estate.estateName}</a><c:out value="${favorite.memberId}estataId:${favorite.estate.estateId}"/></p>
							<input type="hidden" value="${favorite.estate.estateId}" id='favo' name='favo' >
							<button><a href="<c:url value="/estate/detailedinfomation?id=EstateId:${favorite.estate.estateId}"/>">매물상세정보</a></button>
						</div>
						
					</c:forEach>
					
    			</div>
    		
  			</div>
  		
			</div>
  			
  			
  		</div>
  		<div style="clear: both;"></div>
  	
  	
  	</div>
  	

    <!-- side nav button Start -->
    <div class="col-sm-3 sidenav">
		
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
		</div>
    </div>
  </div>
</div>
<div style="clear: both;"></div>
