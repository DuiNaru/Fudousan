/**
 * 
 */
var bottomMenuDisplay = false;

$(function() {
	$("#bottom-menu").hide();
	$("#textureInfo").hide();
	$("#itemInfo").hide();

	$( "#ax" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, ui.value, null, null);
			$("input[name='itemRotateX']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#ay" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, null, ui.value, null);
			$("input[name='itemRotateY']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#az" ).slider({
		value: 0,
		min: 0,
		max: 360,
		step: 1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			rotate(curSelected, null, null, ui.value);
			$("input[name='itemRotateZ']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#px" ).slider({
		value: 0,
		min: -1000,
		max: 1000,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, ui.value, null, null);
			$("input[name='itemX']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#py" ).slider({
		value: 0,
		min: -1000,
		max: 1000,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, null, ui.value, null);
			$("input[name='itemY']").val(ui.value);
			infoDataChange = true;
		}
	});
	$( "#pz" ).slider({
		value: 0,
		min: -1000,
		max: 1000,
		step: 0.1,
		orientation: "horizontal",
		range: "min",
		slide: function( event, ui ) {
			move(curSelected, null, null, ui.value);
			$("input[name='itemZ']").val(ui.value);
			infoDataChange = true;
		}
	});
	
	$("#bottom-menu-button").click(function() {
		$("#bottom-menu").toggle('slide');
	});
});

/**
 * 좌측 X축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRX(value) {
	$("input[name='itemRotateX']").val(value);
	$( "#ax" ).slider("value", value);
}


/**
 * 좌측 Y축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRY(value) {
	$("input[name='itemRotateY']").val(value);
	$( "#ay" ).slider("value", value);
}


/**
 * 좌측 Z축 회전 바 설정
 * @param value
 * @returns
 */
function setInfoRZ(value) {
	$("input[name='itemRotateZ']").val(value);
	$( "#az" ).slider("value", value);
}

/**
 * 좌측 X축 바 설정
 * @param value
 * @returns
 */
function setInfoX(value) {
	$("input[name='itemX']").val(value);
	$( "#px" ).slider("option", "min", value-1000);
	$( "#px" ).slider("option", "max", value+1000);
	$( "#px" ).slider("value", value);
}

/**
 * 좌측 Y축 바 설정
 * @param value
 * @returns
 */
function setInfoY(value) {
	$("input[name='itemY']").val(value);
	$( "#py" ).slider("option", "min", value-1000);
	$( "#py" ).slider("option", "max", value+1000);
	$( "#py" ).slider("value", value);
}

/**
 * 좌측 Z축 바 설정
 * @param value
 * @returns
 */
function setInfoZ(value) {
	$("input[name='itemZ']").val(value);
	$( "#pz" ).slider("option", "min", value-1000);
	$( "#pz" ).slider("option", "max", value+1000);
	$( "#pz" ).slider("value", value);
}



/**
 * 아이템 정보창을 초기화(시작) 한다.
 * @returns
 */
function initInfo() {
	$("#leftItemName").html(curSelected.roomItem.item.itemName);
	$("#leftItemType").html(curSelected.roomItem.item.itemType.itemTypeName);
	$("#leftItemText").html(curSelected.roomItem.item.text);
	$("#leftItemSite").html(curSelected.roomItem.item.refSiteSet);

	setInfoX(curSelected.roomItem.x);
	setInfoY(curSelected.roomItem.y);
	setInfoZ(curSelected.roomItem.z);
	setInfoRX(curSelected.roomItem.rotateX);
	setInfoRY(curSelected.roomItem.rotateY);
	setInfoRZ(curSelected.roomItem.rotateZ);
	
	$("#itemInfo").show( "slide" );
}

/**
 * 아이템 정보창을 초기화(끝) 한다.
 * @returns
 */
function resetInfo() {
	$("#leftItemName").empty();
	$("#leftItemType").empty();
	$("#leftItemText").empty();
	$("#leftItemSite").empty();
	
	setInfoX(0);
	setInfoY(0);
	setInfoZ(0);
	setInfoRX(0);
	setInfoRY(0);
	setInfoRZ(0);
	
	infoDataChange = false;
	
	$("#itemInfo").hide( "slide" );
}

/**
 * 아이템 정보창 변경 적용 버튼 리스너
 * @returns
 */
function itemApplyListener() {
	//applyItemChange(curSelected.roomItem);
	NewCommand.itemChange(curSelected.roomItem);
}

function deleteItemButton() {
	NewCommand.delete(curSelected.roomItem);
}

/**
 * 아이템 리스트에서 아이템 클릭 했을 때,
 * @param item
 * @returns
 */
function createItemListener(item) {
	NewCommand.create(item);
}