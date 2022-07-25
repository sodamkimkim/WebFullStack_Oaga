package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.reviewModel.IsWritingType;
import com.oaga.oaga_v1.reviewModel.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
//	@Query(value = "SELECT * FROM review ORDER BY count DESC LIMIT 6;")
//	List<Review> findByCountMax();

	@Query(value = "select count(*) from review group by userId having userId = ? ", nativeQuery = true)
	Optional<Integer> reviewCount(int userId);
	

	// mypage에서 userId로 자기가 작성한 리뷰조회하기
//	@Query(value = "select * from review where userId = ?;", nativeQuery = true)
//	Page<Review> findAllByUserId(Pageable pageable, int userId);
	
	// 임시저장 데이터 제외하고 가져오기
	@Query(value = "SELECT * FROM review WHERE isWriting = 'DONE' ", nativeQuery = true)
	Page<Review> findAllReview(Pageable pageable, String type);
	
	
	Page<Review> findByIsWriting(Pageable pageable, IsWritingType type);
	
	
	Page<Review> findByUserId(Pageable pageable, int userId);
	
	Page<Review> findByTitleContaining(Pageable pageable, String title);
	
	@Query(value = "SELECT * FROM review ORDER BY createDate DESC LIMIT 6 ", nativeQuery = true)
	List<Review> findByRecentCreateDate();

	@Query(value = "SELECT * FROM review WHERE userId = ? AND isWriting = 'ING' ", nativeQuery = true)
	Optional<Review> findisWriting(int userId);
	
}
