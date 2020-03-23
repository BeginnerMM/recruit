package qdu.java.recruit.entity;

public class CityEntity {
    private Integer id;

    private Integer serialnumber;

    private Integer parentserialnumber;

    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSerialnumber() {
        return serialnumber;
    }

    public void setSerialnumber(Integer serialnumber) {
        this.serialnumber = serialnumber;
    }

    public Integer getParentserialnumber() {
        return parentserialnumber;
    }

    public void setParentserialnumber(Integer parentserialnumber) {
        this.parentserialnumber = parentserialnumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}
