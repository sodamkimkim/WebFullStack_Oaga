package com.oaga.oaga_v1.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.placeModel.Area;
import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.placeModel.Restaurant;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.GuInfoRepository;
import com.oaga.oaga_v1.repository.RestaurantRepositoryt;
import com.oaga.oaga_v1.repository.TravelInfoRepository;


@Service
public class TravelInfoService {
	// 서비스 딴에서 레파지토리의 사이즈를 측정 할수 없다!!!!
	static final int  guCount = 13;
	static final int  restaurantCount = 7;
	
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	@Autowired
	private GuInfoRepository randmarkRepository;
	@Autowired
	private RestaurantRepositoryt restaurantRepositoryt;
	@Autowired
	private AreaRepository areaRepository;
	
	
	@Transactional
	public Map<Integer, List<AreaGu>> areaIdList(){
		Map<Integer, List<AreaGu>> map = new HashMap<Integer, List<AreaGu>>();
		for(int i = 1; i <= guCount; i++) {
			List<AreaGu> index = travelInfoRepository.mAreaIdList(i);
			map.put(i, index);
		}
		return map;
	}
	


	
// ===================================================================================================	
	@Transactional
	public List<Area> areaImage(int id){
		return areaRepository.mAreaMainImage(id);
	}
	
	@Transactional
	public List<GuInfo> guInfo(int id){	
		return randmarkRepository.mFindByAreaGu(id);
	}
	
	@Transactional
	public List<AreaGu> areaGu(int id){	
		return travelInfoRepository.mAreaIdList(id);
	}
	
	@Transactional
	public List<Restaurant> guInfoRestaurant(int guInfoId){
		return restaurantRepositoryt.mRestaurantGroupByGuInfoId(guInfoId);
	}
	
// ===================================================================================================	
	
//	// 찾은 식당 제외한 나머지 찾기
//	@Transactional
//	public List<Restaurant> remainderList(){
//		return restaurantRepositoryt.mRemainderRestaurant();
//	}
	// 찾은 식당 정보
	@Transactional
	public List<Restaurant> findByIdRestaurant(int id){
		return restaurantRepositoryt.mFindByRestaurant(id);
	}
	
// ===================================================================================================
	
	@Transactional
	public List<GuInfo> findByGuinfoId(int id){
		return randmarkRepository.mFindByid(id);
	}
	
	@Transactional
	public List<Area> findAreaByTitle(String area) {
		return areaRepository.findByAreaContaining(area);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}