package pojo;

import lombok.Data;

/**
 * @Package pojo
 * @Author daimao
 * @Email 653108117@qq.com
 * @Date 2020/1/17 9:23
 * @Version 1.0
 */
@Data
public class OrderItem {
    private Integer id;
    private String orderId;
    private String productId;
    private double productPrice;
    private String productName;
    private Integer productNum;
    private String productImgurl;
}
