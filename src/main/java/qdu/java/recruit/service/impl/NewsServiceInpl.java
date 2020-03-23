package qdu.java.recruit.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qdu.java.recruit.entity.NewsEntity;
import qdu.java.recruit.mapper.NewsMapper;
import qdu.java.recruit.service.NewsService;

import java.util.List;

@Service
public class NewsServiceInpl implements NewsService {


    @Autowired
    private NewsMapper newsMapper;


    @Override
    public List<NewsEntity> list(int page, int limit) {
        PageHelper.startPage(page,limit);
        List<NewsEntity> list = newsMapper.selectAll();
        PageInfo<NewsEntity> pageInfo = new PageInfo<>(list);
        return pageInfo.getList();
    }
}
