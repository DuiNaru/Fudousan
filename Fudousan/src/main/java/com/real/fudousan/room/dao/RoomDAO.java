package com.real.fudousan.room.dao;

import java.util.List;

import com.real.fudousan.room.vo.Room;


public interface RoomDAO {
	public List<Room> searchRoomInfo(int roomSearch,int memberId);
	
	public List<Room> allMyRoom(Integer memberId);

}
