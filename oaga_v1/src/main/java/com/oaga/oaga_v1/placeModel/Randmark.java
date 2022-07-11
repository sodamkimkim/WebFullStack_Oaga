package com.oaga.oaga_v1.placeModel;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@Entity
public class Randmark {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private Place place;
	
	@Column(nullable = false)
	private String imgUrl;
	
	@Column(nullable = false, length = 15)
	private String title;
	
	@Column(nullable = false, length = 20)
	private String content;
	
	@Column(nullable = false)
	private String address;
	
	@OneToMany(mappedBy = "randmark", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<Restaurant> restaurants;

		
}
