package qdu.java.recruit.service;

import qdu.java.recruit.entity.NewsEntity;

import java.util.List;

public interface NewsService {
    List<NewsEntity> list(int page, int limit);
}
