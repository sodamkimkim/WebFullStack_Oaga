package com.oaga.oaga_v1.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.reviewModel.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
//	@Query(value = "SELECT * FROM review ORDER BY count DESC LIMIT 6;")
//	List<Review> findByCountMax();

	@Query(value = "select count(*) from review group by userId having userId = ?;", nativeQuery = true)
	int reviewCount(int userId);
	


}
