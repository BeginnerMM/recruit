package qdu.java.recruit.service;

import qdu.java.recruit.pojo.NewsDetailBO;

public interface NewsDetailService {
    NewsDetailBO selectById(int id);

    NewsDetailBO selectByTitle(String keyword);
}
