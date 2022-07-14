package com.oaga.oaga_v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.reviewModel.IsWritingType;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	// 베스트 순으로 6개, 베스트 리뷰어 5개
	@GetMapping("/review")
	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		model.addAttribute("reviews", reviews);
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
	
	@GetMapping("/detail")
	public String reviewDetail() {
		return "/review/detail";
	}

	// 리뷰 등록
	@PostMapping("/api/review/upload")
	private String saveReview(RequestReviewFileDto dto) {
		dto.setIsWriting(IsWritingType.DONE);
		reviewService.saveReview(dto);
		return "redirect:/review";
	}
	
	// 리뷰 임시 저장
	@PostMapping("/api/review/upload/t")
	private String saveReviewtem(RequestReviewFileDto dto) {
		System.out.println(dto);
		dto.setIsWriting(IsWritingType.ING);
		reviewService.saveReview(dto);
		return "redirect:/review";
	}

}
