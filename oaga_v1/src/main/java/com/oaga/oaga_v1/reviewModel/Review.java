package com.oaga.oaga_v1.reviewModel;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.oaga.oaga_v1.userModel.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Review {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 30)
	private String title;
	
	@Lob
	@Column(nullable = false)
	private String content;
	
	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private IsWritingType isWriting;
	
	@Column(nullable = false, length = 10)
	private String areaName;
	
	@Column(nullable = false)
	@Enumerated(EnumType.STRING)
	private ThemeType theme;
	
	@Column(nullable = false)
	private String reviewImageUrl;
	
	private String originImageUrl;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@ColumnDefault("0")
	private int count;
	
	// 유저 정보
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	
	// 댓글 정보
	@OneToMany(mappedBy = "review", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<Reply> replies;
	
}
