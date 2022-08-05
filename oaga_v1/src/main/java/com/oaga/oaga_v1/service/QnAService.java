package com.oaga.oaga_v1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.dto.RequestQnADto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAType;
import com.oaga.oaga_v1.repository.QnARepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class QnAService {
	
	@Autowired
	private QnARepository qnARepository;
//	@Autowired
//	private BCryptPasswordEncoder encoder;
	
	public void saveQnA(QnA qna, User user) {
//		보류
//		String rawPassword = qna.getPassword();
//		String encPassword = encoder.encode(rawPassword);
//		qna.setPassword(encPassword);
		qna.setUser(user);
		qna.setQnaType(QnAType.wait);
		qnARepository.save(qna);
	}
	
	// QnA 페이지에 리스트 뿌리기
	public List<QnA> qnaList(){
		return qnARepository.findAll();
	}
	
	
	// QnA detail 페이지
	public List<QnA> qnaGetId(int id){
		return qnARepository.mFindById(id);
	}
	
	// QnA detail 삭제
		public void qnaDelete(int id){
		qnARepository.deleteById(id);
		}
		
		
		
	// QnA 수정
		public void qnaupdate(RequestQnADto dto, int id) {
			QnA qnaEntity = qnARepository.findById(id).orElseThrow(() ->{
				return new IllegalArgumentException("게시글을 찾을 수 없습니다.");
			});
			qnaEntity.getId();
			qnaEntity.setContent(dto.getContent());
			qnaEntity.setTitle(dto.getTitle());
			qnaEntity.getCreateDate();
			qnaEntity.getQnaType();
			qnaEntity.getUser();
			qnaEntity.getPassword();
			
		}
		
		
		
	
}
