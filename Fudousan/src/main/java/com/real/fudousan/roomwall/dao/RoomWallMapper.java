package com.real.fudousan.roomwall.dao;

import com.real.fudousan.roomwall.vo.RoomWall;
import com.real.fudousan.roomwall.vo.RoomWallConnector;

public interface RoomWallMapper {

	public int insertWall(RoomWall roomwall);
	
	public int insertConnector(RoomWallConnector roomWallConnector);
}
