package com.oaga.oaga_v1.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.dto.RequestQnADto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAReply;
import com.oaga.oaga_v1.qnaModel.QnAType;
import com.oaga.oaga_v1.repository.QnAReplyRepository;
import com.oaga.oaga_v1.repository.QnARepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class QnAService {
	
	@Autowired
	private QnARepository qnARepository;
	
	@Autowired
	private QnAReplyRepository qnAReplyRepository;
	
//	@Autowired
//	private BCryptPasswordEncoder encoder;
	
// ===========================================================================	
	@Transactional
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
	@Transactional
	public List<QnA> qnaList(){
		return qnARepository.findAll();
	}
	
	
	// QnA detail 페이지
	@Transactional
	public List<QnA> qnaGetId(int id){
		return qnARepository.mFindById(id);
	}
	
	// QnA detail 삭제
	@Transactional
		public void qnaDelete(int id){
		qnARepository.deleteById(id);
		}
		
		
		
	// QnA 수정
	@Transactional
		public void qnaupdate(RequestQnADto dto, int id) {
			
			QnA qnaEntity = qnARepository.findById(id).orElseThrow(() ->{
				return new IllegalArgumentException("게시글을 찾을 수 없습니다.");
			});
			qnaEntity.setId(dto.getId());
			qnaEntity.setContent(dto.getContent());
			qnaEntity.setTitle(dto.getTitle());
			qnaEntity.getCreateDate();
			qnaEntity.getQnaType();
			qnaEntity.getUser();
			qnaEntity.getPassword();
			
		}
	// ===========================================================================
		// QnA 답글 시작
	
	public void qnaReplySave(QnAReply qnAReply,User user, int id){
		
		QnA qna = qnARepository.findById(id).orElseThrow(() ->{
			return new IllegalArgumentException("해당 글을 찾을 수 없습니다.");
		});
		
		System.out.println(qna);
		System.out.println(qna.getQnaType() +  "서비스");
		qna.setQnaType(QnAType.OK);
		qnAReply.setQna(qna);
		qnAReply.setUser(user);
		
		qnAReplyRepository.save(qnAReply);
	}
		
	
}
