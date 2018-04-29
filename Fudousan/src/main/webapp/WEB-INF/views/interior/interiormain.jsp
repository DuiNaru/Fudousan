<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

<div class="container-fluid text-center">    
  <div class="row content">
  	<div class="col-sm-2 sidenav"></div>  
    <div class="col-sm-8 text-left">
     	<br>
 		<div role="tabpanel">
		  <!-- Nav tabs -->
		  <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Member Request List</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Confirm 3D List</a></li>
		    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">My list</a></li>
		  
		  </ul>
		
		  <!-- Tab panes -->
		  <div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">
		    <!-- 사용자 요청 리스트 Start -->
				<h1>사용자 요청 리스트</h1>
				<!-- result -->      
				<table class="table">
					<thead class="table">
						<tr>
							<th>Estate Id</th>
							<th>Estate Name</th>
							<th>Start Interior</th>
							<th>Cancel</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="advice" varStatus="status" items="${adviceList}">
							<tr id="req${status.index}">
								<td>${advice.room.estate.estateId }</td>
								<td>${advice.room.estate.estateName }</td>
								<td><button class="btn btn-success">인테리어 시작</button></td>
								<td><input class="btn btn-danger" type="button" value="취소" onclick = "unConfirm(${status.index}, ${advice.requestMemberId}, ${advice.room.roomId})"></td>
							</tr>
						
					</c:forEach>
					</tbody>
				</table>
		    </div>
		    <div role="tabpanel" class="tab-pane" id="profile">
					<!-- 3D 작성 매물 확인  Start -->
		  			<h1>3D 작성 매물 확인</h1>
			
					<!-- result -->
					<table class="table">
						<thead class="table">
							<tr>
								<th>Estate Id</th>
								<th>Estate Name</th>
								<th>Design</th>
								<th>Modify</th>
								<th>Delete</th>
								<th>Open/Close</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="room" varStatus="status" items="${realRoomList}">
								<%-- <div id="room${room.roomId}" class="col-sm-12"></div> --%>
								<tr id="room${room.roomId}">
									<td>${room.estate.estateId }</td>
									<td>${room.estate.estateName }</td>
									<td><a class="btn btn-default" href="../newRoom?estateId=${room.estate.estateId}&roomPublic=0">새로 꾸미기</a></td>
									<td><a class="btn btn-default" href="../roomPage?roomId=${room.roomId}">수정</a></td>
									<td><input class="btn btn-default" type="button" value="삭제" onclick="deleteRoom(${room.roomId})"></td>
									<td>
										<p class="radio-inline"><input name="public${room.roomId}" type="radio" value="1" roomId="${room.roomId}"<c:if test="${room.roomPublic == 1}"> checked="checked"</c:if>>공개</p>
										<p class="radio-inline"><input name="public${room.roomId}" type="radio" value="0" roomId="${room.roomId}"<c:if test="${room.roomPublic == 0}"> checked="checked"</c:if>>비공개</p>
									</td>
								</tr>
								
							</c:forEach>
						</tbody>
					</table>		    
			</div>
		    <div role="tabpanel" class="tab-pane" id="messages">
		    	<!-- 내가 만든 리스트 Start -->
	   			<h1>내가 만든 리스트</h1>
	   			<div class="text-right">
					<a class="btn btn-info" href="../newRoom?roomPublic=0">모델링 작성</a>
				</div>
				<!-- result -->
				<table class="table">
					<thead class="table">
						<tr>
							<th>Room Id</th>
							<th>Snap Shot</th>
							<th>Wall Modify</th>
							<th>Modify</th>
							<th>Delete</th>
							<th>Open / Close</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="virtual" varStatus="status" items="${notRealRoomList}">
							<tr id="virtual${virtual.roomId}">
							<%-- <div id="virtual${virtual.roomId}" class="col-sm-12"></div> --%>
								<td>${virtual.roomId}</td>
								<td><img style="height: 100px; width: auto;" src="<c:url value="${virtual.snapshot}"/>"></td>
								<td><a class="btn btn-default" href="../wall/wallPage?roomId=${virtual.roomId}">벽 수정</a></td>
								<td><a class="btn btn-default" href="../roomPage?roomId=${virtual.roomId}">수정</a></td>
								<td><input class="btn btn-default" type="button" value="삭제" onclick="deleteRoom(${virtual.roomId})"></td>
								<td>
									<p class="radio-inline"><input name="public${virtual.roomId}" type="radio" value="1" roomId="${virtual.roomId}"<c:if test="${virtual.roomPublic == 1}"> checked="checked"</c:if>>공개</p>
									<p class="radio-inline"><input name="public${virtual.roomId}" type="radio" value="0" roomId="${virtual.roomId}"<c:if test="${virtual.roomPublic == 0}"> checked="checked"</c:if>>비공개</p>
								</td>
							
							</tr>
						</c:forEach>
					</tbody>
				</table>
		    </div>
		</div>
	</div> 		
    </div> 
	<div class="col-sm-2 sidenav">
	</div>
</div> 
</div>
