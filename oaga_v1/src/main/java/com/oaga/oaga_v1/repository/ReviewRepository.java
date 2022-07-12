package com.oaga.oaga_v1.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oaga.oaga_v1.reviewModel.Review;

public interface ReviewRepository extends JpaRepository<Review, Integer>{

}
