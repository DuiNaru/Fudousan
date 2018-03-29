package com.real.fudousan.favorite.controller;

import org.springframework.stereotype.Controller;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.real.fudousan.favorite.service.FavoriteService;
import com.real.fudousan.favorite.vo.Favorite;

@Controller
public class FavoriteController {
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);

	@Autowired
	private FavoriteService service;
	
	
	@RequestMapping(value="searchFavorite",method=RequestMethod.GET)
	public String saerchFavorite(Model model,int memberId, int favoSearch){
		List<Favorite> seacrhFavorite = null;
		seacrhFavorite = service.showSearchFavorite(memberId, favoSearch);
		model.addAttribute("fslist",seacrhFavorite);
		return "user/mypagecustomer";
	}
}
