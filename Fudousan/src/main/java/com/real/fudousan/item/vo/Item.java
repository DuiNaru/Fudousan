package com.real.fudousan.item.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import com.real.fudousan.roomitem.vo.RoomItem;

/**
 * 3D 방 내부 아이템 들 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Item implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ITEM_ID. */
	private Integer itemId;

	/** 아이템 분류. */
	private ItemType itemType;

	/** NAME. */
	private String name;

	/** TEXT. */
	private String text;

	/** FILE. */
	private String file;

	/** 아이템 참고 사이트 목록. */
	private Set<RefSite> refSiteSet;
}
