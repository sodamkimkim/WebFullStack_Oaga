package com.oaga.oaga_v1.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.GuInfo;
import com.oaga.oaga_v1.repository.AreaRepository;
import com.oaga.oaga_v1.repository.RandMarkRepository;
import com.oaga.oaga_v1.repository.TravelInfoRepository;

@Service
public class TravelInfoService {
	
	static final int  guCount = 13;
	
	@Autowired
	private TravelInfoRepository travelInfoRepository;
	@Autowired
	private RandMarkRepository randmarkRepository;
	@Autowired
	private AreaRepository areaRepository;
	
	
	
	@Transactional
	public List<GuInfo> guInfo(int areaGu){	
		return randmarkRepository.mFindByAreaGu(areaGu);
	}
	
	
	@Transactional
	public Map<Integer, List<AreaGu>> areaIdList(){
		Map<Integer, List<AreaGu>> map = new HashMap<Integer, List<AreaGu>>();
		for(int i = 1; i <= guCount; i++) {
			List<AreaGu> index = travelInfoRepository.areaIdList(i);
			map.put(i, index);
		}
		return map;
	}
	
	
//	@Transactional
//	public List<AreaGu> arealist(){
//		return travelInfoRepository.areaList();
//	}
	

	
	
//	@Transactional
//	public List<AreaGu> seoul(){
//		return travelInfoRepository.seoul();
//	}
//	@Transactional
//	public List<AreaGu> busan(){
//		return travelInfoRepository.busan();
//	}
//	@Transactional
//	public List<AreaGu> jeju(){
//		return travelInfoRepository.jeju();
//	}
//	@Transactional
//	public List<AreaGu> deagu(){
//		return travelInfoRepository.deagu();
//	}
//	@Transactional
//	public List<AreaGu> inchun(){
//		return travelInfoRepository.inchun();
//	}
//	
	
	
}