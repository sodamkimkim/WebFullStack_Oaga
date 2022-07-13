package com.oaga.oaga_v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.service.ReviewService;

@RestController
public class ReviewApiController {
	
	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 등록
	@PostMapping("/api/review")
	private ResponseDto<Integer> saveReview(@RequestBody Review review) {
		reviewService.saveReview(review);
		return new ResponseDto<Integer>(HttpStatus.OK, 1);
	}
		
	
	// 리뷰 출력
	
	// 최신순으로 출력
	

	
	

}
