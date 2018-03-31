package com.real.fudousan.room.dao;

import java.util.List;

import com.real.fudousan.room.vo.Room;

public interface RoomMapper {

	public List<Room> searchRoomInfo(String roomSearch,int memberId);
	
	public List<Room> allMyRoom(Integer memberId);
}
