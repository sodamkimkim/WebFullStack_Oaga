package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
	
	@GetMapping("/review")
	public String reviewHome() {
		return"/review/home";
	}
	
	@GetMapping("/write")
	public String reviewWrite() {
		return "/review/write";
	}
	
	@GetMapping("/list")
	public String reviewList() {
		return "/review/list";
	}
	
}
