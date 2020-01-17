package cn.daimao.controller;

import cn.daimao.service.CartService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
import pojo.Cart;
import pojo.Order;
import pojo.OrderItem;
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

    @RequestMapping("addCart")
    public SysResult addCart(Cart cart){
        return service.addCart(cart);
    }

    @RequestMapping("showCart")
    public SysResult showCart(String username){
        return service.showCart(username);
    }

    @RequestMapping("deleteCart")
    public SysResult deleteCart(Integer id){
        return service.deleteCart(id);
    }

    @RequestMapping("updateNum")
    public SysResult updateNum(Integer productNum,Integer id){
        return service.updateNum(productNum,id);
    }

    @RequestMapping("addOrder")
    public SysResult addOrder(Order order) throws IOException {
        return service.addOrder(order);
    }

    @RequestMapping("queryOrder")
    public SysResult queryOrder(String userId) throws JsonProcessingException {
        return service.queryOrder(userId);
    }


}
