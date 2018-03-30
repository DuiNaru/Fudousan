package com.real.fudousan.item.dao;

import java.util.List;

import com.real.fudousan.item.vo.Item;

public interface ItemMapper {
	public int insert(Item item);
	public List<Item> selectAll();
}
