package com.real.fudousan.memeber.service;

import com.real.fudousan.memeber.dao.MemberDAO;

public class MemberService {
	
	private MemberDAO dao;

	public boolean login(String id, String pw) {
		if(dao.select(id, pw) == null) {
			return false;
		}
		return true;
	}
}
