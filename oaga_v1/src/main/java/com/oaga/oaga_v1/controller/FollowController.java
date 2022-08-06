package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FollowController {
	
	@GetMapping("/mytraveler")
	private String myTraveler() {
		// 이번 달 좋아요 많이 받은 순서대로 조회
		
		// 내가 좋아요한 회원 조회
		
		return "mytraveler";
	}
	

}
