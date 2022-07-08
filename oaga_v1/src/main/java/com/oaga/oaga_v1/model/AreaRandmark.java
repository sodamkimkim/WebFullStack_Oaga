package com.oaga.oaga_v1.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class AreaRandmark {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "GuRandmark")
	private TravelInfo areaGu;
	
	@Column(nullable = false)
	private String imgUrl;
	
	@Column(nullable = false, length = 15)
	private String title;
	
	@Column(nullable = false, length = 20)
	private String content;

		
}
