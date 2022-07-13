package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.service.TravelInfoService;

@Controller
public class TravelInfoController {

	@Autowired
	TravelInfoService travelInfoService;

	// 메인 화면
	@GetMapping("/travel_info_form")
	public String index(@PageableDefault(size = 4, sort = "id", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<Area> imagePage = travelInfoService.getImageList(pageable);
		model.addAttribute("imagePageList", imagePage);
		return "/travelInfo/travel_info_form";

	}
}
