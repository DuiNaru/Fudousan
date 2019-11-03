package com.real.fudousan.roomwall.vo;

import java.io.Serializable;

import com.real.fudousan.room.vo.Room;
import com.real.fudousan.texture.vo.Texture;

/**
 * 방 벽 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class RoomWall implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 3D 방 ID. */
	private int roomId;

	/** 방 벽 연결 지점. */
	private RoomWallConnector roomWallConnector1;

	/** 방 벽 연결 지점. */
	private RoomWallConnector roomWallConnector2;

	/** TYPE. */
	private String type;

	/** 텍스쳐. */
	private Texture frontTexture;

	/** 텍스쳐. */
	private Texture backTexture;
	
	private int roomWallId;

	public RoomWall() {
		super();
	}

	

	public RoomWall(int roomId, RoomWallConnector roomWallConnector1, RoomWallConnector roomWallConnector2, String type,
			Texture frontTexture, Texture backTexture, int roomWallId) {
		super();
		this.roomId = roomId;
		this.roomWallConnector1 = roomWallConnector1;
		this.roomWallConnector2 = roomWallConnector2;
		this.type = type;
		this.frontTexture = frontTexture;
		this.backTexture = backTexture;
		this.roomWallId = roomWallId;
	}



	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public RoomWallConnector getRoomWallConnector1() {
		return roomWallConnector1;
	}

	public void setRoomWallConnector1(RoomWallConnector roomWallConnector1) {
		this.roomWallConnector1 = roomWallConnector1;
	}

	public RoomWallConnector getRoomWallConnector2() {
		return roomWallConnector2;
	}

	public void setRoomWallConnector2(RoomWallConnector roomWallConnector2) {
		this.roomWallConnector2 = roomWallConnector2;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Texture getFrontTexture() {
		return frontTexture;
	}

	public void setFrontTexture(Texture frontTexture) {
		this.frontTexture = frontTexture;
	}

	public Texture getBackTexture() {
		return backTexture;
	}

	public void setBackTexture(Texture backTexture) {
		this.backTexture = backTexture;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getRoomWallId() {
		return roomWallId;
	}



	public void setRoomWallId(int roomWallId) {
		this.roomWallId = roomWallId;
	}



	@Override
	public String toString() {
		return "RoomWall [roomId=" + roomId + ", roomWallConnector1=" + roomWallConnector1 + ", roomWallConnector2="
				+ roomWallConnector2 + ", type=" + type + ", frontTexture=" + frontTexture + ", backTexture="
				+ backTexture + ", roomWallId=" + roomWallId + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + roomWallId;
		return result;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RoomWall other = (RoomWall) obj;
		if (roomWallId != other.roomWallId)
			return false;
		return true;
	}



	
	
}