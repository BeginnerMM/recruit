package qdu.java.recruit.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import qdu.java.recruit.entity.PositionEntity;

import java.util.Date;

@Getter
@Setter
@ToString
public class CompanyDetailBO extends PositionEntity {

    private Integer companypparticularsid;

    private String companyname;

    private Integer companylogo;

    private String description;

    private String productpresentation;

    private String companyaddress;

    private String corporatejuridicalperson;

    private Long registeredassets;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date registrationtime;

    private Integer cityid;

    private Integer status;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date updeatetime;


}
