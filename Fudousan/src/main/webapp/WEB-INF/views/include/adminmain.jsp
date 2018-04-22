<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<div class="container-fluid text-center">    
  <div class="row content">
  	<!-- 신청중인 부동산 업자 리스트 Start -->
    <div class="col-sm-6 text-center">
		<h1>신청 중인 부동산 리스트 </h1>
		
		<hr>
		
		<!-- result -->      
		<c:forEach var="agency" items="${agencylist }">
			<div class="col-sm-12 form-group">
				<h6/><c:out value="${agency.name }"/></h6>
				<button class="btn btn-default" onclick="confirm(${agency.agencyId})">승인</button>
			</div>
	  	</c:forEach>
    </div> 
    <!-- 신청중인 부동산 업자 리스트 End -->
    
    <!-- 아이템 정보 관리  Start -->
    <div class="col-sm-6 text-center"> 
		<h1>아이템 정보 관리</h1>
		<!-- search -->
		<div class="col-sm-12 form-group">
			<form class="form-inline" method="GET" onsubmit="return searchItem()">
				<input class="form-control" id="itemName" name="itemName" type="text" placeholder="アイテム名">
				<input class="btn btn-default" type="submit" value="検索">
			</form>
		</div>
		
		<hr>
		<!-- result -->
		
		<div id="itemList" class="col-sm-12">
			<c:forEach var="item" items="${itemList }">
				<div id="item${item.itemId}" class="col-sm-offset-1 col-sm-10">
					<div class="col-sm-12">
						<h6 class="col-sm-6">${item.itemName }</h6>
						<div class="col-sm-6">
							<a class="btn btn-default" href="../item/itemModifyPage?itemId=${item.itemId}">修正</a>
							<input class="btn btn-default" type="button" onclick="deleteItem(${item.itemId})" value="削除">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-sm-12">
			<a class="btn btn-default" href="../item/itemAddPage">アイテム登録</a>
		</div>
	</div>
</div>
</div>















