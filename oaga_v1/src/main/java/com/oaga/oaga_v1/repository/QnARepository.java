package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.qnaModel.QnA;

public interface QnARepository extends JpaRepository<QnA, Integer>{
	
	@Query(value = "SELECT * FROM qna WHERE id = ?", nativeQuery = true)
	List<QnA> mFindById(int id);

}