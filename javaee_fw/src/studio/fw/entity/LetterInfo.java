package studio.fw.entity;

import java.util.Date;

public class LetterInfo {
    private Integer letterId;

    private Integer senderId;

    private Integer recieverId;

    private Date letterTime;

    private Integer letterState;

    private String letterContent;
    
    private String senderName;
    
    private String plusTime;
    
    private String letterStateName;

    public Integer getLetterId() {
        return letterId;
    }

    public void setLetterId(Integer letterId) {
        this.letterId = letterId;
    }

    public Integer getSenderId() {
        return senderId;
    }

    public void setSenderId(Integer senderId) {
        this.senderId = senderId;
    }

    public Integer getRecieverId() {
        return recieverId;
    }

    public void setRecieverId(Integer recieverId) {
        this.recieverId = recieverId;
    }

    public Date getLetterTime() {
        return letterTime;
    }

    public void setLetterTime(Date letterTime) {
        this.letterTime = letterTime;
    }

    public Integer getLetterState() {
        return letterState;
    }

    public void setLetterState(Integer letterState) {
        this.letterState = letterState;
    }

    public String getLetterContent() {
        return letterContent;
    }

    public void setLetterContent(String letterContent) {
        this.letterContent = letterContent == null ? null : letterContent.trim();
    }

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getPlusTime() {
		return plusTime;
	}

	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}

	public String getLetterStateName() {
		return letterStateName;
	}

	public void setLetterStateName(String letterStateName) {
		this.letterStateName = letterStateName;
	}
}