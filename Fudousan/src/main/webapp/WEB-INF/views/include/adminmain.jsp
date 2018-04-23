<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<div class="container-fluid text-center">    
  <div class="row content">
  	<div class="col-sm-2 sidenav">
	</div>  
  	
  	<!-- 신청중인 부동산 업자 리스트 Start -->
    <div class="col-sm-8 text-left">
		<h1>신청 중인 부동산 리스트 </h1>
		
		<hr>
		
		<!-- result -->      
		<div class="text-left">
			<table class="table">
				<thead class="table">
					<tr>
						<th>Agency Name</th>
						<th>Confirm</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="agency" items="${agencylist }">
					<tr>
						<td><c:out value="${agency.name }"/></td>
						<td><button class="btn btn-success" onclick="confirm(${agency.agencyId})">승인</button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	
 		
 		<!-- 아이템 정보 관리  Start -->
		<h1>아이템 정보 관리</h1>
		

		
		<!-- search -->
		<div class="col-sm-10 form-group">
			<form class="form-inline" method="GET" onsubmit="return searchItem()">
				<input class="form-control" id="itemName" name="itemName" type="text" placeholder="アイテム名">
				<input class="btn btn-default" type="submit" value="検索">
			</form>
	   </div>
	   <!-- 아이템 등록 버튼 -->
		<div class="col-sm-2">
			<a class="btn btn-default" href="../item/itemAddPage">アイテム登録</a>
		</div>   
	
		
		<!-- result -->
		<table class="table">
			<thead class="table">
				<tr>
					<th>Item Name</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody id="itemList">
				<c:forEach var="item" items="${itemList }">
					<tr>
						<td>${item.itemName }</td>
						<td><a class="btn btn-success" href="../item/itemModifyPage?itemId=${item.itemId}">修正</a></td>
						<td><input class="btn btn-warning" type="button" onclick="deleteItem(${item.itemId})" value="削除"></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
    </div> 
    <!-- 신청중인 부동산 업자 리스트 End -->
    
    
  
	<div class="col-sm-2 sidenav">
	</div>
</div>
</div>















