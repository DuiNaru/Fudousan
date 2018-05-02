<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<!-- main layout -->
<div class="container-fluid text-center">    
  <div class="row content">
    
    <!-- side nav(left) -->
    <div class="col-sm-2 sidenav" >
    
    </div>
    
<!-- text main -->
<div class="col-sm-8 text-left"> 
	<h1 data-lang="197"></h1>
	<p>${agency.addressMain}${agency.addressMiddle}${agency.addressSmall}${agency.addressSub}</p>
    <hr>
	<!-- map  -->
	<div id="map"></div>
	<hr>
		<div class="row row-flex" id="box">
      			<div class="col-sm-6">
          			<div class="price-table pt-bg-blue">
	            	<div>
						<span data-lang="186"></span>
					</div>
					<ul>
    					<li>
    						<small data-lang="187"></small>
				    		<br>
				    		
				    		<c:choose>
								<c:when test="${agency.name != null}">
									<h6>${agency.name}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
				    		
						</li>
						<li>
							<small data-lang="188"></small>
   							<br>
   				
   							<c:choose>
								<c:when test="${agency.transType.transName != null}">
									<h6>${agency.transType.transName}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<small data-lang="189"></small>
   							<br>
   							<c:choose>
								<c:when test="${agency.text != null}">
									<h6>${agency.text}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
						</li>
          			</ul>
				</div>
			</div>
			<div class="col-sm-6">
          			<div class="price-table pt-bg-red">
	            	<div>
						<span data-lang="190">Member Info</span>
					</div>
					<ul>
    					<li>
				    		<small data-lang="191"></small>
				    		<br>
				    		
				    		<c:choose>
								<c:when test="${agency.member.memberName != null}">
									<h6>${agency.member.memberName}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
				    		
						</li>
						<li>
							<small data-lang="192"></small>
   							<br>
   							
   							<c:choose>
								<c:when test="${agency.member.email != null}">
									<h6>${agency.member.email}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
				    		
   							
						</li>
						<li>
							<small data-lang="193"></small>
   							<br>
   						
							<c:choose>
								<c:when test="${agency.member.text != null}">
									<h6>${agency.member.text}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>						
						</li>
						<li>
							<small data-lang="194"></small>
							<br>
   							
   							<c:choose>
								<c:when test="${agency.member.phone != null}">
									<h6>${agency.member.phone}</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>		
						</li>
						<li>
						
							<small data-lang="195"></small>
							<div class="thumnail">
								<c:if test="${!empty agency.member.picture}">
									<img src="/fudousan${agency.member.picture}" style="width: 30%; height: auto;">
								</c:if>
								<c:if test="${empty agency.member.picture}">
									<small data-lang="158"></small>
								</c:if>
								<br>
								<br>
							</div>

						</li>
          			</ul>
				</div>
			</div>
			
			
		</div>
		
</div>
	
		<div class="col-sm-2 sidenav">
			    <div class="row row-flex" >
      			
		</div>
		</div>
	</div>
</div>

<!-- value -->
<input type="hidden" value="${sessionScope.memberId}" id="memberId">
<input type="hidden" value=" ${estateId}" id="estateId">
