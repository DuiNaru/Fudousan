<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-2 sidenav"></div>
		<div class="col-sm-8 text-left">
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Estate Management</a></li>
					<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">3D Modeling Management</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="home">
						<!--  매물 관리 Start -->
						<h1>매물 관리</h1>
						<div class="text-right">
							<input type="button" value="매물 작성" class="btn btn-info"
								onclick="location.href='/fudousan/bw'" />
						</div>

						<!-- result -->
						<div class="text-left">
							<table class="table">
								<thead class="table">
									<tr>
										<th>Estate Id</th>
										<th>Estate Name</th>
										<th>Estate Modify</th>
										<th>Estate Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="estate" items="${select}">
										<tr>
											<td>${estate.estateId}</td>
											<td>${estate.estateName}</td>
											<td><input type="button" value="수정" class="btn btn-info" onclick="location.href='/fudousan/bc?estateId=${estate.estateId}'"></td>
											<td><input type="button" value="삭제" class="btn btn-danger" onclick="location.href='deleteEntry?agencyId=${agencyId}&estateId=${estate.estateId}'"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
						<!-- 매물 3D 모델링 관리  Start -->
						<h1>매물 3D 모델링 관리</h1>
						<div class="text-right">
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#estateListModal">매물 모델링 관리</button>
						</div>
						<!-- result -->
						<table class="table">
							<thead class="table">
								<tr>
									<th>Room Title</th>
									<th>Snap Shot</th>
									<th>Modify</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="room" items="${roomList }">	
									<tr id="room${room.roomId}">
										<td><c:if test="${empty room.roomTitle }">(名無し)</c:if><c:if test="${!empty room.roomTitle }">${room.roomTitle }</c:if></td>
										<td><img src="<c:url value="${room.snapshot}"/>"></td>
										<td><a class="btn btn-info" href="./roomPage?roomId=${room.roomId}">수정</a></td>
										<td><button type="button" class="btn btn-danger" onclick="roomDeleteListener(${room.roomId})">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- 신청중인 부동산 업자 리스트 End -->
				</div>
			</div>
		</div>
		<div class="col-sm-2 sidenav"></div>
	</div>
</div>