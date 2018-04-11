package com.real.fudousan.entry.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.dao.EstateMapper;
import com.real.fudousan.estate.service.EstateService;
import com.real.fudousan.estate.vo.Estate;

@Repository
public class EntryDAOOracle implements EntryDAO {
	 private static final Logger logger = LoggerFactory.getLogger(EstateService.class);

	   @Autowired
	   private SqlSession session;
	   
	@Override
	public int insertEntry(Entry entry) {
		// TODO Auto-generated method stub
		 int result = 0;
	      
	      try{
	        
	         EntryMapper mapper= session.getMapper(EntryMapper.class);
	         result = mapper.insertEntry(entry);
	      }
	      catch(Exception e){
	         e.printStackTrace();
	      }
	      
	      return result;
		
		
	}
	//매물 삭제 
	  @Override
		public int deleteEntry(Entry entry){
		   int result = 0;
		      
		      try{
		         EntryMapper mapper = session.getMapper(EntryMapper.class);
		        // EntryMapper mapper2= session.getMapper(EntryMapper.class);
		         result = mapper.deleteEntry(entry);
		      }
		      catch(Exception e){
		         e.printStackTrace();
		      }
		      
		      return result;
		   }
	
}
