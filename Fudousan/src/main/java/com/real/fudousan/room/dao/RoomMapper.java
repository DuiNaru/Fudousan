package com.real.fudousan.room.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.room.vo.Room;

public interface RoomMapper {

	public List<Room> searchRoomInfo(int roomSearch,int memberId);
	
	public List<Room> allMyRoom(Integer memberId);
	
	public List<Room> selectByIds(Set<Integer> roomIds);
}
