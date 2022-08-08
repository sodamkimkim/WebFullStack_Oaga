package com.oaga.oaga_v1.dto;

import com.oaga.oaga_v1.qnaModel.QnAReply;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestQnAReplyDto {
	private int id;
	private String content;
	
	public QnAReply toEntity(User user){
		return QnAReply.builder()
				.id(id)
				.content(content)
				.user(user)
				.build();
		
	}
}
