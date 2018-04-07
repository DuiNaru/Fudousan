package com.real.fudousan.roomwall.dao;

import java.util.List;
import java.util.Map;

import com.real.fudousan.roomwall.vo.RoomWall;
import com.real.fudousan.roomwall.vo.RoomWallConnector;

public interface RoomWallDAO {

	public boolean insertWallAndConnector(List<RoomWall> roomWall, Map<Integer, RoomWallConnector> roomConnector);
}
