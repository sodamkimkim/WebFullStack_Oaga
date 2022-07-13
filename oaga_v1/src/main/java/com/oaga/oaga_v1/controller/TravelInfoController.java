package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.service.TravelInfoService;
@Controller
public class TravelInfoController {

	
			@Autowired
			TravelInfoService travelInfoService;
			// 메인 화면

			@GetMapping({"/travel_info"})
			public String index(@PageableDefault (size =4, sort ="areaId", direction = Direction.DESC) Model model,Pageable pageable) {
				List<AreaGu> seoulList = travelInfoService.seoul();
				model.addAttribute("seoulList", seoulList);
				
				List<AreaGu> busanList = travelInfoService.busan();
				model.addAttribute("busanList", busanList);
				
				List<AreaGu> jejuList = travelInfoService.jeju();
				model.addAttribute("jejuList", jejuList);
				
				List<AreaGu> deaguList = travelInfoService.deagu();
				model.addAttribute("deaguList", deaguList);
				
				List<AreaGu> inchunList = travelInfoService.inchun();
				model.addAttribute("inchunList", inchunList);
				return "/travelInfo/home";
			}
			
//			@GetMapping({"/travel_info/{areaid}"})
//			public String testindex(@PageableDefault (size =4, sort ="areaId", direction = Direction.DESC) 
//									Model model,Pageable pageable,@PathVariable int areaid) {
//				
//				Page<AreaGu> imageList = travelInfoService.areaImage(pageable, areaid);
//				System.out.println(imageList.getSize());
//				System.out.println("@@@@@@" + imageList.getContent().get(1).getGuname()  + "@@@@@@");
//				
//
//
//				model.addAttribute("imageList",imageList);
//				
//				return "/travelInfo/home";
//			}
			

			
			
			
			
			@GetMapping("/travel_randmark")
			public String travelinfo() {
				return "/travelInfo/randmark_form";
			}
			@GetMapping("/travel_datail")
			public String detail() {
				return "/travelInfo/detail_form";
			}
			
}
			