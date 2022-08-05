package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.RequestQnADto;
import com.oaga.oaga_v1.dto.ResponseDto;
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
		
		return "qna/qnawrite_form";
	}
	
	// update 페이지
	@GetMapping("/qna/qnaupdateform/{id}")
	public String qnaupdateForm(Model model,@PathVariable int id) {
		List<QnA> qnainfo = qnAService.qnaGetId(id);
		model.addAttribute("qnainfo",qnainfo);
		return "qna/qnaupdate_form";
	}
	
	@GetMapping("/qna/qnadetailform/{id}")
	public String qnaDetailForm(Model model,@PathVariable int id) {
		List<QnA> qnadetailList = qnAService.qnaGetId(id);
		model.addAttribute("qnadetailList",qnadetailList);
		return "qna/qnadetail_form";
	}
	
	
	@PostMapping("api/QnA/update/{id}")
	public String qnaUpdate(@PathVariable int id, RequestQnADto dto) {
		System.out.println(dto + "아이디아이디");
		qnAService.qnaupdate(dto, id);
		return "redirect:/qna/qna_home";
	}
	

}
