package com.real.fudousan.room.dao;

import java.util.List;
import java.util.Set;

import com.real.fudousan.room.vo.Room;


public interface RoomDAO {
	public List<Room> searchRoomInfo(String roomSearch,int memberId);
	
	public List<Room> allMyRoom(Integer memberId);
	
	public List<Room> select(Set<Integer> roomIds);

}
