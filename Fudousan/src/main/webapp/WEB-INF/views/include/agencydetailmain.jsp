<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<!-- main layout -->
<div class="container-fluid text-center">    
  <div class="row content">
    
    <!-- side nav(left) -->
    <div class="col-sm-2 sidenav" >
    	<div class="row row-flex" id="box">
      			<div style="margin-left: 5%">
          			<div class="price-table pt-bg-black">
	            	<div>
						<span>Information</span>
					</div>
					<ul>
    					<li>
				    		<h6>Agency Name</h6>
				    		${agency.name}
						</li>
						<li>
							<h5>Agency Trans Type</h5>
   							${agency.transType.transName}
						</li>
						<li>
							<h5>Text</h5>
   							${agency.text}
						</li>
          			</ul>
				</div>
			</div>
		</div>
    </div>
    
<!-- text main -->
<div class="col-sm-8 text-left"> 
	<h1>Details</h1>
	<p>${agency.addressMain}${agency.addressMiddle}${agency.addressSmall}${agency.addressSub}</p>
    <hr>
    		<!-- map  -->
    		<div id="map"></div>
    		<hr>
		
</div>
	
		<div class="col-sm-2 sidenav">
			
		</div>
	</div>
</div>

<!-- value -->
<input type="hidden" value="${sessionScope.memberId}" id="memberId">
<input type="hidden" value=" ${estateId}" id="estateId">
