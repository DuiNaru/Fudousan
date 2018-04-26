<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
	<!--  join form  -->
	<article class="container">
        <div class="page-header">
			<h1><span data-lang="6"></span>&nbsp;<small>basic form</small></h1>
		</div>
		
		<div class="col-md-6 col-md-offset-3">
			<form role="form" action="insertMember" method="post" enctype="multipart/form-data" onsubmit="return formsubmit()">
				<div class="form-group">
					<label for="InputName" data-lang="8"></label>
					<input type="text" class="form-control" id="InputName" name="memberName" data-lang="8">
				</div>
				
				<div class="form-group">
					<label for="InputPassword1" data-lang="3"></label>
					<input type="password" class="form-control" id="InputPassword1" name="password" data-lang="3">
				</div>
				
				<div class="form-group">
					<label for="InputPassword2" data-lang="9"></label>
					<input type="password" class="form-control" id="InputPassword2" data-lang="9">
					<p class="help-block" data-lang="10"></p>
				</div>
				
				<div class="form-group">
					<label for="InputEmail" data-lang="2"></label>
					<input type="email" class="form-control" id="InputEmail" name="email" data-lang="2">
				</div>
				
				<div class="form-group">
					<label for="InputText" data-lang="11"></label>
					<input type="text" class="form-control" id="userphone" name="phone" data-lang="12">
				</div>
	            
				<div class="input-group">
					<label for="InputText" data-lang="13"></label>
					<textarea class="form-control" rows="3" cols="100" style="resize:none" name="text" data-lang="14"></textarea>
				</div>
			
				<div class="form-group">
					<label for="InputPhoto" data-lang="15"></label>
					<div class="input-group input-file" name="Fichier1">
						<span class="input-group-btn">
							<button class="btn btn-default btn-choose" type="button" data-lang="16"></button>
						</span>
						<input type="text" class="form-control" data-lang="17" name="picture"/>
						<span class="input-group-btn">
							<button class="btn btn-warning btn-reset" type="button" data-lang="18"></button>
						</span>
					</div>
				</div>
	
				<div class="form-group">
					<label for="InputDesigner" data-lang="19"></label>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-secondary active">
							<input type="radio" name="designer" id="option1" autocomplete="off" value="1" checked> Yes
						</label>
						<label class="btn btn-secondary">
							<input type="radio" name="designer" id="option2" autocomplete="off" value="0"> No
						</label>
					</div>
				</div>
	         
				<div class="form-group">
					<label data-lang="20"></label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active">
							<span class="fa fa-check"></span>
							<input id="agree" type="checkbox" autocomplete="off" name="checkbox" >
						</label>
						<span data-lang="21"></span>&nbsp;<a href="#" data-lang="22"></a>
					</div>
				</div>
	         
				<div class="form-group text-center">
					<button type="submit" class="btn btn-info"><span data-lang="5"></span><i class="fa fa-check spaceLeft"></i></button>
				</div>
			</form>
		</div>
	</article>