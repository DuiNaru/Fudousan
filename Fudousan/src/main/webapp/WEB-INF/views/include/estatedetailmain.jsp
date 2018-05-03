<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<!-- main layout -->
<div class="container-fluid text-center">    
  <div class="row content">
    
    <!-- side nav(left) -->
    <div class="col-sm-2 sidenav" id="buttonBar">
    	<c:if test="${sessionScope.memberId !=null }">
			<a class="btn btn-success btn-lg" href="../newRoom?estateId=${estateId}&amp;roomPublic=0" id="3dModelButton">
				<span class="glyphicon glyphicon-print"  data-lang="152"></span>
			</a>
			<br><br>
			<a data-toggle="modal" href="#3dDesignModal" class="btn btn-info btn-lg">
				<span class="glyphicon glyphicon-search"  data-lang="153"></span> 
			</a>
			<br><br>
		</c:if>
    </div>
    
<!-- text main -->
<div class="col-sm-8 text-left"> 
	<h1><span data-lang="154"></span></h1>
	<p>${resultEstate.address},  ${resultEstate.region }</p>
    <hr>
		
	<!-- Favorite Button -->
		<div id="favoriteBox">
			<c:if test="${sessionScope.memberId !=null }">
					<label id="star" for="id-of-input" class="custom-checkbox">
				  		<input type="checkbox" id="id-of-input"/>
				  		<i class="glyphicon glyphicon-star-empty" id="empty"></i>
				  		<i class="glyphicon glyphicon-star" id="full"></i>
					</label>
		    </c:if>
		</div>
    		<!-- map  -->
    		<div id="map"></div>
    		<hr>
			<div class="row row-flex" id="box">
      			<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          			<div class="price-table pt-bg-black">
	            	<div>
						<span data-lang="155"></span>
	                	<span><small data-lang="155"></small> ${resultEstate.tradeprice}¥</span>
					</div>
					<ul>
    					<li>
				    		<small data-lang="156"></small>
				    		<br>
				    		${resultEstate.tradeprice}¥
						</li>
						<li>
							<small data-lang="157"></small>
   							<br>
   							<c:choose>
								<c:when test="${resultEstate.priceperunit != null}">
									<h6>${resultEstate.unitprice}¥</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
   							<small data-lang="159"></small>
   							<br>
   							<c:choose>
								<c:when test="${resultEstate.priceperunit != null}">
									<h6>${resultEstate.priceperunit}¥</h6>
								</c:when>	
								<c:otherwise>
									<small data-lang="158"></small>
								</c:otherwise>                    	
							</c:choose>
             			</li>
          			</ul>
				</div>
			</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
			<div class="price-table pt-bg-green">
				<div>
					<span data-lang="160"></span>
					<span><small data-lang="161"></small></span>
				</div>
            	<ul>
            		<li>
						<small data-lang="162"></small>
                    	<c:choose>
							<c:when test="${resultEstate.area != null}">
								<h6>${resultEstate.area}㎥</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>
            		</li>
            		<li>
						<small data-lang="163"></small>
           	   			<c:choose>
							<c:when test="${resultEstate.landshape != null}">
								<h6>${resultEstate.landshape}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>
					</li>
            		<li>
						<small data-lang="164"></small>
           	   			<c:choose>
							<c:when test="${resultEstate.frontage != null}">
								<h6>${resultEstate.frontage}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>                    	
            		</li>
            		<li>
						<small data-lang="165"></small>
           	   			<c:choose>
							<c:when test="${resultEstate.totalfloorarea != null}">
								<h6>${resultEstate.totalfloorarea}㎥</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>       
            	   </li>
					<li>
               			<small data-lang="166"></small>
              		   	<c:choose>
							<c:when test="${resultEstate.breadth != null}">
								<h6>${resultEstate.breadth}</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>    
            	   </li>
					<li>
						<small data-lang="167"></small>
              		    <c:choose>
							<c:when test="${resultEstate.coverageratio != null}">
								<h6>${resultEstate.coverageratio}</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>    
					</li>
					<li>
						<small data-lang="168"></small>
						<c:choose>
							<c:when test="${resultEstate.floorarearatio != null}">
								<h6>${resultEstate.floorarearatio}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>    
            		</li>
        		</ul>
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    		<div class="price-table pt-bg-blue">
        		<div>
           	   		<span data-lang="160"></span>
					<span><small data-lang="161"></small></span>
        		</div>
       	 		<ul>
					<li>
						<small data-lang="169"></small>
						<c:choose>
							<c:when test="${resultEstate.buildingyear != null}">
								<h6>${resultEstate.buildingyear}</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>       
					</li>
					<li>
							<small data-lang="170"></small>
   						<c:choose>
							<c:when test="${resultEstate.structure != null}">
								<h6>${resultEstate.structure}</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>    
					</li>
					<li>
							<small data-lang="171"></small>
   						<c:choose>
							<c:when test="${resultEstate.direction != null}">
								<h6>${resultEstate.direction}</h6>
							</c:when>	
							<c:otherwise>
									<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>    
          	  		</li>
        		</ul>
    		</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    		<div class="price-table pt-bg-red">
        		<div>
            		<span data-lang="172"></span>
            		<span><small data-lang="161"></small></span>
       	 		</div>
        		<ul>
            		<li>
            			<small data-lang="173"></small>
           	   			<c:choose>
							<c:when test="${resultEstate.use != null}">
								<h6>${resultEstate.use}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>                        
					</li>
					<li>
						<small data-lang="174"></small>
						<br>
   						<c:choose>
							<c:when test="${resultEstate.renovation != null}">
								<h6>${resultEstate.renovation}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>                        
           			</li>
           			<li>
						<small data-lang="175"></small>
          	   			<c:choose>
							<c:when test="${resultEstate.classification != null}">
								<h6>${resultEstate.classification}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                   	
						</c:choose>   
					</li>
					<li>
						<small data-lang="176"></small>
   						<c:choose>
							<c:when test="${resultEstate.cityplanning != null}">
								<h6>${resultEstate.cityplanning}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>   
					</li>
					<li>
   						<small data-lang="177"></small>
   						<br>
   						<c:choose>
							<c:when test="${resultEstate.remarks != null}">
								<h6>${resultEstate.remarks}</h6>
							</c:when>	
							<c:otherwise>
								<small data-lang="158"></small>
							</c:otherwise>                    	
						</c:choose>   
                	</li>
				</ul>
			</div>
		</div>
		</div>
		<div>
		<hr>
			<div class="row">
				<div class="col-sm-12">
					<h2 data-lang="178"></h2>
				</div>
			</div>
			<div class="row" id="replyBox"></div>
		</div><!-- /container -->		
			
		<!-- input reply -->
			<div id="commentBox">
				<c:if test="${sessionScope.memberId !=null }">
						<div class="col-sm-12">
							<label><span data-lang="179"></span ></label>
							<textarea rows="3" class="form-control" id="text"></textarea>
							<br>	
							<button type="button" class="btn btn-info" id="replyButton" data-lang="180"></button>
						</div>
				</c:if>
				<br><br><br><br><br><br><br><br>
			</div>
		<br><br><br><br><br><br><br><br>
	</div>
	<div class="col-sm-2 sidenav">
		<div class="col-sm-2 sidenav">
		</div>
	</div>
	</div>
</div>
<!-- value -->
<input type="hidden" value="${sessionScope.memberId}" id="memberId">
<input type="hidden" value=" ${estateId}" id="estateId">
