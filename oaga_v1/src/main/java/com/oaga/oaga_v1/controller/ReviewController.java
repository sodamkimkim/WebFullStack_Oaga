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

import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;

@Controller
public class ReviewController {

	private List<Review> list1;
	private List<Review> list2;
	
	@Autowired
	private ReviewService reviewService;

	// 베스트 순으로 6개, 베스트 리뷰어 5개
	@GetMapping("/review")
	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC)Pageable pageable, Model model) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		model.addAttribute("reviews", reviews);
//		List<Review> reviewList = reviews.getContent();
//		for(int i = 0; i < 3; i ++) {
//			list1.add(reviewList.get(i));
//		}
//		System.out.println(list1.get(1));
//		for(int i = 3; i < 6; i ++) {
//			list2.add(reviewList.get(i));
//		}
//		System.out.println(list2.get(1));
//		model.addAttribute("list1", list1);
//		model.addAttribute("list2", list2);
		return "/review/home";
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
