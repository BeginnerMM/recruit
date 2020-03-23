package qdu.java.recruit.mapper;

import qdu.java.recruit.entity.CityEntity;

public interface CityMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CityEntity record);

    int insertSelective(CityEntity record);

    CityEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CityEntity record);

    int updateByPrimaryKey(CityEntity record);
}
