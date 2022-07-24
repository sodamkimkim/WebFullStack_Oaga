package com.oaga.oaga_v1.dto;

import java.sql.Timestamp;

import com.oaga.oaga_v1.placeModel.AreaGu;
import com.oaga.oaga_v1.placeModel.CategoryType;

public class RequestRestaurantDto {
    private int id;
    private String name;
    private String content;
    private String address;
    private AreaGu areaGu;
	private CategoryType categoryType;
    private String image;
    private Timestamp createDate;

}
