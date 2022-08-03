package com.oaga.oaga_v1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnAController {

	@GetMapping("/qna/qna_home")
	public String qnaForm() {
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
