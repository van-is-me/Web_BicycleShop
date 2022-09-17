/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bike;

/**
 *
 * @author ADmin
 */
public class Bike {

    protected String productId;
    protected String productName;
    protected String size;
    protected String frameMaterial;
    protected int unitPrice;
    protected String color;
    protected String categoryName;
    protected String brandName;
    protected int quantity;
    protected String image;
    protected String categoryId;
    protected String brandId;

    public Bike() {
    }

    public Bike(String productId, String productName, String size, String frameMaterial, int unitPrice, String color, String categoryId, String brandId) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.frameMaterial = frameMaterial;
        this.unitPrice = unitPrice;
        this.color = color;
        this.categoryId = categoryId;
        this.brandId = brandId;
    }

    public Bike(String productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public Bike(String productId, String productName, String size, String frameMaterial, int unitPrice, String color, String categoryName, String brandName, int quantity, String image) {
        this.productId = productId;
        this.productName = productName;
        this.size = size;
        this.frameMaterial = frameMaterial;
        this.unitPrice = unitPrice;
        this.color = color;
        this.categoryName = categoryName;
        this.brandName = brandName;
        this.quantity = quantity;
        this.image = image;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getFrameMaterial() {
        return frameMaterial;
    }

    public void setFrameMaterial(String frameMaterial) {
        this.frameMaterial = frameMaterial;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

}
