package com.real.fudousan.room.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real.fudousan.room.dao.RoomDAO;
import com.real.fudousan.room.vo.Room;

@Service
public class RoomService {
	
	@Autowired
	private RoomDAO dao;
	
	/**
	 * 사용자 페이지에서 자기 매물 정보 검색
	 * @param estateId
	 * @param memberId
	 * @return 검색자의 매물정보중 검색대상
	 */
	public Room showMyRoom(int estateId, int memberId) {
		Room myroom = null;
		myroom = dao.searchRoomInfo(estateId, memberId);
		
		return myroom;
	}
	
	/**
	 * 사용자 페이지에서 자기가 작성한 매물 리스트 보기
	 * @param room
	 * @return 사용자가 작성한  매물들의 리스트
	 */
	public ArrayList<Room> showAllRoom() {
		ArrayList<Room> rlist = null;
		rlist = dao.allMyRoom();
		
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
