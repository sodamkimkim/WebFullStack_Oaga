package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.reviewModel.IsWritingType;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;

	// 로그인 되어있지 않은 경우 - 리뷰 홈
	@GetMapping("/review")
	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		List<User> bestUser = userService.bestUser();
		System.out.println(bestUser);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("bestUser", bestUser);
		return "/review/home";
	}
	// 로그인 한 경우 - 리뷰 홈
	@GetMapping("/mreview")
	public String reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
			Model model, @AuthenticationPrincipal PrincipalDetail detail) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		
		int reviewCount = reviewService.reviewCount(detail.getUser().getId());
		List<User> bestUser = userService.bestUser();
		System.out.println(bestUser);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("bestUser", bestUser);
		return "/review/home";
	}
	
	
	// 리뷰 작성 페이지
	@GetMapping("/write")
	public String reviewWrite() {
		return "/review/write";
	}

	// 사용자의 리뷰 리스트 보는 화면
	@GetMapping("/userPage")
	public String reviewList() {
		return "/review/userPage";
	}
	
	// 리뷰 상세보기
	@GetMapping("/detail/{id}")
	public String reviewDetail(@PathVariable int id, Model model) {
		Review review = reviewService.findReviewById(id);
		model.addAttribute("review", review);
		return "/review/detail";
	}

	// 리뷰 등록
	@PostMapping("/api/review/upload")
	private String saveReview(RequestReviewFileDto dto, @AuthenticationPrincipal PrincipalDetail detail) {
		dto.setIsWriting(IsWritingType.DONE);
		reviewService.saveReview(dto, detail.getUser());
		return "redirect:/review";
	}
	
	// 리뷰 임시 저장
	@PostMapping("/api/review/upload/t")
	private String saveReviewtem(RequestReviewFileDto dto, @AuthenticationPrincipal PrincipalDetail detail) {
		System.out.println(dto);
		dto.setIsWriting(IsWritingType.ING);
		reviewService.saveReview(dto, detail.getUser());
		return "redirect:/review";
	}
	


}
