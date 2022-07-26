package com.oaga.oaga_v1.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.repository.ReplyRepository;
import com.oaga.oaga_v1.repository.ReviewRepository;
import com.oaga.oaga_v1.reviewModel.IsWritingType;
import com.oaga.oaga_v1.reviewModel.Reply;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.userModel.User;

@Service
public class ReviewService {

	@Value("${file.path}")
	private String uploadFolder;

	@Autowired
	private ReviewRepository reviewRepository;

	@Autowired
	private ReplyRepository replyRepository;

	// 확장자 추출
	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}

	// 리뷰 등록
	@Transactional
	public void saveReview(RequestReviewFileDto dto, User user) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder + newFileName);

		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			reviewRepository.save(dto.toEntity(newFileName, user));
		} catch (IOException e) {
			e.printStackTrace();
		}

//		reviewRepository.save(review);
	}

	// 리뷰 수정
	@Transactional
	public void updateReview(int reviewId, RequestReviewFileDto dto) {
		Review reviewEntity = reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		});
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		reviewEntity.setTitle(dto.getTitle());
		reviewEntity.setAreaName(dto.getAreaName());
		reviewEntity.setContent(dto.getContent());
		reviewEntity.setTheme(dto.getTheme());
		reviewEntity.setReviewImageUrl(newFileName);
		reviewEntity.setIsWriting(IsWritingType.DONE);
	}

	@Transactional
	public int reviewCount(int userId) {
		return reviewRepository.reviewCount(userId).orElse(0);
	}

	// 조회순으로 출력
	@Transactional
	public Page<Review> getBestReviewList(Pageable pageable) {
		System.out.println(IsWritingType.DONE.toString() + " <<<<<< ");
		return reviewRepository.findByIsWriting(pageable, IsWritingType.DONE);
	}

	// 베스트 리뷰어 출력

	// 리뷰 출력
	@Transactional
	public Review findReviewById(int id) {
		Review review = reviewRepository.findById(id).orElseThrow(() -> {
			return new IllegalArgumentException("해당글은 찾을 수 없습니다.");
		});
		review.setCount(review.getCount() + 1);
		return review;
	}

	// 최신순으로 출력
	@Transactional
	public List<Review> findReviewByData() {
		return reviewRepository.findByRecentCreateDate();
	}

	// 리뷰 삭제
	@Transactional
	public void deleteReviewById(int id) {
		reviewRepository.deleteById(id);
	}

	// 댓글 저장
	@Transactional
	public Reply saveReply(int reviewId, User user, Reply reply) {
		Review reviewEntity = reviewRepository.findById(reviewId).orElseThrow(() -> {
			return new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		});
		reply.setReview(reviewEntity);
		reply.setUser(user);
		Reply replyEntity = replyRepository.save(reply);
		return replyEntity;
	}

	// 댓글 삭제
	@Transactional
	public void deleteReply(int replyId) {
		replyRepository.deleteById(replyId);
	}

	@Transactional
	public Reply findByReplyId(int replyId) {
		return replyRepository.findById(replyId).orElseThrow(() -> {
			return new IllegalArgumentException("댓글을 찾을 수 없습니다.");
		});
	}

	// myPage에서 내 리뷰목록 조회
	public Page<Review> getMyReviews(Pageable pageable, int userId) {
		return reviewRepository.findByUserId(pageable, userId);
	}

	// 리뷰 전체 조회
	@Transactional
	public Page<Review> getAllReviews(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}

	// 리뷰 검색
	public Page<Review> searchReviewByTitle(Pageable pageable, String title) {
		return reviewRepository.findByTitleContaining(pageable, title);
	}

	// 임시저장 데이터
	public Review findIsWriting(int userId) {
		return reviewRepository.findisWriting(userId).orElse(null);
	}

}
