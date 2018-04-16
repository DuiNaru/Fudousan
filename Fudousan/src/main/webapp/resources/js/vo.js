/**
 * Item VO
 * @returns
 */
function Item() {
	this.fileDirectory = "";
	this.itemId = -1;
	this.itemName = "";
	this.itemType = new ItemType();
	this.modelFileName = "";
	this.refSiteSet = [];
	this.text = "";
	this.itemScale = 1;
	this.itemRotateX = 0;
	this.itemRotateY = 0;
	this.itemRotateZ = 0;
	this.itemX = 0;
	this.itemY = 0;
	this.itemZ = 0;
}

/**
 * ItemType VO
 * @param itemTypeId
 * @param itemTypeName
 * @returns
 */
function ItemType(itemTypeId, itemTypeName) {
	this.itemTypeId = itemTypeId;
	this.itemTypeName = itemTypeName;
}

/**
 * RefSite VO
 * @param creDate
 * @param id
 * @param itemId
 * @param text
 * @param url
 * @returns
 */
function RefSite(creDate, id, itemId, text, url) {
	this.creDate = creDate;
	this.id = id;
	this.itemId = itemId;
	this.text = text;
	this.url = url;
}

/**
 * Roomitem VO
 * @returns
 */
function RoomItem() {
	this.color = 0;
	this.item = new Item();
	this.roomId = -1;
	this.roomItemId = -1;
	this.rotateX = 0;
	this.rotateY = 0;
	this.rotateZ = 0;
	this.x = 0;
	this.y = 0;
	this.z = 0;
}

/**
 * js object를 roomItem vo로 변환
 * @param roomitemObj
 * @returns roomItem VO
 */
function objToRoomItem(roomitemObj) {

	var roomItem = new RoomItem();
	roomItem.color = roomitemObj.color;
	roomItem.roomId = roomitemObj.roomId;
	roomItem.roomItemId = roomitemObj.roomitemId;
	roomItem.rotateX = roomitemObj.rotateX;
	roomItem.rotateY = roomitemObj.rotateY;
	roomItem.rotateZ = roomitemObj.rotateZ;
	roomItem.x = roomitemObj.x;
	roomItem.y = roomitemObj.y;
	roomItem.z = roomitemObj.z;
	roomItem.item = objToItem(roomitemObj.item);
	return roomItem;
	
}

/**
 * js object를 item vo로 변환
 * @param itemObj
 * @returns item VO
 */
function objToItem(itemObj) {
	var item = new Item();
	item.fileDirectory = itemObj.fileDirectory;
	item.itemId = itemObj.itemId;
	item.itemName = itemObj.itemName;
	item.itemType = new ItemType(itemObj.itemType.itemTypeId, itemObj.itemType.itemTypeName);
	item.modelFileName = itemObj.modelFileName;
	item.text = itemObj.text;
	item.itemScale = itemObj.itemScale;
	item.itemRotateX = itemObj.itemRotateX;
	item.itemRotateY = itemObj.itemRotateY;
	item.itemRotateZ = itemObj.itemRotateZ;
	item.itemX = itemObj.itemX;
	item.itemY = itemObj.itemY;
	item.itemZ = itemObj.itemZ;
	$.each(itemObj.refSiteSet, function(index, obj) {
		item.refSiteSet.push(new RefSite(obj.creDate, obj.id, obj.itemId, obj.text, obj.url));
	});
	return item;
}