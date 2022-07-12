package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.oaga.oaga_v1.service.TravelInfoService;
@Controller
public class TravelInfoController {

	
			@Autowired
			TravelInfoService travelInfoService;
			// 메인 화면
			@GetMapping({"/travel_info","/area_list/{id}"})
			public String index(Model model, @PathVariable int areaid) {
				model.addAttribute("imagePageList",travelInfoService.getImageList(areaid));
				System.out.println("@@@@@"+ travelInfoService.getImageList(areaid).get(1).getGuname() + "@@@@@");
				return "/travelInfo/home";

			}
//			@GetMapping({"/travel_info"})
//			public String index(@PageableDefault (size =4, sort ="id", direction = Direction.DESC) Model model,Pageable pageable) {
//				Page<AreaGu> imageList = travelInfoService.getImageList(pageable);
//				model.addAttribute("imageList",imageList);
//				System.out.println("imageList imageList" + imageList);
//				return "/travelInfo/home";
//
//			}
			
//			@GetMapping("/travel_randmark")
//			public String travelinfo() {
//				return "/travelInfo/randmark_form";
//			}
//			@GetMapping("/travel_datail")
//			public String detail() {
//				return "/travelInfo/detail_form";
//			}
			
}
			