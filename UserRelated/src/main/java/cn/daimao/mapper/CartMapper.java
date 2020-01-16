package cn.daimao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import pojo.Cart;
import pojo.Person;

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


}
