package com.real.fudousan.roomitem.service;

import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.roomitem.controller.RoomItemController;
import com.real.fudousan.roomitem.dao.RoomItemDAO;
import com.real.fudousan.roomitem.vo.RoomItem;

@Service
public class RoomItemService {
	private Logger logger = LoggerFactory.getLogger(RoomItemService.class);
	
	@Autowired
	private RoomItemDAO dao;
	
	public int create(RoomItem roomItem) {
		logger.info("create("+roomItem+") Start");
		int result = dao.insert(roomItem);
		logger.info("create("+roomItem+") End");
		return result;
	}
	
	public RoomItem get(int roomitemId) {
		logger.info("get("+roomitemId+") Start");
		RoomItem result = dao.select(roomitemId);
		logger.info("get("+roomitemId+") End");
		return result;
	}
	
	public Set<RoomItem> getRoomItemsInRoom(int roomId) {
		logger.info("getRoomItemsInRoom("+roomId+") Start");
		Set<RoomItem> result = dao.selectAllByRoomId(roomId);
		logger.info("getRoomItemsInRoom("+roomId+") End");
		return result;
	}
	
	public int modify(RoomItem roomItem) {
		logger.info("modify("+roomItem+") Start");
		int result = dao.update(roomItem);
		logger.info("modify("+roomItem+") End");
		return result;
	}
}
