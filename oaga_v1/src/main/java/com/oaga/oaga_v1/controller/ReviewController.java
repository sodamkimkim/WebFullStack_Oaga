package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.oaga.oaga_v1.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	// 베스트 순으로 6개, 베스트 리뷰어 5개
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
