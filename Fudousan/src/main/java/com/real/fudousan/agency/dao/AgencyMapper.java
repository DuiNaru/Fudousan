package com.real.fudousan.agency.dao;

import java.util.List;

import com.real.fudousan.agency.vo.Agency;

public interface AgencyMapper {
	public List<Agency> selectByConfirmed(int confirm);
	public boolean updateConfirm(int agencyId, int confirm);
}