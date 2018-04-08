package com.real.fudousan.roomwall.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.roomwall.dao.RoomWallDAO;
import com.real.fudousan.roomwall.vo.RoomWall;
import com.real.fudousan.roomwall.vo.RoomWallConnector;

@Service
public class RoomWallService {
	private static final Logger logger = LoggerFactory.getLogger(RoomWallService.class);
	
	@Autowired
	private RoomWallDAO dao;

	public boolean save(List<RoomWall> roomWallList, Map<Integer, RoomWallConnector> roomWallConnectorMap) {
		logger.info("save() Start");
		logger.debug("roomWallList : " + roomWallList.toString());
		logger.debug("roomWallConnectorMap : " + roomWallConnectorMap.toString());
		
		
		
		logger.info("save() End");
		return false;
	}
}
