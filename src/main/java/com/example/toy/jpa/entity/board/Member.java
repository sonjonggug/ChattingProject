/*
package com.example.toy.jpa.entity.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
public class member {

    @Id
    @Column(length = 50 , nullable = false , name = "member_id")
    String id ;

    @ManyToOne
    @MapsId //@MapsId 는 @id로 지정한 컬럼에 @OneToOne 이나 @ManyToOne 관계를 매핑시키는 역할
    @JoinColumn(name = "member_id" , referencedColumnName = "member_id")
    board board;

    @Column(length = 100 , nullable = false)
    String password;

    @Column(length = 10 , nullable = false)
    String zipcode;

    @Column(length = 100 , nullable = false)
    String address;

    @Column(length = 100 , nullable = false)
    String addressDetail;

    @Column(length = 100 , nullable = false)
    String regDate;


}
*/
