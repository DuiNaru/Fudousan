<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				<c:if test="${!empty item && !empty item.itemId}">
					<input type="hidden" name="itemId" value="${item.itemId}">
				</c:if>
				<div class="form-group">
					<label>アイテム名</label>
					<input id="name" name="itemName" class="form-control" type="text" required="required"<c:if test="${!empty item}"> value="${item.itemName}"</c:if>>
				</div>
				<div class="form-group">
					<label>アイテム説明</label>
					<input id="text" name="text" class="form-control" type="text"<c:if test="${!empty item}"> value="${item.text}"</c:if>>
				</div>
				<div class="form-group">
					<label>アイテムタイプ</label>
					<select id="type" name="itemTypeId" class="form-control" required="required">
						<option value="1"<c:if test="${!empty item && item.itemType.itemTypeId == 1}"> selected="selected"</c:if>>test</option>
					</select>
				</div>
				<div class="form-group">
					<label>3Dモデルファイル名</label>
					<input id="model" name="modelFileName" class="form-control" type="text" required="required"<c:if test="${!empty item}"> value="${item.modelFileName}"</c:if>>
				</div>
				<div class="form-group">
					<label>ファイルディレクトリ</label>
					<input id="files" name="files" class="form-control" webkitdirectory directory type="file" <c:if test="${empty item}"> required="required"</c:if>>
				</div>
				<div class="form-group">
					<label>関連サイト</label>
					<div id="sitelist">
					<c:if test="${!empty item}"> 
						<c:forEach var="site" items="${item.refSiteSet}">
							<div id="s${site.id}">
								<div class="form-group">
									<label>タイトル</label>
									<input class='form-control' name='titles' type='text' value='${site.text }'>
								</div>
								<div class="form-group">
									<label>アドレス</label>
									<input class='form-control' name='sites' type='text' value='${site.url }'>
								</div>
								<input class="btn btn-danger" type="button" onclick="delSite(${site.id})" value="削除">
							</div>
						</c:forEach>
						<script type="text/javascript">backupSiteList();</script>
					</c:if>
					</div>
					<input class="btn btn-default" type="button" onClick="addsitecolumn()" value="サイト追加">
				</div>
				<div class="form-group">
					<input class="col-sm-6 btn btn-default" type="submit" value="アップロード">
					<input class="col-sm-6 btn btn-default" type="reset" value="リセット">
				</div>