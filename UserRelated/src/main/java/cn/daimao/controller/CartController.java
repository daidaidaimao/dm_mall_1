package cn.daimao.controller;

import cn.daimao.service.CartService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;
import utils.PageResult;
import utils.SysResult;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @package cn.daimao.controller
 * @author daimao
 * @email 653108117@qq.com
 * @Date 2020/1/16 8:41
 * @version 1.0
 */
@RestController
@RequestMapping("user")
public class CartController {
    @Autowired
    private CartService service;

    @RequestMapping(value = "addCart",method = RequestMethod.POST)
    @ApiOperation("添加购物车功能")
    public SysResult addCart(Cart cart){
        return service.addCart(cart);
    }

    @RequestMapping(value = "showCart",method = RequestMethod.GET)
    @ApiOperation("展示用户个人购物车,不分页 弃用")
    public SysResult showCart(String username){
        return service.showCart(username);
    }

    @RequestMapping(value = "deleteCart",method = RequestMethod.GET)
    @ApiOperation("删除购物车内商品")
    public SysResult deleteCart(Integer id){
        return service.deleteCart(id);
    }

    @RequestMapping(value = "updateNum",method = RequestMethod.GET)
    @ApiOperation("用于在购物车内更改商品数量")
    public SysResult updateNum(Integer productNum,Integer id){
        return service.updateNum(productNum,id);
    }

    @RequestMapping(value = "addOrder",method = RequestMethod.POST)
    @ApiOperation("购物车内下订单API")
    public SysResult addOrder(Order order) throws IOException {
        return service.addOrder(order);
    }

    @RequestMapping(value = "queryOrder",method = RequestMethod.GET)
    @ApiOperation("用户查询自己所有的订单")
    public SysResult queryOrder(String userId) throws JsonProcessingException {
        return service.queryOrder(userId);
    }

    @RequestMapping(value = "pay",method = RequestMethod.GET)
    @ApiOperation("付款API  没怎么写 点一下就是付款了")
    public SysResult pay(String orderId){
        return service.pay(orderId);
    }

    @RequestMapping(value = "fahuo",method = RequestMethod.GET)
    @ApiOperation("如其名，发货！")
    public SysResult fahuo(String orderId){
        return service.fahuo(orderId);
    }

    @RequestMapping(value = "orderManage",method = RequestMethod.GET)
    @ApiOperation("后台显示所有订单，由于不分页 已经被我弃用了")
    public List<Order> orderManage(){
        return service.orderManage();
    }

    @RequestMapping(value = "queryItem",method = RequestMethod.GET)
    @ApiOperation("查询订单内，包含的物品信息")
    public List<OrderItem> queryItem(String orderId){
        return service.queryItem(orderId);
    }

    @RequestMapping(value = "queryCartId",method = RequestMethod.GET)
    @ApiOperation("查询订单ID，我忘了我为什么要写这个功能")
    public Integer queryCartId(String username,String productId){
        return service.queryCartId(username,productId);
    }

    @RequestMapping(value = "queryByOrderId",method = RequestMethod.GET)
    @ApiOperation("用订单ID查询用户ID 。。。")
    public String queryByOrderId(String orderId){
        return service.queryByOrderId(orderId);
    }

    @RequestMapping(value = "/queryAllOrder",method = RequestMethod.GET)
    @ApiOperation("后台分页显示订单")
    public PageResult queryAllOrder(Integer page,Integer num) throws JsonProcessingException {
        return service.queryAllOrder(page,num);
    }

    @RequestMapping(value = "/pageOrder",method = RequestMethod.GET)
    @ApiOperation("前台分页显示订单")
    public PageResult pageOrder(Integer page,Integer num,String userId) throws JsonProcessingException {
        return service.pageOrder(page,num,userId);
    }

//    @RequestMapping(value = '/deleteOrder',method = RequestMethod.GET)
//    @ApiOperation("用于删除5分钟内未付款的订单")

    @RequestMapping(value = "/cancelOrder" ,method = RequestMethod.GET)
    @ApiOperation("取消订单")
    public SysResult cancelOrder(String orderId){
        return service.cancelOrder(orderId);
    }

    @RequestMapping(value = "/queryOrderTime",method = RequestMethod.GET)
    @ApiOperation("查询未付款订单是否过期，没过期显示过期时间，过期则取消订单")
    public SysResult queryOrderTime(String orderId){
        return service.queryTime(orderId);
    }

    @RequestMapping(value = "/confirmReceipt",method = RequestMethod.GET)
    @ApiOperation("用于确认收货API")
    public SysResult confirmReceipt(String orderId){
        return service.confirmReceipt(orderId);
    }

    @RequestMapping(value = "/queryOrderDetail",method = RequestMethod.GET)
    @ApiOperation("利用orderID查订单的全部信息")
    public Order queryOrderDetail(String orderId){
        return service.queryOrderDetail(orderId);
    }

    @RequestMapping(value = "/finish",method = RequestMethod.GET)
    @ApiOperation("评价订单完成，订单正式结束")
    public SysResult finishOrder(String orderId){
        return service.finishOrder(orderId);
    }



}
