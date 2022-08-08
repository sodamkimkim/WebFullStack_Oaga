package com.oaga.oaga_v1.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.oaga.oaga_v1.auth.PrincipalDetail;
import com.oaga.oaga_v1.dto.RequestQnADto;
import com.oaga.oaga_v1.dto.RequestQnAReplyDto;
import com.oaga.oaga_v1.dto.ResponseDto;
import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAReply;
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
	@PostMapping("api/QnA/update/{id}")
	public ResponseDto<Integer> qnaUpdate(@PathVariable int id,@RequestBody RequestQnADto dto) {
		qnAService.qnaupdate(dto, id);
		
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	@PostMapping("/api/QnAreply/save/{id}")
	public ResponseDto<QnAReply> relplysave(@AuthenticationPrincipal PrincipalDetail detail, @RequestBody QnAReply qnAReply,@PathVariable int id){
		QnAReply qnaReplyId = qnAService.qnaReplySave(qnAReply, detail.getUser(),id);
		return new ResponseDto<>(HttpStatus.OK, qnaReplyId);
	}
	
	@GetMapping("/api/replyId/{id}")
	public ResponseDto<List<QnAReply>> replyId(Model model, @PathVariable int id) {
		List<QnAReply> qnAReply = qnAService.qnaReplyId(id);
		System.out.println(qnAReply + " qnAReplyqnAReply@");
		model.addAttribute("qnAReply",qnAReply);
		return new ResponseDto<>(HttpStatus.OK,qnAReply);
	}
	
	
	@DeleteMapping("api/qna/reply/delete/{id}")
	public ResponseDto<Integer> replyDelete(@PathVariable int id){
		qnAService.replydelete(id);
		
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	@PostMapping("api/QnA/reply/update/{id}")
	public ResponseDto<Integer> replyUpdate(@PathVariable int id,@RequestBody RequestQnAReplyDto dto){
		qnAService.qnareplyupdate(dto, id);
		return new ResponseDto<>(HttpStatus.OK,1);
	}
	
	
	
	
	
}
