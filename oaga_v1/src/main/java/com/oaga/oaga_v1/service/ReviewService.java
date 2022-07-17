package com.oaga.oaga_v1.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.repository.ReviewRepository;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.userModel.User;

@Service
public class ReviewService {
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	// 확장자 추출
	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}
	
	// 리뷰 등록
	public void saveReview(RequestReviewFileDto dto, User user) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder +  newFileName);
		
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			reviewRepository.save(dto.toEntity(newFileName, user));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		reviewRepository.save(review);
	}
	
	public int reviewCount(int userId) {
		return reviewRepository.reviewCount(userId).orElse(0);
	}
	
	// 조회순으로 출력
	public Page<Review> getBestReviewList(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}
	
	// 베스트 리뷰어 출력	
		
	// 리뷰 출력
		
	// 최신순으로 출력
	
}
