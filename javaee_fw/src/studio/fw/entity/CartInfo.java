package studio.fw.entity;

import java.util.Date;

public class CartInfo {
    private Integer cartId;

    private Integer userId;

    private Integer saleId;

    private Integer sellerId;

	private Integer cartQuantity;

    private Date createTime;

    private Date updateTime;
    
    private String plusTime;
    
    private String saleName;
    
    private String saleImg;
    
    private Long salePrice;
    
    public String getSaleName() {
		return saleName;
	}

	public void setSaleName(String saleName) {
		this.saleName = saleName;
	}

	public String getSaleImg() {
		return saleImg;
	}

	public void setSaleImg(String saleImg) {
		this.saleImg = saleImg;
	}

	public String getPlusTime() {
		return plusTime;
	}

	public void setPlusTime(String plusTime) {
		this.plusTime = plusTime;
	}
    
    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Integer getSellerId() {
        return sellerId;
    }

    public void setSellerId(Integer sellerId) {
        this.sellerId = sellerId;
    }

    public Integer getCartQuantity() {
        return cartQuantity;
    }

    public void setCartQuantity(Integer cartQuantity) {
        this.cartQuantity = cartQuantity;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

	public Long getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Long salePrice) {
		this.salePrice = salePrice;
	}
}