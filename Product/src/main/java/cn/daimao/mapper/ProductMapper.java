package cn.daimao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import pojo.Category;
import pojo.Product;

import java.util.List;

@Component
public interface ProductMapper {
    List<Product> queryAll();

    void add(Product product);

    void delete(String productId);

    Integer update(Product p);

    Product queryOne(String productId);

    List<Product> fenye(@Param("start") Integer start,@Param("num") Integer num);

    Integer total();

    Category queryNode(Integer id);

    String queryParent(Integer id);
}
