package com.real.fudousan.advice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.advice.vo.Advice;
import com.real.fudousan.room.dao.RoomDAOOracle;

@Repository
public class AdviceDAOOracle implements AdviceDAO {

	private static final Logger logger = LoggerFactory.getLogger(RoomDAOOracle.class);
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Advice> normalUserHelpCall(int id) {
		logger.info("Ad_DAOORACLE에서 normalUserHelpCall-Start");
		AdviceMapper mapper = sqlsession.getMapper(AdviceMapper.class);
		List<Advice> helpCall = null;
		try{
			helpCall = mapper.normalUserHelpCall(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Ad_DAOORACLE에서 normalUserHelpCall-End");
		return helpCall;
	}

	@Override
	public List<Advice> reverseCall(int id) {
		logger.info("Advice_DAOORACLE_역요청 받기 Start");
		AdviceMapper mapper = sqlsession.getMapper(AdviceMapper.class);
		List<Advice> reverseCall = null;
		try{
			reverseCall = mapper.reverseCall(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Advice_DAOORACLE_역요청 받기 End");
		return reverseCall;
	}

}
