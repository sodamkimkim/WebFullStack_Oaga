package com.oaga.oaga_v1.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.qnaModel.QnAReply;

public interface QnAReplyRepository extends JpaRepository<QnAReply, Integer>{

	@Query(value = "SELECT * FROM qnareply WHERE id = ?", nativeQuery = true)
	List<QnAReply> mFindById(int id);
	
	@Query(value = "SELECT * FROM qnareply WHERE qnaid = ?", nativeQuery = true)
	Optional<List<QnAReply>> mfinByqnaId(int id);
	
	
}
