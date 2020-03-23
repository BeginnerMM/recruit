package qdu.java.recruit.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import qdu.java.recruit.entity.NewsEntity;

@Getter
@Setter
@ToString
public class NewsDetailBO extends NewsEntity {

    private Integer newsdetailid;

    private String newsdetailcontent;

    private Integer newsid;

}
