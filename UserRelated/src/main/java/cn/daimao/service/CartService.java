package cn.daimao.service;

import cn.daimao.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Cart;
import utils.SysResult;

import java.util.List;

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
            return SysResult.build(201,e.toString(),null);
        }
    }

    public SysResult deleteCart(Integer id) {
        try {
            mapper.deleteCart(id);
            return SysResult.build(200,"",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }
    }


    public SysResult updateNum(Integer productNum,Integer id) {
        try {
            mapper.updateNum(productNum,id);
            return SysResult.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),null);
        }

    }
}
