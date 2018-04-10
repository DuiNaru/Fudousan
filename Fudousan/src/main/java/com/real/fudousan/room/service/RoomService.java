package com.real.fudousan.room.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.room.controller.RoomController;
import com.real.fudousan.room.dao.RoomDAO;
import com.real.fudousan.room.vo.Room;

@Service
public class RoomService {
	
	private static final Logger logger = LoggerFactory.getLogger(RoomService.class);
	
	@Autowired
	private RoomDAO dao;
	
	/**
	 * 자기 매물 정보 검색
	 * @param roomSearch
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
	 * 자기가 작성한 매물 리스트 보기
	 * @param memberId
	 * @return 사용자가 작성한  매물들의 리스트
	 */
	public List<Room> showAllRoom(Integer memberId) {
		List<Room> rlist = null;
		rlist = dao.allMyRoom(memberId);
		return rlist;
	}
	
	/**
	 * 사용자 페이지에서 자기가 작성한 매물 리스트 보기
	 * @param memberId
	 * @param isRealRoom 실제로 존재하는 방인가 아닌가
	 * @return 사용자가 작성한  매물들의 리스트
	 */
	public List<Room> showAllRoom(Integer memberId, boolean isRealRoom) {
		logger.info("showAllRoom("+memberId+", "+isRealRoom+") Start");
		List<Room> result = null;
		result = dao.selectByIdOnReal(memberId, isRealRoom);
		logger.info("showAllRoom("+memberId+", "+isRealRoom+") End");
		return result;
	}
	

	/**
	 * 3D 모델링 생성
	 * @param room
	 * @return 해당 모델링 ID
	 */
	public int createRoom(Room room) {
		logger.info("createRoom(" + room + ") Start");
		
		int result = dao.insert(room);
		
		
		logger.info("createRoom(" + room + ") End");
		return result;
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
	
	/**
	 * 해당 방 아이디에 해당하는 모든 방을 가져온다.
	 * @param roomIds
	 * @return
	 */
	public List<Room> getRooms(Set<Integer> roomIds) {
		logger.info("getRooms("+roomIds+") Start");
		List<Room> result = null;
		result = dao.select(roomIds);
		logger.info("getRooms("+roomIds+") End");
		return result;
	}
	
	/**
	 * 특정 회원이 작성한 특정 방의 공개 여부를 변경한다.
	 * @param memberId
	 * @param roomId
	 * @param roomPublic
	 * @return
	 */
	public boolean changeRoomPublic(int memberId, int roomId, int roomPublic) {
		logger.info("changeRoomPublic("+memberId+", "+roomId+", "+roomPublic+") Start");
		boolean result = false;
		result = dao.updateRoomPublic(memberId, roomId, roomPublic);
		logger.info("changeRoomPublic("+memberId+", "+roomId+", "+roomPublic+") End");
		return result;
	}
	
	public boolean deleteRoom(int memberId, int roomId) {
		logger.info("changeRoomPublic("+memberId+", "+roomId+") Start");
		boolean result = false;
		result = dao.deleteRoom(memberId, roomId);
		logger.info("changeRoomPublic("+memberId+", "+roomId+") End");
		return result;
	}
}
