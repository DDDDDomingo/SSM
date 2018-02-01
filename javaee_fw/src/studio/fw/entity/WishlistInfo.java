package studio.fw.entity;

import java.util.Date;

public class WishlistInfo {
    private Integer wlistId;

    private String wlistName;

    private String wlistImg;

    private Date wlistTime;

    private Boolean wlistState;

    private Integer userId;

    private Integer wlistType;

    private String wlistContent;
    
    private String plusTime;
    
    private String typeName;
    
    private String userPhone;
    
    public Integer getWlistId() {
        return wlistId;
    }

    public void setWlistId(Integer wlistId) {
        this.wlistId = wlistId;
    }

    public String getWlistName() {
        return wlistName;
    }

    public void setWlistName(String wlistName) {
        this.wlistName = wlistName == null ? null : wlistName.trim();
    }

    public String getWlistImg() {
        return wlistImg;
    }

    public void setWlistImg(String wlistImg) {
        this.wlistImg = wlistImg == null ? null : wlistImg.trim();
    }

    public Date getWlistTime() {
        return wlistTime;
    }

    public void setWlistTime(Date wlistTime) {
        this.wlistTime = wlistTime;
    }

    public Boolean getWlistState() {
        return wlistState;
    }

    public void setWlistState(Boolean wlistState) {
        this.wlistState = wlistState;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getWlistType() {
        return wlistType;
    }

    public void setWlistType(Integer wlistType) {
        this.wlistType = wlistType;
    }

    public String getWlistContent() {
        return wlistContent;
    }

    public void setWlistContent(String wlistContent) {
        this.wlistContent = wlistContent == null ? null : wlistContent.trim();
    }

	public String getPlusTime() {
		return plusTime;
	}

	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

}