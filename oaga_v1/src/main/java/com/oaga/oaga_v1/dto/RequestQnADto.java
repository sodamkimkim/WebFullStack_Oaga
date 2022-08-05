package com.oaga.oaga_v1.dto;

import com.oaga.oaga_v1.qnaModel.QnA;
import com.oaga.oaga_v1.qnaModel.QnAType;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestQnADto {
	
	private String title;
	private String content;

	
	public QnA toEntity(User user) {
		return QnA.builder()
				.title(title)
				.content(content)
				.user(user)
				.build();
	}

}
