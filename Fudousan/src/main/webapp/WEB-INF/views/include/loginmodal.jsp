<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >

	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" data-lang="0"></h4>
				</div>
				
				<div class="modal-body">
					<span data-lang="2"></span> <input type="text" id="memberEmail" name="memberID">
					<span data-lang="3"></span> <input type="password" id="password" name="password">
					
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="loginBtn" data-lang="0"></button>
					<button type="button" class="btn btn-danger" data-dismiss="modal" data-lang="4"></button>
				</div>
			</div>
		</div>
	</div>
	<!-- 로그인 모달 끝 -->