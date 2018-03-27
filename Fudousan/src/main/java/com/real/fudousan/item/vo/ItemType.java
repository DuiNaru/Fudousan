package com.real.fudousan.item.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 아이템 분류 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class ItemType implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** ITEM_TYPE_ID. */
	private Integer itemTypeId;

	/** NAME. */
	private String name;

	/** 3D 방 내부 아이템 들 목록. */
	private Set<Item> itemSet;

	/**
	 * 생성자.
	 */
	public ItemType() {
		this.itemSet = new HashSet<Item>();
	}

	/**
	 * ITEM_TYPE_ID을 설정합니다..
	 * 
	 * @param itemTypeId
	 *            ITEM_TYPE_ID
	 */
	public void setItemTypeId(Integer itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	/**
	 * ITEM_TYPE_ID을 가져옵니다..
	 * 
	 * @return ITEM_TYPE_ID
	 */
	public Integer getItemTypeId() {
		return this.itemTypeId;
	}

	/**
	 * NAME을 설정합니다..
	 * 
	 * @param name
	 *            NAME
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * NAME을 가져옵니다..
	 * 
	 * @return NAME
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 3D 방 내부 아이템 들 목록을 설정합니다..
	 * 
	 * @param itemSet
	 *            3D 방 내부 아이템 들 목록
	 */
	public void setItemSet(Set<Item> itemSet) {
		this.itemSet = itemSet;
	}

	/**
	 * 3D 방 내부 아이템 들를 추가합니다..
	 * 
	 * @param item
	 *            3D 방 내부 아이템 들
	 */
	public void addItem(Item item) {
		this.itemSet.add(item);
	}

	/**
	 * 3D 방 내부 아이템 들 목록을 가져옵니다..
	 * 
	 * @return 3D 방 내부 아이템 들 목록
	 */
	public Set<Item> getItemSet() {
		return this.itemSet;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((itemTypeId == null) ? 0 : itemTypeId.hashCode());
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
		ItemType other = (ItemType) obj;
		if (itemTypeId == null) {
			if (other.itemTypeId != null) {
				return false;
			}
		} else if (!itemTypeId.equals(other.itemTypeId)) {
			return false;
		}
		return true;
	}

}
