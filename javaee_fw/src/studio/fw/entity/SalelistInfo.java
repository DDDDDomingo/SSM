package studio.fw.entity;

import java.util.Date;

public class SalelistInfo {
	private Integer saleId;

	private String saleName;

	private String saleImg;

	private Date saleTime;

	private Long salePrice;

	private Integer saleCata;

	private Boolean saleState;

	private Integer userId;

	private Integer saleReserve;

	private Integer buyerId;

	private String saleContent;
	// 时间
	private String plusTime;
	// 买家昵称
	private String buyName;
	// 类别名字
	private String cateName;

	public Integer getSaleId() {
		return saleId;
	}

	public void setSaleId(Integer saleId) {
		this.saleId = saleId;
	}

	public String getSaleName() {
		return saleName;
	}

	public void setSaleName(String saleName) {
		this.saleName = saleName == null ? null : saleName.trim();
	}

	public String getSaleImg() {
		return saleImg;
	}

	public void setSaleImg(String saleImg) {
		this.saleImg = saleImg == null ? null : saleImg.trim();
	}

	public Date getSaleTime() {
		return saleTime;
	}

	public void setSaleTime(Date saleTime) {
		this.saleTime = saleTime;
	}

	public Long getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Long salePrice) {
		this.salePrice = salePrice;
	}

	public Integer getSaleCata() {
		return saleCata;
	}

	public void setSaleCata(Integer saleCata) {
		this.saleCata = saleCata;
	}

	public Boolean getSaleState() {
		return saleState;
	}

	public void setSaleState(Boolean saleState) {
		this.saleState = saleState;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getSaleReserve() {
		return saleReserve;
	}

	public void setSaleReserve(Integer saleReserve) {
		this.saleReserve = saleReserve;
	}

	public Integer getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public String getSaleContent() {
		return saleContent;
	}

	public void setSaleContent(String saleContent) {
		this.saleContent = saleContent == null ? null : saleContent.trim();
	}

	public String getPlusTime() {
		return plusTime;
	}

	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
}