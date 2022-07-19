package com.oaga.oaga_v1.dto;

import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.reviewModel.IsWritingType;
import com.oaga.oaga_v1.reviewModel.Review;
import com.oaga.oaga_v1.reviewModel.ThemeType;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequestReviewFileDto {
	private MultipartFile file;
	private String uuid;
	private String title;
	private String content;
	private User user;
	private IsWritingType isWriting;
	private String areaName;
	private ThemeType theme;
	private int count;
	public Review toEntity(String reviewImageUrl, User user) {
		return Review.builder()
				.title(title)
				.content(content)
				.isWriting(isWriting)
				.user(user)
				.areaName(areaName)
				.theme(theme)
				.count(count)
				.reviewImageUrl(reviewImageUrl)
				.originImageUrl(file.getOriginalFilename())
				.build();
	}
	
}
