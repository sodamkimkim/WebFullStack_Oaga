
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
public class AreaGu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false, length = 20)
    private String guname;
    @Column(nullable = false, length = 100)
    private String content;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "areaId")
    private Area area;

    @OneToMany(mappedBy = "areaGu", fetch =  FetchType.EAGER, cascade = CascadeType.REMOVE)
    @JsonIgnoreProperties({"areaGu"})
    private List<Randmark> randmark;
    
    @Column(nullable = false)
    private String imageUrl;
    
    private String originFileName;

}