package com.oaga.oaga_v1.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.oaga.oaga_v1.dto.RequestRestaurantDto;
import com.oaga.oaga_v1.dto.RequestReviewFileDto;
import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.repository.RestaurantRepositoryt;
import com.oaga.oaga_v1.repository.TravelInfoRepository;
import com.oaga.oaga_v1.userModel.User;

@Service
public class AdminService {
	
	@Value("${file.path}")
	private String uploadFolder;
	
	@Autowired
	private AreaRepository areaRepository;
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	@Autowired
	private GuInfoRepository guInfoRepository;
	@Autowired
	private RestaurantRepositoryt restaurantRepositoryt;
	
	
	@Transactional
	public List<Area> areaAll(){
		return areaRepository.findAll();
	}
	@Transactional
	public List<AreaGu> areaGuAll(int area){
		return travelInfoRepository.mAreaIdList(area);
	}
	
	
	public List<AreaGu> areaGuNmae(int id){
		return travelInfoRepository.mAreaGuId(id);
	}
	
	public List<GuInfo> findAreaGuId(int areaGuId){
		return guInfoRepository.mFindByAreaGu(areaGuId);
	}
	
	public List<GuInfo> findGuinfoId(int guinfoId){
		return guInfoRepository.mFindByid(guinfoId);
	}
	
	
	
	
	
	private String extracktExt(String originalFileName) {
		int pos = originalFileName.lastIndexOf(".");
		return originalFileName.substring(pos + 1);
	}
	
	@Transactional
	public void saveGuInfo(RequestTravelDto dto) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder +  newFileName);
		
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			guInfoRepository.save(dto.toEntity(newFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@Transactional
	public void saveRestaurant(RequestRestaurantDto dto) {
		UUID uuid = UUID.randomUUID();
		String imageFileName = uuid.toString() + "." + extracktExt(dto.getFile().getOriginalFilename());
		String newFileName = (imageFileName.trim()).replaceAll("\\s", "");
		Path imageFilePath = Paths.get(uploadFolder +  newFileName);
		System.out.println("dmsapdmpasmdpasdmaps");
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			restaurantRepositoryt.save(dto.toEntity(newFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@Transactional
	public void updateGuInfo(GuInfo guInfo, int id) {

		GuInfo guinfoEntity = guInfoRepository.mFindByid2(id);
		
		
		
		System.out.println(guinfoEntity + "guinfoEntityguinfoEntity");
	
		try {
			
			guinfoEntity.getId();
			guinfoEntity.setName(guInfo.getName());
			guinfoEntity.setAddress(guInfo.getAddress());
			guinfoEntity.setContent(guInfo.getContent());
			guinfoEntity.getAreaGu();
			guinfoEntity.getCategoryType();
			guinfoEntity.getCreateDate();
			guinfoEntity.setOriginImageUrl(guInfo.getOriginImageUrl());
			guinfoEntity.setImage(guInfo.getImage());
			
			System.out.println("여기는????");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
		
		

	}
	
	
	
	
}
