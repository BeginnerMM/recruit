package qdu.java.recruit.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CompanyDetailEntity {
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

    private Date createtime;

    private Date updeatetime;

    public Integer getCompanypparticularsid() {
        return companypparticularsid;
    }

    public void setCompanypparticularsid(Integer companypparticularsid) {
        this.companypparticularsid = companypparticularsid;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public Integer getCompanylogo() {
        return companylogo;
    }

    public void setCompanylogo(Integer companylogo) {
        this.companylogo = companylogo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getProductpresentation() {
        return productpresentation;
    }

    public void setProductpresentation(String productpresentation) {
        this.productpresentation = productpresentation == null ? null : productpresentation.trim();
    }

    public String getCompanyaddress() {
        return companyaddress;
    }

    public void setCompanyaddress(String companyaddress) {
        this.companyaddress = companyaddress == null ? null : companyaddress.trim();
    }

    public String getCorporatejuridicalperson() {
        return corporatejuridicalperson;
    }

    public void setCorporatejuridicalperson(String corporatejuridicalperson) {
        this.corporatejuridicalperson = corporatejuridicalperson == null ? null : corporatejuridicalperson.trim();
    }

    public Long getRegisteredassets() {
        return registeredassets;
    }

    public void setRegisteredassets(Long registeredassets) {
        this.registeredassets = registeredassets;
    }

    public Date getRegistrationtime() {
        return registrationtime;
    }

    public void setRegistrationtime(Date registrationtime) {
        this.registrationtime = registrationtime;
    }

    public Integer getCityid() {
        return cityid;
    }

    public void setCityid(Integer cityid) {
        this.cityid = cityid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdeatetime() {
        return updeatetime;
    }

    public void setUpdeatetime(Date updeatetime) {
        this.updeatetime = updeatetime;
    }
}
