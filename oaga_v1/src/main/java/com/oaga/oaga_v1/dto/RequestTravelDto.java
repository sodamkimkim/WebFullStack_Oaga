package com.oaga.oaga_v1.dto;

import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.CategoryType;
import com.oaga.oaga_v1.placeModel.HotPlace;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RequestTravelDto {
	
	private String name;
	private String address;
	private String content;
	private String originImageUrl;
	private CategoryType categoryType;
	private AreaGu areaGuId;


	

	private MultipartFile file;
	
	
	public HotPlace toEntity(String image) {
		return HotPlace.builder()
				.name(name)
				.address(address)
				.content(content)
				.areaGu(areaGuId)
				.categoryType(categoryType)
				.image(image)
				.originImageUrl(file.getOriginalFilename())
				.build();
	}
	
}
