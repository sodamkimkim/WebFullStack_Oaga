package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.HotPlace;

public interface HotPlaceRepository extends JpaRepository<HotPlace, Integer>{
	
	// gu에 대한 정보 페이지
	@Query(value = "SELECT * FROM hotplace WHERE areaGuId =?", nativeQuery = true)
	List<HotPlace> mFindByAreaGu(int areaGuId);
	
	// 하나의 guInfo
	@Query(value = "SELECT * FROM hotplace WHERE id =?", nativeQuery = true)
	List<HotPlace> mFindByid(int id);
	
	@Query(value = "SELECT * FROM hotplace WHERE id =?", nativeQuery = true)
	HotPlace mFindByid2(int id);
	
	@Query(value = "SELECT * FROM hotplace AS g inner join areaGu AS a ON g.areaGuId = a.id WHERE a.area =?", nativeQuery = true)
	List<HotPlace> mFindByAreaGuId(int areaGu_areaId);
	
	Page<HotPlace> findByNameContaining(String searchTitle, Pageable pageable);
	
	
	
	

	



	

	

	
}
