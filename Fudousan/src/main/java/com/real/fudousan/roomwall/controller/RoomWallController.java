package com.real.fudousan.roomwall.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

@RequestMapping("wall")
@Controller
public class RoomWallController {
	private static final Logger logger = LoggerFactory.getLogger(RoomWallController.class);

	@RequestMapping(value="wallPage", method=RequestMethod.GET)
	public String roomPage() {
		logger.info("wallPage() Start");
		logger.info("wallPage() End");
		return "wall/wallPage";
	}
}
