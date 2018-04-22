<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

<div class="container-fluid text-center">    
  <div class="row content">
  	<div class="col-sm-2 sidenav">
	</div>  
  	
  	<!--  매물 관리 Start -->
    <div class="col-sm-8 text-left">
		<h1> 매물 관리</h1>
		
		<input  type="button" value="매물 작성" class="btn btn-info" onclick="location.href='/fudousan/bw'"/>
		
		<hr>
		
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
						<td><input type="button" value="삭제"  class="btn btn-info" onclick="location.href='deleteEntry?agencyId=${agencyId}&estateId=${estate.estateId}'"></td>
						<td><input type="button" value="수정" class="btn btn-info" onclick="location.href='/fudousan/bc?estateId=${estate.estateId}'"></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
 		
 		<!-- 매물 3D 모델링 관리  Start -->
		<h1>매물 3D 모델링 관리</h1>
		

	
		
		<!-- result -->
		<table class="table">
			<thead class="table">
				<tr>
					<th>Item Name</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
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





