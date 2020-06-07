package cn.daimao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;
import pojo.Person;

import java.util.Date;
import java.util.List;

/**
 * @Package cn.daimao.mapper
 * @Author daimao
 * @Email 653108117@qq.com
 * @Date 2020/1/16 8:45
 * @Version 1.0
 */
@Component
public interface CartMapper {
    void addCart(Cart cart);

    int queryExist(@Param("productId")String productId,@Param("username")String usernmae);

    void addNum(Integer productNum);

    List<Cart> showCart(String username);

    void deleteCart(Integer id);

    void updateNum(@Param("productNum") Integer productNum,@Param("id") Integer id);

    void addOrder(Order order);

    void addOrderItem(OrderItem orderItem);

    List<Order> queryOrder(String userId);

    List<OrderItem> queryOrderItem(String orderId);

    void pay(String orderId);

    void kucun(@Param("productId") String productId,@Param("productNum")Integer productNum);

    void fahuo(String orderId);

    List<Order> orderManage();

    Integer queryCartId(@Param("productId")String prouctId,@Param("username")String username);

    String queryUserId(String username);
    String queryUsername(String userId);

    Order queryByOrderId(String orderId);
//    String queryByOrderId(String orderId);


    Integer countOrderNum();
    List<Order> queryByPage(@Param("start") Integer start,@Param("num") Integer num);

    Integer countUserTotal(String userId);
    List<Order> pageOrder(@Param("start") Integer start,@Param("num")Integer num,@Param("userId")String userId);

    void deleteOrder(String orderId);

    void cancelOrder(String orderId);

    Integer countUnpaidNum(String userId);

    void changOrderStatus(@Param("orderId") String orderId,@Param("status") Integer status);

    int queryUnpaidNum(String userId);

    void updateSale(@Param("num") Integer num,@Param("productId")String productId);

    List<Order> searchOrder(@Param("orderId") String orderId, @Param("startDtm") String startDtm, @Param("endDtm") String endDtm, @Param("status") Integer status, @Param("userId") String userId);
}
