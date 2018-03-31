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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.real.fudousan.advice.service.AdviceService;
import com.real.fudousan.agency.service.AgencyService;
import com.real.fudousan.agency.vo.Agency;
import com.real.fudousan.item.service.ItemService;
import com.real.fudousan.item.vo.Item;
import com.real.fudousan.item.vo.ItemType;
import com.real.fudousan.item.vo.RefSite;
import com.real.fudousan.member.service.MemberService;

@SessionAttributes("loginId")
@RequestMapping("interior")
@Controller
public class InteriorAgentController {
	private static final Logger logger = LoggerFactory.getLogger(InteriorAgentController.class);

	@Autowired
	private AdviceService adviceService;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String interiorPage(Model model) {
		logger.info("interiorPage() Start");
		// TODO 로그인 완료 되면 파라미터로 받아서 사용할 것
		int id = 1;
		model.addAttribute("adviceList", adviceService.getRequestedList(id));
		logger.info("interiorPage() End");
		return "interior/interiorPage";
	}
}
