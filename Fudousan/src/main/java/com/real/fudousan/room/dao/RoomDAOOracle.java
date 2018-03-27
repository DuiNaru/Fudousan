package com.real.fudousan.room.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.real.fudousan.room.vo.Room;

public class RoomDAOOracle implements RoomDAO {

	private static final Logger logger = LoggerFactory.getLogger(RoomDAOOracle.class);

	@Autowired
	SqlSession sqlsession;
	
	//사용자가 자신이 작성한 매물리스트에서 검색해서 정보 가져오기
	@Override
	public Room searchRoomInfo(int estateId, int memberId) {
		logger.info("RoomDAOOracle_searchRoomInfo_start");
		RoomDAO mapper = sqlsession.getMapper(RoomDAO.class);
		Room room = null;
		try{
			room = mapper.searchRoomInfo(estateId, memberId);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("RoomDAOOracle_searchRoomInfo_end");
		return room;
	}

	//사용자가 마이페이지에 접속하면 자신의 매물리스트에 있는 정보 전부 가져온다
	@Override
	public ArrayList<Room> allMyRoom() {
		logger.info("RoomDAOOracle_allMyRoom_start");
		RoomDAO mapper = sqlsession.getMapper(RoomDAO.class);
		ArrayList<Room> rlist = null;
		try{
			rlist = mapper.allMyRoom();
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("RoomDAOOracle_allMyRoom_end");
		return rlist;
	}

}
