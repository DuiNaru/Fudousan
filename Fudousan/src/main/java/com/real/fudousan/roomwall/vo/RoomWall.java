package com.real.fudousan.roomwall.vo;

import java.io.Serializable;

/**
 * 방 벽 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class RoomWall implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 3D 방. */
	private Room room;

	/** 방 벽 연결 지점. */
	private RoomWallConnector 1roomWallConnector;

	/** 방 벽 연결 지점. */
	private RoomWallConnector 2roomWallConnector;

	/** TYPE. */
	private String type;

	/** 텍스쳐. */
	private Texture frontTexture;

	/** 텍스쳐. */
	private Texture backTexture;

	/**
	 * 생성자.
	 */
	public RoomWall() {
	}

	/**
	 * 3D 방을 설정합니다..
	 * 
	 * @param room
	 *            3D 방
	 */
	public void setRoom(Room room) {
		this.room = room;
	}

	/**
	 * 3D 방을 가져옵니다..
	 * 
	 * @return 3D 방
	 */
	public Room getRoom() {
		return this.room;
	}

	/**
	 * 방 벽 연결 지점을 설정합니다..
	 * 
	 * @param 1roomWallConnector
	 *            방 벽 연결 지점
	 */
	public void set1roomWallConnector(RoomWallConnector 1roomWallConnector) {
		this.1roomWallConnector = 1roomWallConnector;
	}

	/**
	 * 방 벽 연결 지점을 가져옵니다..
	 * 
	 * @return 방 벽 연결 지점
	 */
	public RoomWallConnector get1roomWallConnector() {
		return this.1roomWallConnector;
	}

	/**
	 * 방 벽 연결 지점을 설정합니다..
	 * 
	 * @param 2roomWallConnector
	 *            방 벽 연결 지점
	 */
	public void set2roomWallConnector(RoomWallConnector 2roomWallConnector) {
		this.2roomWallConnector = 2roomWallConnector;
	}

	/**
	 * 방 벽 연결 지점을 가져옵니다..
	 * 
	 * @return 방 벽 연결 지점
	 */
	public RoomWallConnector get2roomWallConnector() {
		return this.2roomWallConnector;
	}

	/**
	 * TYPE을 설정합니다..
	 * 
	 * @param type
	 *            TYPE
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * TYPE을 가져옵니다..
	 * 
	 * @return TYPE
	 */
	public String getType() {
		return this.type;
	}

	/**
	 * 텍스쳐을 설정합니다..
	 * 
	 * @param frontTexture
	 *            텍스쳐
	 */
	public void setFrontTexture(Texture frontTexture) {
		this.frontTexture = frontTexture;
	}

	/**
	 * 텍스쳐을 가져옵니다..
	 * 
	 * @return 텍스쳐
	 */
	public Texture getFrontTexture() {
		return this.frontTexture;
	}

	/**
	 * 텍스쳐을 설정합니다..
	 * 
	 * @param backTexture
	 *            텍스쳐
	 */
	public void setBackTexture(Texture backTexture) {
		this.backTexture = backTexture;
	}

	/**
	 * 텍스쳐을 가져옵니다..
	 * 
	 * @return 텍스쳐
	 */
	public Texture getBackTexture() {
		return this.backTexture;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((room == null) ? 0 : room.hashCode());
		result = prime * result + ((1roomWallConnector == null) ? 0 : 1roomWallConnector.hashCode());
		result = prime * result + ((2roomWallConnector == null) ? 0 : 2roomWallConnector.hashCode());
		return result;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		RoomWall other = (RoomWall) obj;
		if (room == null) {
			if (other.room != null) {
				return false;
			}
		} else if (!room.equals(other.room)) {
			return false;
		}
		if (1roomWallConnector == null) {
			if (other.1roomWallConnector != null) {
				return false;
			}
		} else if (!1roomWallConnector.equals(other.1roomWallConnector)) {
			return false;
		}
		if (2roomWallConnector == null) {
			if (other.2roomWallConnector != null) {
				return false;
			}
		} else if (!2roomWallConnector.equals(other.2roomWallConnector)) {
			return false;
		}
		return true;
	}

}
