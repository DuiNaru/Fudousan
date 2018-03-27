package com.real.fudousan.room.dao;

import java.util.ArrayList;

import com.real.fudousan.room.vo.Room;

public interface RoomDAO {
	public Room searchRoomInfo(int estateId,int memberId);
	
	public ArrayList<Room> allMyRoom();

}
