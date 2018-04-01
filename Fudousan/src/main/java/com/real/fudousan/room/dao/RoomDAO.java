package com.real.fudousan.room.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.room.vo.Room;


public interface RoomDAO {
	public List<Room> searchRoomInfo(String roomSearch,int memberId);
	
	public List<Room> allMyRoom(Integer memberId);
	
	/**
	 * 파라미터 방 번호에 대한 모든 방 리스트를 select 한다.
	 * @param roomIds 가져오고자 하는 방 번호 들
	 * @return
	 */
	public List<Room> select(Set<Integer> roomIds);

	/**
	 * 실제 매물의 존재 유무에 따라 구분하여 해당 ID가 작성한 방을 가져온다.
	 * @param memberId 작성자
	 * @param isRealRoom 참이면 존재하는 방, 거짓이면 존재하지 않는 방
	 * @return 방 목록
	 */
	public List<Room> selectByIdOnReal(int memberId, boolean isRealRoom);
	
	/**
	 * 특정 회원과 특정 방에 해당하는 방의 공개 여부 값을 update한다.
	 * @param memberId 특정 회원
	 * @param roomId 특정 방
	 * @param roomPublic 공개 여부 값
	 * @return
	 */
	public boolean updateRoomPublic(int memberId, int roomId, int roomPublic);
}
