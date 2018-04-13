package com.real.fudousan.roomitem.service;

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
}
