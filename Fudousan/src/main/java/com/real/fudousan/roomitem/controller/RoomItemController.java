package com.real.fudousan.roomitem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.real.fudousan.item.vo.Item;
import com.real.fudousan.roomitem.service.RoomItemService;
import com.real.fudousan.roomitem.vo.RoomItem;

@RequestMapping("roomItem")
@Controller
public class RoomItemController {
	private Logger logger = LoggerFactory.getLogger(RoomItemController.class);

	@Autowired
	private RoomItemService service;
	
	@ResponseBody
	@RequestMapping(value="create", method=RequestMethod.GET)
	public RoomItem create(int roomId, Item item, double x, double y, double z) {
		logger.info("create("+roomId+", "+item+") Start");
		RoomItem result = null;
		RoomItem temp = new RoomItem();
		temp.setItem(item);
		temp.setRoomId(roomId);
		temp.setX(x);
		temp.setY(y);
		temp.setZ(z);
		if(service.create(temp) == 1) {
			logger.debug("Insert Roomitem : " + temp);
			result = service.get(temp.getRoomItemId());
			logger.debug("result : " + result);
		}
		logger.info("create("+roomId+", "+item+") End");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="save", method=RequestMethod.POST)
	public int save(@RequestBody RoomItem roomItem) {
		logger.info("save("+roomItem+") Start");
		int result = service.modify(roomItem);
		logger.info("save("+roomItem+") End");
		return result;
	}
}
