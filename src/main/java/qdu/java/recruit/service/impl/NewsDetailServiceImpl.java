package qdu.java.recruit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qdu.java.recruit.mapper.NewsDetailMapper;
import qdu.java.recruit.pojo.NewsDetailBO;
import qdu.java.recruit.service.NewsDetailService;

@Service
public class NewsDetailServiceImpl implements NewsDetailService {
    @Autowired
    private NewsDetailMapper newsDetailMapper;

    @Override
    public NewsDetailBO selectById(int id) {

        NewsDetailBO newsDetailBO = newsDetailMapper.selectById(id);

        return newsDetailBO;
    }

    @Override
    public NewsDetailBO selectByTitle(String keyword) {

        return newsDetailMapper.selectByTitle(keyword);
    }
}
