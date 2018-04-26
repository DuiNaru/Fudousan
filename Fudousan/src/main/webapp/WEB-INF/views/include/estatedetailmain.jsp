<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >


<!-- main layout -->
<div class="container-fluid text-center">    
  <div class="row content">
    
    <!-- side nav(left) -->
    <div class="col-sm-2 sidenav">
		
    </div>
    
<!-- text main -->
<div class="col-sm-8 text-left"> 
	<h1>Details</h1>
	<p>${resultEstate.address},  ${resultEstate.region }</p>
    <hr>
		
	<!-- Favorite Button -->
	<label id="star" for="id-of-input" class="custom-checkbox">
  		<input type="checkbox" id="id-of-input"/>
  		<i class="glyphicon glyphicon-star-empty" id="empty"></i>
  		<i class="glyphicon glyphicon-star" id="full"></i>
	</label>
    
    		<!-- map  -->
    		<div id="map"></div>
    		<hr>
			<div class="row row-flex" id="box">
      			<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
          			<div class="price-table pt-bg-black">
	            	<div>
						<span>PRICE</span>
	                	<span>Price ${resultEstate.tradeprice}¥</span>
					</div>
					<ul>
    					<li>
				    		<h6>Trade Price</h6>
				    		${resultEstate.tradeprice}¥
						</li>
						<li>
							<h5>Unit Price</h5>
   							<c:choose>
								<c:when test="${resultEstate.priceperunit != null}">
									<h6>${resultEstate.unitprice}¥</h6>
								</c:when>	
								<c:otherwise>
									<h6>Nothing</h6>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
   							<h5>Price Per Unit</h5>
   							<c:choose>
								<c:when test="${resultEstate.priceperunit != null}">
									<h6>${resultEstate.priceperunit}¥</h6>
								</c:when>	
								<c:otherwise>
									<h6>Nothing</h6>
								</c:otherwise>                    	
							</c:choose>
             			</li>
          			</ul>
				</div>
			</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
			<div class="price-table pt-bg-green">
				<div>
					<span>Over view</span>
					<span>About Estate</span>  
				</div>
            	<ul>
            		<li>
						<h5>Area</h5>
                    	<c:choose>
							<c:when test="${resultEstate.area != null}">
								<h6>${resultEstate.area}㎥</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>
            		</li>
            		<li>
						<h5>LandShape</h5>
           	   			<c:choose>
							<c:when test="${resultEstate.landshape != null}">
								<h6>${resultEstate.area}㎥</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>
					</li>
            		<li>
						<h5>Frontage</h5>
           	   			<c:choose>
							<c:when test="${resultEstate.frontage != null}">
								<h6>${resultEstate.frontage}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>                    	
            		</li>
            		<li>
						<h5>Total Floor Area</h5>
           	   			<c:choose>
							<c:when test="${resultEstate.totalfloorarea != null}">
								<h6>${resultEstate.totalfloorarea}㎥</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>       
            	   </li>
					<li>
               			<h5>Breadth</h5>
              		   	<c:choose>
							<c:when test="${resultEstate.breadth != null}">
								<h6>${resultEstate.breadth}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
            	   </li>
					<li>
						<h5>Coverage Ratio</h5>
              		    <c:choose>
							<c:when test="${resultEstate.coverageratio != null}">
								<h6>${resultEstate.coverageratio}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
					</li>
					<li>
						<h5>Floor Area Ratio</h5>
						<c:choose>
							<c:when test="${resultEstate.floorarearatio != null}">
								<h6>${resultEstate.floorarearatio}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
            		</li>
        		</ul>
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    		<div class="price-table pt-bg-blue">
        		<div>
           	   <span>OVER VIEW</span>
          		  <span>About Estate</span>        
        		</div>
       	 		<ul>
					<li>
						<h5>BuildingYear</h5>
						<c:choose>
							<c:when test="${resultEstate.buildingyear != null}">
								<h6>${resultEstate.buildingyear}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>       
					</li>
					<li>
						<h5>Structure</h5>
   						<c:choose>
							<c:when test="${resultEstate.structure != null}">
								<h6>${resultEstate.structure}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
					</li>
					<li>
						<h5>Direction</h5>
   						<c:choose>
							<c:when test="${resultEstate.direction != null}">
								<h6>${resultEstate.direction}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>    
          	  		</li>
        		</ul>
    		</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
    		<div class="price-table pt-bg-red">
        		<div>
            		<span>ETC</span>
            		<span>About estate</span>
       	 		</div>
        		<ul>
            		<li>
            			<h5>Use</h5>
           	   			<c:choose>
							<c:when test="${resultEstate.use != null}">
								<h6>${resultEstate.use}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>                        
					</li>
					<li>
						<h5>Renovation</h5>
   						<c:choose>
							<c:when test="${resultEstate.renovation != null}">
								<h6>${resultEstate.renovation}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>                        
           			</li>
           			<li>
						<h5>Classification</h5>
          	   			<c:choose>
							<c:when test="${resultEstate.classification != null}">
								<h6>${resultEstate.classification}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>   
					</li>
					<li>
						<h5>City Planning</h5>
   						<c:choose>
							<c:when test="${resultEstate.cityplanning != null}">
								<h6>${resultEstate.cityplanning}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>   
					</li>
					<li>
   						<h5>Remarks</h5>
   						<c:choose>
							<c:when test="${resultEstate.remarks != null}">
								<h6>${resultEstate.remarks}</h6>
							</c:when>	
							<c:otherwise>
								<h6>Nothing</h6>
							</c:otherwise>                    	
						</c:choose>   
                	</li>
				</ul>
			</div>
		</div>
		</div>
		</div>
		<div class="col-sm-2 sidenav">
			<div class="col-sm-2 sidenav">
				
				<a class="btn btn-success" href="../newRoom?estateId=2&amp;roomPublic=0">NEW 3D MODEL</a>
				<br><br>
				<a data-toggle="modal" href="#3dDesignModal" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-print"></span> 3D DESIGN
				</a>
				<br><br>
				<a data-toggle="modal" href="#emailModal" class="btn btn-success btn-lg">
					<span class="glyphicon glyphicon-envelope"></span>   E - MAIL
				</a>
 			</div>
		</div>
	</div>
</div>

