/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fontend_entities;

/**
 *
 * @author ADMIN
 */
public class Product {
    private int productId;
    private String name;
    private String contentDetail;
    private String images;
    private int view;
    private int buyItem;
    private float priceInput;
    private float priceOutput;
    private int quantity;
    private int categoryId;
    private int providerId;
    private int sizeId;
    private int colorId;
    private boolean status;
    private String imageHover;
    private float discount;
    private String created;
    private String categoryName;
    private String providerName;
    private String sizeName;
    private String colorName;
    private boolean showHome;

    public boolean isShowHome() {
        return showHome;
    }

    public void setShowHome(boolean showHome) {
        this.showHome = showHome;
    }
    
    
    
    public int getSizeId() {
        return sizeId;
    }

    public void setSizeId(int sizeId) {
        this.sizeId = sizeId;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }

    
    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }
    
    public int getProviderId() {
        return providerId;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }
    
    
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContentDetail() {
        return contentDetail;
    }

    public void setContentDetail(String contentDetail) {
        this.contentDetail = contentDetail;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public int getBuyItem() {
        return buyItem;
    }

    public void setBuyItem(int buyItem) {
        this.buyItem = buyItem;
    }

    public float getPriceInput() {
        return priceInput;
    }

    public void setPriceInput(float priceInput) {
        this.priceInput = priceInput;
    }

    public float getPriceOutput() {
        return priceOutput;
    }

    public void setPriceOutput(float priceOutput) {
        this.priceOutput = priceOutput;
    }

    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImageHover() {
        return imageHover;
    }

    public void setImageHover(String imageHover) {
        this.imageHover = imageHover;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    
    
    
    
}
