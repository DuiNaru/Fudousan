package com.real.fudousan.roomwall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.real.fudousan.roomwall.service.RoomWallService;
import com.real.fudousan.roomwall.vo.RoomWall;
import com.real.fudousan.roomwall.vo.RoomWallConnector;

@RequestMapping("wall")
@Controller
public class RoomWallController {
	private static final Logger logger = LoggerFactory.getLogger(RoomWallController.class);
	
	@Autowired
	private RoomWallService service;

	@RequestMapping(value="wallPage", method=RequestMethod.GET)
	public String roomPage() {
		logger.info("wallPage() Start");
		logger.info("wallPage() End");
		return "wall/wallPage";
	}
	
	@ResponseBody
	@RequestMapping(value="save", method=RequestMethod.POST)
	public boolean save(
			String walls,
			String dots) {
		logger.info("save() Start");
		boolean result = false;
		logger.debug("walls : "+ walls);
		logger.debug("dots : "+ dots);
		
		Map<Integer, RoomWallConnector> roomWallConnectorMap = new HashMap<>();
		List<RoomWall> roomWallList = new ArrayList<>();
		ObjectMapper mapper = new ObjectMapper();
		try {
			JsonNode dotsRoot = mapper.readTree(dots);
			Iterator<JsonNode> dotsElements = dotsRoot.elements();
			while(dotsElements.hasNext()) {
				JsonNode element = dotsElements.next();
				roomWallConnectorMap.put(element.get("connectorId").asInt(), new RoomWallConnector(element.get("connectorId").asInt(), element.get("x").asDouble(), element.get("y").asDouble()));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		try {
			JsonNode wallsRoot = mapper.readTree(walls);
			Iterator<JsonNode> wallsElements = wallsRoot.elements();
			while(wallsElements.hasNext()) {
				JsonNode element = wallsElements.next();
				RoomWall rw = new RoomWall();
				rw.setRoomWallConnector1(roomWallConnectorMap.get(element.get("startPoint").asInt()));
				rw.setRoomWallConnector2(roomWallConnectorMap.get(element.get("endPoint").asInt()));
				roomWallList.add(rw);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		logger.debug("roomWallConnectorMap : " + roomWallConnectorMap.toString());
		logger.debug("roomWallList : " + roomWallList.toString());
		result = service.save(roomWallList, roomWallConnectorMap);
		logger.info("save() End");
		return result;
	}
}
