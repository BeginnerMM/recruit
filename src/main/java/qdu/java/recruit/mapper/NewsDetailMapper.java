package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import qdu.java.recruit.entity.NewsDetailEntity;
import qdu.java.recruit.pojo.NewsDetailBO;

public interface NewsDetailMapper {
    int deleteByPrimaryKey(Integer NewsDetailEntityid);

    int insert(NewsDetailEntity record);

    int insertSelective(NewsDetailEntity record);

    NewsDetailEntity selectByPrimaryKey(Integer NewsDetailEntityid);

    int updateByPrimaryKeySelective(NewsDetailEntity record);

    int updateByPrimaryKey(NewsDetailEntity record);

    @Select("select * from news n,news_detail nd where n.newsId = nd.newsId and n.newsId = #{id} ")
    NewsDetailBO selectById(@Param("id") int id);

    @Select("select * from news n,news_detail nd where n.newsId = nd.newsId " +
            "and n.newsTitle like CONCAT('%',#{keyword},'%') ")
    NewsDetailBO selectByTitle(@Param("keyword") String keyword);
}
