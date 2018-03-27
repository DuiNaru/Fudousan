package com.real.fudousan.texture.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.real.fudousan.member.vo.Member;
import com.real.fudousan.room.vo.Room;
import com.real.fudousan.roomwall.vo.RoomWall;

/**
 * 텍스쳐 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Texture implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** TEXTURE_ID. */
	private Integer textureId;

	/** 텍스쳐 분류. */
	private TextureType textureType;

	/** 회원 아이디. */
	private int memberId;

	/** NAME. */
	private String name;

	/** TEXT. */
	private String text;

	/** FILE. */
	private String file;

	/** DATE. */
	private Date date;

	/** DEL_DATE. */
	private Date delDate;
}
