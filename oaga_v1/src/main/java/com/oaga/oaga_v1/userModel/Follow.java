package com.oaga.oaga_v1.userModel;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Follow {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	// 팔로우를 한 유저
	@JoinColumn(name = "followingUser")
	@JsonIgnoreProperties({"password","email", "role", "oauth", "createDate"})
	@ManyToOne
	private User followingUser;
	
	// 팔로우를 받은 유저
	@JoinColumn(name = "followedUser")
	@JsonIgnoreProperties({"password","email", "role", "oauth", "createDate"})
	@ManyToOne
	private User followedUser;

}
