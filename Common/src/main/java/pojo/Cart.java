package pojo;

import lombok.Data;

/**
 * @Package pojo
 * @Author daimao
 * @Email 653108117@qq.com
 * @Date 2020/1/16 8:57
 * @Version 1.0
 */
@Data
public class Cart {
    private Integer id;
    private String username;
    private String productId;
    private String productImgurl;
    private Integer productNum;
    private Double productPrice;
    private String productName;
}
