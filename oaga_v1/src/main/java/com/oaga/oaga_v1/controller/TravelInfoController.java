package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.service.TravelInfoService;
@Controller
public class TravelInfoController {

	
			@Autowired
			TravelInfoService travelInfoService;
			// 메인 화면

			@GetMapping({"/travel_info"})
			public String index(@PageableDefault (size =4, sort ="id", direction = Direction.DESC) Model model,Pageable pageable) {
				Page<AreaGu> imageList = travelInfoService.getImageList(pageable);
				model.addAttribute("imageList",imageList);
				System.out.println("imageList imageList" + imageList);
				return "/travelInfo/home";

			}
			
//			@GetMapping("/travel_randmark")
//			public String travelinfo() {
//				return "/travelInfo/randmark_form";
//			}
//			@GetMapping("/travel_datail")
//			public String detail() {
//				return "/travelInfo/detail_form";
//			}
			
}
			