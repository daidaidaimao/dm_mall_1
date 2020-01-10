package pojo;

import lombok.Data;

@Data
public class Product {
    private String productId;
    private String productName;
    private Double productPrice;
    private Integer productCategory;
    private String productImgurl;
    private Integer productNum;
    private String productDescription;
    private Integer sale;
    private String categoryName;
}
