package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.Select;
import qdu.java.recruit.entity.NewsEntity;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer newsid);

    int insert(NewsEntity record);

    int insertSelective(NewsEntity record);

    NewsEntity selectByPrimaryKey(Integer newsid);

    int updateByPrimaryKeySelective(NewsEntity record);

    int updateByPrimaryKey(NewsEntity record);

    @Select("select * from news")
    List<NewsEntity> selectAll();
}
