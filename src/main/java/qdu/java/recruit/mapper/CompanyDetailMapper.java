package qdu.java.recruit.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import qdu.java.recruit.entity.CompanyDetailEntity;
import qdu.java.recruit.pojo.CompanyDetailBO;

import java.util.List;

public interface CompanyDetailMapper {
    int deleteByPrimaryKey(Integer companypparticularsid);

    int insert(CompanyDetailEntity record);

    int insertSelective(CompanyDetailEntity record);

    CompanyDetailEntity selectByPrimaryKey(Integer companypparticularsid);

    int updateByPrimaryKeySelective(CompanyDetailEntity record);

    int updateByPrimaryKey(CompanyDetailEntity record);

    @Select("select * from company_detail")
    List<CompanyDetailEntity> selectAll();

    @Select("select * from company_detail where cityId = #{serialNumber}")
    List<CompanyDetailEntity> selectAllBySerialNumber(@Param("serialNumber") int serialNumber);

    @Select("select p.*,c.* from position p,department d,company_detail c\n" +
            "where p.departmentId = d.departmentId and d.companyId = c.companypParticularsId \n" +
            "and c.companypParticularsId = #{companypParticularsId} and status = 1 \n" +
            "order by releaseDate DESC")
    List<CompanyDetailBO> listCompanyDetail(@Param("companypParticularsId") int companypParticularsId);

    @Select("select p.*,c.* from position p,department d,company_detail c\n" +
            "where p.departmentId = d.departmentId and d.companyId = c.companypParticularsId \n" +
            "and c.companyName like CONCAT('%',#{companyName},'%') and status = 1 \n" +
            "order by releaseDate DESC")
    List<CompanyDetailBO> listCompanyDetailByName(@Param("companyName") String companyName);
}
