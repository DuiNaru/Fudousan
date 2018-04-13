package com.real.fudousan.roomitem.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.member.dao.MemberMapper;
import com.real.fudousan.member.vo.Member;
import com.real.fudousan.roomitem.vo.RoomItem;

@Repository
public class RoomItemDAOOracle implements RoomItemDAO {
	private static final Logger logger = LoggerFactory.getLogger(RoomItemDAOOracle.class);
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(RoomItem roomItem) {
		RoomItemMapper roomItemMapper = sqlSession.getMapper(RoomItemMapper.class);
		
		int result = -1;
		
		try {
			result = roomItemMapper.insert(roomItem);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}

}
