package com.real.fudousan.item.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public String itemAddPage() {
		logger.info("itemAddPage Start");
		logger.info("itemAddPage End");
		return "/item/itemaddpage";
	}

	@RequestMapping(value="additem", method=RequestMethod.POST)
	public String addItem(Item item, int itemTypeId, MultipartHttpServletRequest files, String[] titles, String[] sites) {
		logger.info("addItem Start");
		
		item.setItemType(new ItemType(itemTypeId, null));
		Set<RefSite> refSiteSet = new HashSet<>();
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
		return "redirect:/admin/";
	}
	
	@RequestMapping(value="itemModifyPage", method=RequestMethod.GET)
	public String itemModifyPage(Model model, int itemId) {
		logger.info("itemModifyPage("+itemId+") Start");
		Item item = itemService.viewItem(itemId);
		model.addAttribute("item", item);
		model.addAttribute("files", itemService.viewFilesInItem(itemId));
		logger.info("itemModifyPage("+itemId+") End");
		return "/item/itemModifyPage";
	}

	@RequestMapping(value="moditem", method=RequestMethod.POST)
	public String modItem(Item item, int itemTypeId, MultipartHttpServletRequest files, String[] titles, String[] sites) {
		logger.info("modItem Start");
		
		item.setItemType(new ItemType(itemTypeId, null));
		Set<RefSite> refSiteSet = new HashSet<>();
		if (sites != null) {
			for (int i = 0; i < sites.length; i++) {
				refSiteSet.add(new RefSite(i, sites[i], null, titles[i], -1));
			}
			item.setRefSiteSet(refSiteSet);
		} else {
			logger.info("sites : " + null);
		}
		
		logger.debug("item : " + item);
		
		itemService.modifyItem(item, files.getFiles("files"));
		
		
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
}
