/**
 * 
 */
var originalSiteList = "";

function addsitecolumn() {
	var column = "<div class='form-group'>";
	column += "<div class='form-group'>";
	column += "<label>タイトル</label>";
	column += "<input class='form-control' name='titles' type='text'>";
	column +=  "</div>";
	column += "<label>アドレス</label>";
	column += "<input class='form-control' name='sites' type='text'>";
	column += "</div>";
	$("#sitelist").append(column);
}

function formreset() {
	if (confirm("リセットなさいますか。")) {
		$("#sitelist").html(originalSiteList);
		return true;
	}
	return false;
}

function backupSiteList() {
	originalSiteList = $("#sitelist").html();
	$("#sitelist").html(originalSiteList);
}

function delSite(id) {
	$("#s"+id).remove();
}