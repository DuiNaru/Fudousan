package com.real.fudousan.item.dao;

import java.util.List;

import com.real.fudousan.item.vo.Item;

public interface ItemDAO {
	public int insert(Item item);
	public List<Item> selectAll();
}
