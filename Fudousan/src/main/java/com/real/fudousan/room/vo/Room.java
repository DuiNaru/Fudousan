package com.real.fudousan.room.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.real.fudousan.estate.vo.Estate;
import com.real.fudousan.member.vo.Member;
import com.real.fudousan.texture.vo.Texture;

/**
 * 3D 방 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Room implements Serializable {
	public static final int PUBLIC = 1;
	public static final int PRIVATE = 0;

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ROOM_ID. */
	private Integer roomId;

	/** 매물 . */
	private Estate estate;

	/** 스냅샷. */
	private String snapshot;

	/** 벽 도면. */
	private String map;

	/** DATE. */
	private Date creDate;

	/** DEL_DATE. */
	private Date delDate;

	/** HEIGTH. */
	private Integer height;

	/** 텍스쳐. */
	private Texture floorTexture;

	/** 텍스쳐. */
	private Texture ceilingTexture;

	/** 회원 아이디. */
	private int memberId;
	
	/** 방 공개 여부. */
	private int roomPublic;
	
	/**
	 * 룸 타이틀
	 */
	private String roomTitle;
	
	public Room(){}
	

	public Room(Integer roomId, Estate estate, String snapshot, String map, Date creDate, Date delDate, Integer height,
			Texture floorTexture, Texture ceilingTexture, int memberId, int roomPublic, String roomTitle) {
		super();
		this.roomId = roomId;
		this.estate = estate;
		this.snapshot = snapshot;
		this.map = map;
		this.creDate = creDate;
		this.delDate = delDate;
		this.height = height;
		this.floorTexture = floorTexture;
		this.ceilingTexture = ceilingTexture;
		this.memberId = memberId;
		this.roomPublic = roomPublic;
		this.roomTitle = roomTitle;
	}


	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Estate getEstate() {
		return estate;
	}

	public void setEstate(Estate estate) {
		this.estate = estate;
	}
	
	public int getEstateId() {
		return estate==null?-1:estate.getEstateId();
	}
	
	public void setEstateId(int estateId) {
		if(estate == null) {
			estate = new Estate();
		}
		estate.setEstateId(estateId);
	}

	public String getSnapshot() {
		return snapshot;
	}

	public void setSnapshot(String snapshot) {
		this.snapshot = snapshot;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Texture getFloorTexture() {
		return floorTexture;
	}

	public void setFloorTexture(Texture floorTexture) {
		this.floorTexture = floorTexture;
	}

	public Texture getCeilingTexture() {
		return ceilingTexture;
	}

	public void setCeilingTexture(Texture ceilingTexture) {
		this.ceilingTexture = ceilingTexture;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getRoomPublic() {
		return roomPublic;
	}
	
	public void setRoomPublic(int roomPublic) {
		this.roomPublic = roomPublic;
	}


	public String getRoomTitle() {
		return roomTitle;
	}


	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}


	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", estate=" + estate + ", snapshot=" + snapshot + ", map=" + map
				+ ", creDate=" + creDate + ", delDate=" + delDate + ", height=" + height + ", floorTexture="
				+ floorTexture + ", ceilingTexture=" + ceilingTexture + ", memberId=" + memberId + ", roomPublic="
				+ roomPublic + ", roomTitle=" + roomTitle + "]";
	}
	
	
	
	
	
}
