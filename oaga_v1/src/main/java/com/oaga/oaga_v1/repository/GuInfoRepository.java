package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.GuInfo;

public interface GuInfoRepository extends JpaRepository<GuInfo, Integer>{

	@Query(value = "SELECT * FROM guinfo WHERE areaGu =?", nativeQuery = true)
	List<GuInfo> mFindByAreaGu(int id);
	
	
	
}
