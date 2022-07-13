package com.oaga.oaga_v1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.repository.ReviewRepository;
import com.oaga.oaga_v1.reviewModel.Review;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	// 리뷰 등록
	public void saveReview(Review review) {
		reviewRepository.save(review);
	}
	// 조회순으로 출력
	public Page<Review> getBestReviewList(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}
	
	// 베스트 리뷰어 출력	
		
	// 리뷰 출력
		
	// 최신순으로 출력
	
}
