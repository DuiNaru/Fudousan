package com.real.fudousan.item.service;

import java.io.File;
import java.io.OutputStream;
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
		item.setFileDirectory(modelFileBaseDirectory);
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
	 * @param files 파일이 있으면 함께 수정한다.
	 * @return
	 */
	public boolean modifyItem(Item item, List<MultipartFile> files) {
		logger.info("modifyItem(" + item + ", " + files +  ") Start");
		boolean result = false;
		if((result = itemDao.update(item)) && files != null) {
			logger.info("DAO update -> " + result);
			FileService.deleteDirectory(modelFileBaseDirectory + item.getItemId());
			for(MultipartFile file : files) {
				FileService.saveFile(file, modelFileBaseDirectory + item.getItemId(), true);
			}
		}
		logger.info("modifyItem(" + item + ", " + files +  ") End");
		return result;
	}
	
	/**
	 * 아이템을 삭제한다.
	 * @param itemId
	 * @return
	 */
	public boolean deleteItem(int itemId) {
		logger.info("deleteItem("+itemId+") Start");
		boolean result = false;
		
		if((result = itemDao.delete(itemId))) {
			logger.info("DAO delete -> " + result);
			FileService.deleteDirectory(modelFileBaseDirectory + itemId);
		}
		logger.info("deleteItem("+itemId+") end");
		return result;
	}
	
	/**
	 * 아이템 상세 보기
	 * @param itemId
	 * @return
	 */
	public Item viewItem(int itemId) {
		logger.info("allList() Start");
		Item result = null;
		result = itemDao.select(itemId);
		
		logger.info("allList() end");
		return result;
	}
	
	/**
	 * 모든 아이템 리스트
	 * @return
	 */
	public List<Item> allList() {
		logger.info("allList() Start");
		List<Item> result = null;
		result = itemDao.selectAll();
		
		logger.info("allList() end");
		return result;
	}
	
	/**
	 * 아이템 이름 포함 검색
	 * @param itemName
	 * @return
	 */
	public List<Item> searchName(String itemName) {
		logger.info("allList() Start");
		List<Item> result = null;
		result = itemDao.selectByName(itemName);
		
		logger.info("allList() end");
		return result;
	}
	
	public File[] viewFilesInItem(int itemId) {
		logger.info("viewFilesInItem("+itemId+") Start");
		File[] result = FileService.getFilesInDirectory(modelFileBaseDirectory + itemId);
		
		logger.info("viewFilesInItem("+itemId+") end");
		return result;
	}
	
	public boolean downloadFile(String filePath, String fileName, OutputStream os) {
		logger.info("downloadFile({}, {}) Start", filePath, fileName);
		boolean result = false;
		FileService.writeFile(modelFileBaseDirectory + filePath + "/" + fileName, os);
		logger.info("downloadFile({}, {}) End", filePath, fileName);
		return result;
	}
	

	
	
}
