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
	
	public List<QnA> qnaList(){
		return qnARepository.findAll();
	}
	
	
}
