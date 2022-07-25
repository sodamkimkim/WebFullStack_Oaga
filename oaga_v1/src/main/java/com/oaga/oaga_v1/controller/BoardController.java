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
import com.oaga.oaga_v1.service.UserService;
import com.oaga.oaga_v1.userModel.User;

@Controller // 페이지 리턴
public class BoardController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;

	@GetMapping({"/" , ""})
	public String index(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC) Pageable pageable,
			Model model) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		List<User> bestUser = userService.bestUser();
		model.addAttribute("reviews", reviews);
		model.addAttribute("bestUser", bestUser);
		return "index";
	}

}
