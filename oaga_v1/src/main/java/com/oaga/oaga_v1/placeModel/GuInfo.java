package com.oaga.oaga_v1.placeModel;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class GuInfo {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
	    @Column(nullable = false, length = 30)
	    private String name;
	    @Lob
	    private String content;
	    @Column(nullable = false, length = 100)
	    private String address;
	    @Column(nullable = false)
	    private String imageUrl;

	    @ManyToOne
	    @JoinColumn(name = "areaGu")
	    private AreaGu areaGu;
	    
	    @OneToMany(mappedBy = "guInfo", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	    private List<Restaurant> restaurant;

	    @CreationTimestamp
	    private Timestamp createDate;
	
}