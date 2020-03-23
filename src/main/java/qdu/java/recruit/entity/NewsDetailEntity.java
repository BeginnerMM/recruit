package qdu.java.recruit.entity;

public class NewsDetailEntity {
    private Integer newsdetailid;

    private String newsdetailcontent;

    private Integer newsid;

    public Integer getNewsdetailid() {
        return newsdetailid;
    }

    public void setNewsdetailid(Integer newsdetailid) {
        this.newsdetailid = newsdetailid;
    }

    public String getNewsdetailcontent() {
        return newsdetailcontent;
    }

    public void setNewsdetailcontent(String newsdetailcontent) {
        this.newsdetailcontent = newsdetailcontent == null ? null : newsdetailcontent.trim();
    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }
}
