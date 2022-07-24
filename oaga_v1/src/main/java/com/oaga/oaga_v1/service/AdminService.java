package com.oaga.oaga_v1.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.dto.RequestTravelDto;
import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.repository.RestaurantRepositoryt;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

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
	private RestaurantRepositoryt restaurantRepository;

	@Transactional
	public List<Area> areaAll() {
		return areaRepository.findAll();
	}

	@Transactional
	public List<AreaGu> areaGuAll(int area) {
		return travelInfoRepository.mAreaIdList(area);
	}

	public List<AreaGu> areaGuNmae(int id) {
		return travelInfoRepository.mAreaGuId(id);
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
		Path imageFilePath = Paths.get(uploadFolder + newFileName);
		System.out.println("dmsapdmpasmdpasdmaps");
		try {
			Files.write(imageFilePath, dto.getFile().getBytes());
			guInfoRepository.save(dto.toEntity(newFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@Transactional
	public Page<Restaurant> searchRestaurantByTitle(String title, Pageable pageable) {
		return restaurantRepository.findAllByNameContaining(title, pageable);

	}

	@Transactional
	public void deleteRestaurantById(int restaurantId) {
		restaurantRepository.deleteById(restaurantId);
	}

}
