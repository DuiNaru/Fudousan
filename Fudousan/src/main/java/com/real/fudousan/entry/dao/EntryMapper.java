package com.real.fudousan.entry.dao;

import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.vo.Estate;

public interface EntryMapper {
	//등록
	public int insertEntry(Entry entry);
	
	//삭제
	public int deleteEntry(Entry entry);
}
