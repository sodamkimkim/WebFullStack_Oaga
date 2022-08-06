package com.oaga.oaga_v1.qnaModel;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

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
public class QnAReply {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Lob
	@Column(nullable = false)
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId")
	@JsonIgnoreProperties({"password", "role", "email", "oauth"})
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "qnaId")
	@JsonIgnoreProperties({"user","userId"})
	private QnA qna;
	
	@CreationTimestamp 
	private Timestamp createDate;
	
}
