package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.qnaModel.QnA;

public interface QnARepository extends JpaRepository<QnA, Integer>{
	
	@Query(value = "SELECT * FROM qna WHERE id = ?", nativeQuery = true)
	List<QnA> mFindById(int id);
	

	
	@Query(value = "SELECT * FROM qna WHERE title LIKE %?%" , nativeQuery = true)
	List<QnA> serachtitle(String searchtitle);
	
	@Query(value = "SELECT COUNT(*) AS qna FROM qna WHERE userId = ?", nativeQuery = true)
	Optional<Integer> qnaCount(int userId);
	
	Optional<List<QnA>> findByUserId(int userId);
	
}
