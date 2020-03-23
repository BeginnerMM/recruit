package qdu.java.recruit.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class NewsEntity {
    private Integer newsid;

    private String newstitle;

    private String newscontent;

    private String newsimage;

    private String newssource;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date newsreleasetime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createtime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date updatetime;

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle == null ? null : newstitle.trim();
    }

    public String getNewscontent() {
        return newscontent;
    }

    public void setNewscontent(String newscontent) {
        this.newscontent = newscontent == null ? null : newscontent.trim();
    }

    public String getNewsimage() {
        return newsimage;
    }

    public void setNewsimage(String newsimage) {
        this.newsimage = newsimage == null ? null : newsimage.trim();
    }

    public String getNewssource() {
        return newssource;
    }

    public void setNewssource(String newssource) {
        this.newssource = newssource == null ? null : newssource.trim();
    }

    public Date getNewsreleasetime() {
        return newsreleasetime;
    }

    public void setNewsreleasetime(Date newsreleasetime) {
        this.newsreleasetime = newsreleasetime;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }
}
