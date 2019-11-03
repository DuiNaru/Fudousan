<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<!-- TEXTURE MODAL START -->
	<div class="modal fade" id="textureModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title"><label><span data-lang="203"></span></label></h4>
				</div>
				<div class="modal-body" >
					<div class="textureModal">
						<form action="../textureuproad" method="post" enctype="multipart/form-data">
							<input type="hidden" name="memberId" value="${sessionScope.loginId}" readonly/>
							<div class="form-group">
								<label><span data-lang="200"></span></label>
								<input class="form-control" type="text" name="name">
							</div>
							<div class="form-group">
								<label><span data-lang="201"></span></label>
								<input class="form-control" type="text" name="text">
							</div>
						
							<label><span data-lang="202"></span></label>
							<div class="input-group input-file" name="file">
								<br>
								<span class="input-group-btn">
									<button class="btn btn-default btn-choose" type="button" data-lang="16"></button>
								</span>
								<input type="text" class="form-control" data-lang="17" name="file"/>
							</div>
							<br>
							<div class="form-group">
								<button class="form-control btn btn-info"  type="submit" data-lang="184" ></button> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
<!-- TEXTURE MODAL END -->
