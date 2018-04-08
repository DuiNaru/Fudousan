package com.real.fudousan.item.dao;

import java.util.List;

import com.real.fudousan.item.vo.Item;

public interface ItemMapper {
	public int insert(Item item);
	public int insertRefSite(Item item);
	public List<Item> selectAll();
	public Item selectById(int itemId);
	public boolean update(Item item);
	public boolean deleteAllRefSite(int itemId);
	public boolean delete(int itemId);
	public List<Item> selectByName(String itemName);
	
}
