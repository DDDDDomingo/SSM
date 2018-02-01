package studio.fw.entity;

import java.util.Date;

public class MessageInfo {
	private Integer msgId;

	private String msgContent;

	private Integer saleitemId;

	private Date msgTime;

	private Boolean msgState;

	private Integer userId;

	private String userImg;

	private String userName;

	private String plusTime;

	public String getPlusTime() {
		return plusTime;
	}

	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}

	public Integer getMsgId() {
		return msgId;
	}

	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent == null ? null : msgContent.trim();
	}

	public Integer getSaleitemId() {
		return saleitemId;
	}

	public void setSaleitemId(Integer saleitemId) {
		this.saleitemId = saleitemId;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
	}

	public Boolean getMsgState() {
		return msgState;
	}

	public void setMsgState(Boolean msgState) {
		this.msgState = msgState;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}