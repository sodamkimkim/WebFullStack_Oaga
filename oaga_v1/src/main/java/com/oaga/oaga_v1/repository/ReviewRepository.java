package com.oaga.oaga_v1.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.Nullable;

import com.oaga.oaga_v1.reviewModel.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{
	
//	@Query(value = "SELECT * FROM review ORDER BY count DESC LIMIT 6;")
//	List<Review> findByCountMax();

	@Query(value = "select count(*) from review group by userId having userId = ?;", nativeQuery = true)
	Optional<Integer> reviewCount(int userId);
	
	

}
