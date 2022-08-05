package com.oaga.oaga_v1.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.service.QnAService;

@RestController
public class QnAApiController {
	@Autowired
	private QnAService qnAService;
	
	
	@PostMapping("/api/qna/save")
	public ResponseDto<Integer> qnaSave(@AuthenticationPrincipal PrincipalDetail detail,@RequestBody QnA qna) {
		qnAService.saveQnA(qna,detail.getUser());
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	
	@DeleteMapping("/api/qna/delete/{id}")
	public ResponseDto<Integer> qnaDelete(@PathVariable int id){
		qnAService.qnaDelete(id);
		return new ResponseDto<>(HttpStatus.OK,1);
	}
}
