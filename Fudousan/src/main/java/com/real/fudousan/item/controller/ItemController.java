package com.real.fudousan.item.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.real.fudousan.common.util.FileService;
import com.real.fudousan.item.service.ItemService;
import com.real.fudousan.item.vo.Item;
import com.real.fudousan.item.vo.ItemType;
import com.real.fudousan.item.vo.RefSite;

@RequestMapping(value="item")
@Controller
public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value="itemAddPage", method=RequestMethod.GET)
	public String itemAddPage(Model model) {
		logger.info("itemAddPage Start");
		
		model.addAttribute("itemTypeList", itemService.getItemTypeList());
		
		logger.info("itemAddPage End");
		return "/item/itemaddpage";
	}

	@RequestMapping(value="additem", method=RequestMethod.POST)
	public String addItem(Item item, int itemTypeId, MultipartHttpServletRequest files, String[] titles, String[] sites, HttpServletRequest request) {
		logger.info("addItem Start");
		
		String root_path = request.getSession().getServletContext().getRealPath("/");  
		logger.debug("root_path" + root_path);
		
		item.setItemType(new ItemType(itemTypeId, null));
		List<RefSite> refSiteSet = new ArrayList<>();
		if (sites != null) {
			for (int i = 0; i < sites.length; i++) {
				refSiteSet.add(new RefSite(i, sites[i], null, titles[i], -1));
			}
			item.setRefSiteSet(refSiteSet);
		} else {
			logger.info("sites : " + null);
		}
		
		logger.debug("item : " + item);
		
		itemService.addItem(item, files.getFiles("files"));
		
		
		logger.info("addItem End");
		return "redirect:/item/itemModifyPage?itemId="+item.getItemId();
	}
	
	@RequestMapping(value="itemModifyPage", method=RequestMethod.GET)
	public String itemModifyPage(Model model, int itemId) {
		logger.info("itemModifyPage("+itemId+") Start");
		Item item = itemService.viewItem(itemId);
		model.addAttribute("item", item);
		model.addAttribute("files", itemService.viewFilesInItem(itemId));
		model.addAttribute("itemTypeList", itemService.getItemTypeList());
		logger.info("itemModifyPage("+itemId+") End");
		return "/item/itemModifyPage";
	}

	@RequestMapping(value="moditem", method=RequestMethod.POST)
	public String modItem(Item item, int itemTypeId, String[] titles, String[] sites) {
		logger.info("modItem Start");
		
		item.setItemType(new ItemType(itemTypeId, null));
		List<RefSite> refSiteSet = new ArrayList<>();
		if (sites != null) {
			for (int i = 0; i < sites.length; i++) {
				refSiteSet.add(new RefSite(i, sites[i], null, titles[i], -1));
			}
			item.setRefSiteSet(refSiteSet);
		} else {
			logger.info("sites : " + null);
		}
		
		logger.debug("item : " + item);
		
		itemService.modifyItem(item);
		
		
		logger.info("modItem End");
		return "redirect:/admin/";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteItem", method=RequestMethod.GET)
	public boolean deleteItem(int itemId) {
		logger.info("deleteItem("+itemId+") Start");
		boolean result = itemService.deleteItem(itemId);
		logger.info("deleteItem("+itemId+") End " + result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="searchItem", method=RequestMethod.GET)
	public List<Item> searchItem(String itemName) {
		logger.info("searchItem("+itemName+") Start");
		List<Item> result = itemService.searchName(itemName);
		logger.info("searchItem("+itemName+") End");
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="getGagu", method=RequestMethod.GET)
	public Item getGagu(Model model, int itemId) {
		logger.info("getGagu("+itemId+") Start");
		Item result = itemService.viewItem(itemId);
		model.addAttribute("gagu", result);
		logger.info("getGagu("+itemId+") End");
		return result;
	}
	
	@RequestMapping(value = "/{file_path}/{file_name}.{file_ext}", method = RequestMethod.GET)
	public void getFile(
			@PathVariable("file_path") String filePath, 
			@PathVariable("file_name") String fileName, 
			@PathVariable("file_ext") String fileExt, 
			HttpServletResponse response) {
		
		logger.info("getFile({}, {}) Start", filePath, fileName+"."+fileExt);
		try {
			itemService.downloadFile(filePath, fileName+"."+fileExt, response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.info("getFile({}, {}) end", filePath, fileName+"."+fileExt);
		
	}
}
