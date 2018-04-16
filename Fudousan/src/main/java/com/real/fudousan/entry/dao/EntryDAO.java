package com.real.fudousan.entry.dao;

import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.vo.Estate;


public interface EntryDAO {
	
	
	public int insertEntry(Entry entry);
	
	public int deleteEntry(Entry entry);
	
	public int modifyEstatePage(Entry entry);
	
}
