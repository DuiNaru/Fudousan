<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  MODAL START -->
	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div>
						<h2 class="text-center">Email Check</h2>
					</div>
				</div>
				<div class="modal-body" >
					
					<form action="register" method="POST">
						<div class="col-sm-offset-3 col-sm-6">
							<div class="form-group has-feedback">
								<label for="id">이메일</label>
								<input id="id" class="form-control" type="text" name="clientId" required="required" placeholder="이메일를 입력하세요.">
								<span class="glyphicon form-control-feedback"></span>
							</div>
							
							<div class="form-group text-center">
								<div>
									<input type="submit" class="btn btn-primary" value="승인">
								</div>
							</div>
						</div>
					</form>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	</div>	
<!--  MODAL END -->
