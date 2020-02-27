package pojo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("订单实体类")
public class Order {
    private String orderId;
    private double orderMoney;
    private String userId;
    @ApiModelProperty("订单状态，0 未付款 ，1 待发货， 2 待收货， -1 订单取消，3 订单完成")
    private Integer status;
    private String address;
    private Date orderTime;
    private String clist;
    private List<OrderItem> item;
}
