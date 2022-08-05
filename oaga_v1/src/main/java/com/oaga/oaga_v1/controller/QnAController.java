package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.RequestQnADto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.service.QnAService;

@Controller
public class QnAController {
	
	@Autowired
	private QnAService qnAService;

	@GetMapping("/qna/qna_home")
	public String qnaForm(Model model) {
		
		List<QnA> qnaList = qnAService.qnaList();
		model.addAttribute("qnaList",qnaList);
		
		
		return "qna/qnahome";
	}
	@GetMapping("/qna/qnawriteform")
	public String qnawriteForm() {
		System.out.println("??");
		return "qna/qnawrite_form";
	}
	@GetMapping("/qna/qnadetailform")
	public String qnaDetailForm() {
		return "qna/qnadetail_form";
	}
	
	

}
