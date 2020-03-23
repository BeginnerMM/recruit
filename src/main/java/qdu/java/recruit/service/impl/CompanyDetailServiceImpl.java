package qdu.java.recruit.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.CompanyDetailEntity;
import qdu.java.recruit.mapper.CompanyDetailMapper;
import qdu.java.recruit.pojo.CompanyDetailBO;
import qdu.java.recruit.service.CompanyDetailService;

import java.util.List;

@Service
public class CompanyDetailServiceImpl implements CompanyDetailService {
    private static final Logger logger = LogManager.getLogger();

    @Autowired
    private CompanyDetailMapper companyDetailMapper;

    @Override
    public List<CompanyDetailEntity> list(int page, int limit, int city) {
        List<CompanyDetailEntity> list = null;
        if (city != 100000) {
            list = companyDetailMapper.selectAllBySerialNumber(city);
        } else {
            list = companyDetailMapper.selectAll();
        }
        if (list.size()<6){
            return list;
        }
        return list.subList(page * limit - limit, limit * page);

    }

    @Override
    public List<CompanyDetailBO> listCompanyDetail(int id, int page, int limit) {

        List<CompanyDetailBO> list = companyDetailMapper.listCompanyDetail(id);
        if (list.size() < 3) {
            return list;
        }
        return list.subList(limit * page - limit, limit * page);

    }

    @Override
    public List<CompanyDetailBO> listCompanyDetailByName(String keyword, int page, int limit) {
        int index = keyword.indexOf("?");
        String newKeyword = keyword.substring(0, index);
        List<CompanyDetailBO> list = companyDetailMapper.listCompanyDetailByName(newKeyword);
        if (list.size() < 3) {
            return list;
        }
        return list.subList(limit * page - limit, limit * page);
    }
}
