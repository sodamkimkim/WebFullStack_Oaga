package com.oaga.oaga_v1.dto;


import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.CategoryType;
import com.oaga.oaga_v1.placeModel.Restaurant;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RequestRestaurantDto {
	private String name;
	private String address;
	private String content;

	private CategoryType categoryType;
	private String originImageUrl;
	private AreaGu areaGuId;
	private MultipartFile file;
	
	public Restaurant toEntity(String image) {
		return Restaurant.builder()
				.name(name)
				.address(address)
				.content(content)
				.categoryType(categoryType)
				.areaGu(areaGuId)
				.image(image)
				.originImageUrl(file.getOriginalFilename())
				.build();
	}

}
