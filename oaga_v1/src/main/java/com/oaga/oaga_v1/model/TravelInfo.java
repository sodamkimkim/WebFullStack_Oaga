package com.oaga.oaga_v1.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class TravelInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 50)
	private String area;
	@Column(nullable = false, length = 10, unique = true)
	private String areaGu;
	@Column(nullable = false, length = 200)
	private String content;
	@Column(nullable = false)
	private String imageUrl;
	
	
	private String originFileName;
	
	@CreationTimestamp
	private Timestamp createDate;
}
