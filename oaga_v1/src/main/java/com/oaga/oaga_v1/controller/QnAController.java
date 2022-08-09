package com.oaga.oaga_v1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAReply;
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
		System.out.println(qnainfo + " QnA ID");
		model.addAttribute("qnainfo",qnainfo);
		return "qna/qnaupdate_form";
	}
	// 디테일 페이지
	@GetMapping("/qna/qnadetailform/{id}")
	public String qnaDetailForm(Model model,@PathVariable int id) {
		List<QnA> qnadetailList = qnAService.qnaGetId(id);
		List<QnAReply> replyList = qnAService.findreply(id);
		model.addAttribute("replyList",replyList);
		model.addAttribute("qnadetailList",qnadetailList);
		return "qna/qnadetail_form";
	}
	
	// replyUpdate 페이지
		@GetMapping("/qna/qnareplyupdateform/{id}")
		public String qnareplyUpdateForm(Model model, @PathVariable int id) {
			
			List<QnAReply> replyList = qnAService.qnaReplyId(id);
			model.addAttribute("replyupdate",replyList);
			System.out.println(replyList.get(0).getUser().getUserNickName() + "@@");
			return "qna/qnareplyupdate_form";
		}
	// 검색 후 페이지
	@GetMapping("/qna/search/{title}")
	public String searchQnA(Model model, @PathVariable String title) {
		List<QnA> searchQnaList = qnAService.qnasearch(title);
		System.out.println(searchQnaList + "??????");
		model.addAttribute("searchQnaList",searchQnaList);
		return "qna/search_form";
	}
	

	
}
