package com.oaga.oaga_v1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAType;
import com.oaga.oaga_v1.repository.QnARepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class QnAService {
	
	@Autowired
	private QnARepository qnARepository;
	
	public void saveQnA(QnA qnA, User user) {
		qnA.setUser(user);
		qnA.setQnaType(QnAType.wait);
		qnARepository.save(qnA);
	}
	
	public List<QnA> qnaList(){
		return qnARepository.findAll();
	}
	
	
}
