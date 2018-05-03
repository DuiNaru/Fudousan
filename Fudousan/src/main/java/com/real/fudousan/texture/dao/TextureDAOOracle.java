package com.real.fudousan.texture.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real.fudousan.texture.service.TextureService;
import com.real.fudousan.texture.vo.Texture;

@Repository
public class TextureDAOOracle implements TextureDAO{
	private static final Logger logger = LoggerFactory.getLogger(TextureService.class);
	
	
	@Autowired
	private SqlSession session;
	
	
	@Override
	public int textureuproad(Texture texture) {
		int result = 0;

		try {
			TextureMapper mapper = session.getMapper(TextureMapper.class);
			result = mapper.textureuproad(texture);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}


	@Override
	public List<Texture> selectAllTexture() {
		List<Texture> result = null;

		try {
			TextureMapper mapper = session.getMapper(TextureMapper.class);
			result = mapper.selectAllTexture();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public boolean delete(int textureId) {
		logger.info("delete("+textureId+") Start"); 
		boolean result = false;
		try {
			TextureMapper mapper = session.getMapper(TextureMapper.class);
			result = mapper.delete(textureId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("delete("+textureId+") End"); 
		return result;
	}


	@Override
	public Texture select(int textureId) {
		Texture result = null;

		try {
			TextureMapper mapper = session.getMapper(TextureMapper.class);
			result = mapper.selectTexture(textureId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
}
