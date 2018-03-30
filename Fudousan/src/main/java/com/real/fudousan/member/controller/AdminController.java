package com.real.fudousan.member.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.real.fudousan.agency.service.AgencyService;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.item.service.ItemService;
import com.real.fudousan.item.vo.Item;
import com.real.fudousan.item.vo.ItemType;
import com.real.fudousan.item.vo.RefSite;
import com.real.fudousan.member.service.MemberService;

@SessionAttributes("loginId")
@RequestMapping("admin")
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AgencyService agencyService;
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String adminpage(Model model) {
		logger.info("adminpage() Start");
		
		// 공인 중개사 가입 신청 현황
		List<Agency> agencyList = agencyService.unConfirmedList();
		model.addAttribute("agencylist", agencyList);
		
		// 아이템 정보 관리
		List<Item> itemList = itemService.allList();
		model.addAttribute("itemList", itemList);
		
		logger.info("adminpage() End");
		return "admin/adminPage";
	}
	
	@RequestMapping(value="/confirm", method=RequestMethod.GET)
	public String confirm(int agencyId) {
		logger.info("confirm(" + agencyId + ") Start");
		
		if(!agencyService.confirm(agencyId)) {
			logger.info("confirm false");
		}
		
		logger.info("confirm(" + agencyId +") End");
		return "redirect:/admin/";
	}
	
	@RequestMapping(value="itemAddPage", method=RequestMethod.GET)
	public String itemAddPage() {
		logger.info("itemAddPage Start");
		logger.info("itemAddPage End");
		return "/admin/itemaddpage";
	}

	@RequestMapping(value="additem", method=RequestMethod.POST)
	public String additem(Item item, int itemTypeId, MultipartHttpServletRequest files, String[] sites) {
		logger.info("additem Start");
		
		item.setItemType(new ItemType(itemTypeId, null));
		Set<RefSite> refSiteSet = new HashSet<>();
		if (sites != null) {
			for (String site : sites) {
				refSiteSet.add(new RefSite(-1, site, null, null));
			}
			item.setRefSiteSet(refSiteSet);
		} else {
			logger.info("sites : " + null);
		}
		
		logger.debug("item : " + item);
		
		itemService.addItem(item, files.getFiles("files"));
		
		
		logger.info("additem End");
		return "redirect:/admin/";
	}
}
