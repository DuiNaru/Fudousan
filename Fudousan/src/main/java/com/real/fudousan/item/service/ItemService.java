package com.real.fudousan.item.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.real.fudousan.common.util.FileService;
import com.real.fudousan.item.dao.ItemDAO;
import com.real.fudousan.item.vo.Item;

@Service
public class ItemService {
	private static final Logger logger = LoggerFactory.getLogger(ItemService.class);
	
	private static final String modelFileBaseDirectory = "/model/";
	
	@Autowired
	private ItemDAO itemDao;
	
	/**
	 * 아이템을 추가한다.
	 * @param item
	 * @param files 파일이 있으면 함께 저장한다.
	 * @return 추가한 아이템 ID, 실패시 -1
	 */
	@Transactional
	public int addItem(Item item, List<MultipartFile> files) {
		logger.info("addItem(" + item + ", " + files +  ") Start");
		int result = -1;
		if((result = itemDao.insert(item)) >= 0 && files != null) {
			logger.info("DAO insert -> item ID : " + result);
			for(MultipartFile file : files) {
				FileService.saveFile(file, modelFileBaseDirectory + result, true);
			}
		}
		logger.info("addItem(" + item + ", " + files +  ") End");
		return result;
	}
	
	/**
	 * 아이템을 수정한다.
	 * @param item
	 * @return
	 */
	public boolean modifyItem(Item item) {
		
		return false;
	}
	
	/**
	 * 아이템을 삭제한다.
	 * @param itme
	 * @return
	 */
	public boolean deleteItem(Item itme) {
		
		return false;
	}
	
	/**
	 * 아이템 상세 보기
	 * @param itemId
	 * @return
	 */
	public Item viewItem(int itemId) {
		
		return null;
	}
	
	public List<Item> allList() {
		logger.info("allList() Start");
		List<Item> result = null;
		result = itemDao.selectAll();
		
		logger.info("allList() end");
		return result;
	}
}
