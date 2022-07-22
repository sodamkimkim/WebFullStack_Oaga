package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.Area;

public interface AreaRepository extends JpaRepository<Area, Integer>{
		
	// 보류
	@Query(value = "SELECT * FROM area WHERE id = ?", nativeQuery = true)
	List<Area> mAreaMainImage(int id);
	
	// 여행지 정보 검색
	List<Area> findByAreaContaining(String area);
	
	@Query(value = "SELECT * FROM area WHERE area LIKE \"%?%\"; ", nativeQuery = true)
	List<Area> searchArea(String content);

}
