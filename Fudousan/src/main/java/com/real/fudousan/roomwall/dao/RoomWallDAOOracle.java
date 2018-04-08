package com.real.fudousan.roomwall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.real.fudousan.roomwall.service.RoomWallService;
import com.real.fudousan.roomwall.vo.RoomWall;
import com.real.fudousan.roomwall.vo.RoomWallConnector;

@Repository
public class RoomWallDAOOracle implements RoomWallDAO {
	private static final Logger logger = LoggerFactory.getLogger(RoomWallDAOOracle.class);
	@Autowired
	private SqlSession session;

	@Transactional
	@Override
	public boolean insertWallAndConnector(List<RoomWall> roomWall, Map<Integer, RoomWallConnector> roomConnector) {
		logger.info("insertWallAndConnector() Start");
		boolean result = false;
		
		
		
		
		
		logger.info("insertWallAndConnector() end");
		return result;
	}

}
