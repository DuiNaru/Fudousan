<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<!-- TEXTURE MODAL START -->
	<div class="modal fade" id="textureModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Upload Texture</h4>
				</div>
				<div class="modal-body" >
					<div class="textureModal">
						<form action="../textureuproad" method="post" enctype="multipart/form-data">
							<input type="hidden" name="memberId" value="${sessionScope.loginId}" readonly/>
							<div class="form-group">
								<label>텍스쳐 이름</label>
								<input class="form-control" type="text" name="name">
							</div>
							<div class="form-group">
								<label>텍스쳐 설명</label>
								<input class="form-control" type="text" name="text">
							</div>
							<div class="form-group">
								<label>텍스쳐 파일</label>
								<input class="form-control" type="file" name="file">
							</div>
							<div class="form-group">
							<input class="form-control" type="submit" value="등록  " > 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
<!-- TEXTURE MODAL END -->
