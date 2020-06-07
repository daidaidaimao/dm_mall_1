package cn.daimao.service;

import cn.daimao.mapper.CartMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import config.LoginMessage;
import config.SystemSetting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;
import pojo.Product;
import utils.PageResult;
import utils.SysResult;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @Package cn.daimao.service
 * @Author daimao
 * @Email 653108117@qq.com
 * @Date 2020/1/16 8:45
 * @Version 1.0
 */
@Service
public class CartService {
    @Autowired
    private CartMapper mapper;

    @Autowired
    private StringRedisTemplate redisTemplate;

    public SysResult addCart(Cart cart) {
        int exist = mapper.queryExist(cart.getProductId(),cart.getUsername());
        if (exist == 0){
            mapper.addCart(cart);
            return SysResult.build(200,"添加至购物车成功",null);
        }else{
            mapper.addNum(cart.getProductNum());
            return SysResult.build(200,"购物车已有该商品，只增加了数量",null);
        }

    }

    public SysResult showCart(String username) {
        try {
            List<Cart> carts = mapper.showCart(username);
            return SysResult.build(200,"",carts);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(202,e.toString(),null);
        }
    }

    public SysResult deleteCart(Integer id) {
        try {
            mapper.deleteCart(id);
            return SysResult.build(200,"",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(202,e.toString(),null);
        }
    }


    public SysResult updateNum(Integer productNum,Integer id) {
        try {
            mapper.updateNum(productNum,id);
            return SysResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(202,e.toString(),null);
        }

    }

    public SysResult addOrder(Order order) throws IOException {
        Integer num = mapper.countUnpaidNum(order.getUserId());
        if(num == 0) {
            String cJson = order.getClist();
            order.setOrderId(UUID.randomUUID().toString());
            List<OrderItem> list = new ArrayList<>();
            ObjectMapper JSONmapper = new ObjectMapper();
            JavaType jt = JSONmapper.getTypeFactory().constructParametricType(ArrayList.class, Cart.class);
            List<Cart> clist = JSONmapper.readValue(cJson, jt);
            for (Cart c : clist) {
                OrderItem o = new OrderItem();
                o.setProductPrice(c.getProductPrice());
                o.setProductNum(c.getProductNum());
                o.setProductName(c.getProductName());
                o.setProductImgurl(c.getProductImgurl());
                o.setProductId(c.getProductId());
                o.setOrderId(order.getOrderId());
                mapper.updateSale(c.getProductNum(),c.getProductId());
                list.add(o);
            }
            order.setOrderTime(new Date());
            order.setStatus(0);
            mapper.addOrder(order);
            for (OrderItem o : list) {
                mapper.addOrderItem(o);
            }
            redisTemplate.opsForValue().set(order.getOrderId(), "未付款", SystemSetting.ORDERTIME, TimeUnit.SECONDS);
            return SysResult.build(200, SystemSetting.CREATEORDER, order);
        }else{
            return SysResult.build(201,SystemSetting.ORDERUNPAID,null);
        }

    }
    public SysResult queryTime(String orderId){
        Long time = redisTemplate.getExpire(orderId, TimeUnit.SECONDS);
        if(time != 0)
            return SysResult.build(200,time.toString(),null);
        else{
            mapper.cancelOrder(orderId);
            return SysResult.build(201,SystemSetting.ORDERCANCEL,null);
        }

    }

    public SysResult queryOrder(String userId) throws JsonProcessingException {
        List<Order> olist = mapper.queryOrder(userId);
        ObjectMapper om = new ObjectMapper();
        if (olist != null){
            for (Order o:olist){
                List<OrderItem> list = mapper.queryOrderItem(o.getOrderId());
//                System.out.println(list);
                String pJson = om.writeValueAsString(list);
//                System.out.println(pJson);
                o.setItem(list);
                o.setClist(pJson);
            }
        }
        return SysResult.build(200,"",olist);
    }

    public SysResult pay(String orderId) {
        try {
//            mapper.pay(orderId);
            Order order = mapper.queryByOrderId(orderId);
            if (order.getStatus() ==0){
            mapper.changOrderStatus(orderId,1);
            return SysResult.build(200,LoginMessage.PaySuccess,null);
            }else{
                return SysResult.build(201,SystemSetting.ORDERERROR,null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(202, LoginMessage.PayFail+e.toString(),null);
        }
    }

    public SysResult fahuo(String orderId) {
        try {
//            mapper.fahuo(orderId);
            Order order = mapper.queryByOrderId(orderId);
            if (order.getStatus() == 1) {
                mapper.changOrderStatus(orderId, 2);
                List<OrderItem> plist = new ArrayList<>();
                plist = mapper.queryOrderItem(orderId);
                for (OrderItem o : plist) {
                    mapper.kucun(o.getProductId(), o.getProductNum());
                }
                return SysResult.build(200, LoginMessage.FahuoSuccess, null);
            }else{
                return SysResult.build(201,SystemSetting.ORDERERROR,null);
            }
            } catch(Exception e){
                e.printStackTrace();
                return SysResult.build(202, LoginMessage.FahuoFail, null);
            }


    }

    public List<Order> orderManage() {
        List<Order> orders = mapper.orderManage();
        for (Order o : orders){
            List<OrderItem> list = mapper.queryOrderItem(o.getOrderId());
            o.setItem(list);
        }
        return orders;
    }

    public List<OrderItem> queryItem(String orderId) {
        return mapper.queryOrderItem(orderId);
    }

    public Integer queryCartId(String username, String productId) {
//        String username = mapper.queryUsername(userId);
        return mapper.queryCartId(productId,username);
    }

    public String queryByOrderId(String orderId) {
        Order order = mapper.queryByOrderId(orderId);
//        return mapper.queryByOrderId(orderId);
        return order.getUserId();
    }

    public PageResult queryAllOrder(Integer page,Integer num) throws JsonProcessingException {

        PageResult result = new PageResult();
        Integer total = mapper.countOrderNum();
        result.setTotal(total);
        Integer start = (page-1)*num;
        List<Order> olist = mapper.queryByPage(start,num);
        ObjectMapper om = new ObjectMapper();
        if (olist != null){
            for (Order o:olist){
                List<OrderItem> list = mapper.queryOrderItem(o.getOrderId());
//                System.out.println(list);
                String pJson = om.writeValueAsString(list);
//                System.out.println(pJson);
                o.setItem(list);
                o.setClist(pJson);
            }
        }
        result.setRows(olist);
        return result;
    }

    public PageResult pageOrder(Integer page, Integer num, String userId) throws JsonProcessingException {
        Integer total = mapper.countUserTotal(userId);
        PageResult result  = new PageResult();
        Integer start = num*(page-1);
//        List<Order> list = mapper.pageOrder(start,num,userId);
        List<Order> olist = mapper.pageOrder(start,num,userId);
        ObjectMapper om = new ObjectMapper();
        if (olist != null){
            for (Order o:olist){
                List<OrderItem> list = mapper.queryOrderItem(o.getOrderId());
//                System.out.println(list);
                String pJson = om.writeValueAsString(list);
//                System.out.println(pJson);
                o.setItem(list);
                o.setClist(pJson);
            }
        }
        result.setRows(olist);
//        result.setRows(list);
        result.setTotal(total);
        return result;
    }

    public SysResult cancelOrder(String orderId) {
//        mapper.cancelOrder(orderId);
        mapper.changOrderStatus(orderId,-1);
        return SysResult.build(200,"",null);
    }

    public SysResult confirmReceipt(String orderId) {
        Order order = mapper.queryByOrderId(orderId);
        if (order.getStatus() == 2){
            mapper.changOrderStatus(orderId,3);
            return SysResult.build(200,SystemSetting.ORDERCHECK,null);
        }else{
            return SysResult.build(201,SystemSetting.ORDERERROR,null);
        }
    }

    public Order queryOrderDetail(String orderId) {
        return mapper.queryByOrderId(orderId);
    }

    public SysResult finishOrder(String orderId) {
        try {
            mapper.changOrderStatus(orderId,4);
            return SysResult.build(200,"success",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }

    public SysResult queryUnpaidNum(String userId) {
        int num = mapper.queryUnpaidNum(userId);
        if(num == 0)
            return SysResult.ok();
        else
            return SysResult.build(201,"fail",null);
    }

    public SysResult deleteOrderByOrderId(String userId, String orderId) {
        List<Order> orders = mapper.queryOrder(userId);
        Order o = mapper.queryByOrderId(orderId);
        if(orders.contains(o)) {
            mapper.deleteOrder(orderId);
            return SysResult.build(200, "", null);
        }else{
            return SysResult.build(201, "", null);
        }
    }

    public SysResult alipayCallback(String orderId) {
        Order order = mapper.queryByOrderId(orderId);
        if (order.getStatus() ==0){
            mapper.changOrderStatus(orderId,1);
            return SysResult.build(200,"",null);
        }else {
            return SysResult.build(201,"error",null);
        }
    }

    public SysResult orderSearch(String orderId, String startDtm, String endDtm, Integer status,String userId) throws JsonProcessingException   {

//        System.out.println(status);
//        System.out.println(startDtm+endDtm);
//        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd  " );
//        Date s = sdf.parse(startDtm);
//        Date e = sdf.parse(endDtm);
        List<Order> mlist = mapper.searchOrder(orderId,startDtm,endDtm,status,userId);
        List<Order> olist = mapper.pageOrder(0,10,userId);
        ObjectMapper om = new ObjectMapper();
        if (olist != null){
            for (Order o:olist){
                List<OrderItem> list = mapper.queryOrderItem(o.getOrderId());
//                System.out.println(list);
                String pJson = om.writeValueAsString(list);
//                System.out.println(pJson);
                o.setItem(list);
                o.setClist(pJson);
            }
        }
//        mlist.set
        return SysResult.build(200,"",mlist);
    }
}
