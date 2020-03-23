package qdu.java.recruit.service;

import qdu.java.recruit.entity.CompanyDetailEntity;
import qdu.java.recruit.pojo.CompanyDetailBO;

import java.util.List;

public interface CompanyDetailService {
    List<CompanyDetailEntity> list(int page, int limit,int city);

    List<CompanyDetailBO> listCompanyDetail(int id, int page, int limit);

    List<CompanyDetailBO> listCompanyDetailByName(String keyword, int page,int limit);
}
