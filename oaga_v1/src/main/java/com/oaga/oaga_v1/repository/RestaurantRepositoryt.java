package com.oaga.oaga_v1.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.oaga.oaga_v1.placeModel.Restaurant;

public interface RestaurantRepositoryt extends JpaRepository<Restaurant, Integer>{
	
//	// 찾은 식당 제외한 나머지 찾기
//	@Query(value = "SELECT FROM restaurant WHERE guInfoId = ? and not id = ?", nativeQuery = true)
//	List<Restaurant> mRemainderRestaurant(int guinfoId, int id);
	
	// 식당 정보 보여주기
	@Query(value = "SELECT * FROM restaurant WHERE id = ?", nativeQuery = true)
	List<Restaurant> mFindByRestaurant(int id);

}
