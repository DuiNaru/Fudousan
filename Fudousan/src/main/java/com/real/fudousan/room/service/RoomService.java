package com.real.fudousan.room.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.room.controller.RoomController;
import com.real.fudousan.room.dao.RoomDAO;
import com.real.fudousan.room.vo.Room;

@Service
public class RoomService {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomDAO dao;
	
	/**
	 * 사용자 페이지에서 자기 매물 정보 검색
	 * @param estateId
	 * @param memberId
	 * @return 검색자의 매물정보중 검색대상
	 */
	public List<Room> showMyRoom(String roomSearch, int memberId) {
		List<Room> srlist = null;
		srlist = dao.searchRoomInfo(roomSearch, memberId);
		/*logger.info("srlist에 들어온값 "+srlist.get(0));*/
		return srlist;
	}
	
	/**
	 * 사용자 페이지에서 자기가 작성한 매물 리스트 보기
	 * @param 
	 * @return 사용자가 작성한  매물들의 리스트
	 */
	public List<Room> showAllRoom(Integer memberId) {
		List<Room> rlist = null;
		rlist = dao.allMyRoom(memberId);
		return rlist;
	}
	

	/**
	 * 3D 모델링 생성
	 * @param room
	 * @return 해당 모델링 ID
	 */
	public int createRoom(Room room) {
		
		return -1;
	}
	
	/**
	 * 천장 텍스쳐 변경
	 * @param roomId
	 * @param textureId
	 * @return
	 */
	public boolean changeCeilingTexture(int roomId, int textureId) {
		
		return false;
	}
	
	/**
	 * 바닥 텍스쳐 변경
	 * @param roomId
	 * @param textureId
	 * @return
	 */
	public boolean changeFloorTexture(int roomId, int textureId) {
		
		return false;
	}
}
