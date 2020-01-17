package pojo;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @Package pojo
 * @Author daimao
 * @Email 653108117@qq.com
 * @Date 2020/1/17 9:18
 * @Version 1.0
 */
@Data
public class Order {
    private String orderId;
    private double orderMoney;
    private String userId;
    private Integer status;
    private String address;
    private Date orderTime;
    private String clist;
    private List<OrderItem> item;
}
