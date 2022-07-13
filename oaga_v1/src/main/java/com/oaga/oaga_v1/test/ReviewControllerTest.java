package com.oaga.oaga_v1.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;

@RestController
public class ReviewControllerTest {
	
	@Autowired
	private ReviewService reviewService;
	
	@GetMapping("/review/test")
	public Page<Review> reviewHome(@PageableDefault(size = 6, sort = "count", direction = Direction.DESC)Pageable pageable) {
		Page<Review> reviews = reviewService.getBestReviewList(pageable);
		System.out.println("리뷰 페이저" + reviews.getContent());
		return reviews;
	}


}
