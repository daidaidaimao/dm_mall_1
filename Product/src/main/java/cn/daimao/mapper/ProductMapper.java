package cn.daimao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import pojo.Category;
import pojo.Product;

import java.util.List;

@Component
public interface ProductMapper {
    List<Product> queryAll();

    List<Product> queryFront();

    void add(Product product);

    void delete(String productId);

    Integer update(Product p);

    Product queryOne(String productId);

    List<Product> fenye(@Param("start") Integer start,@Param("num") Integer num);

    List<Product> fenyeFront(@Param("start") Integer start,@Param("num")Integer num);

    Integer total();

    Integer totalFront();

    Category queryNode(Integer id);

    String queryParent(Integer id);
}
