package cn.daimao.mapper;


import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Component;
import pojo.Category;
import pojo.OrderDaily;
import pojo.Product;

import java.util.List;
import java.util.Map;

@Component
public interface TreeMapper {
    List<Category> showAll();

    List<Product> queryByCate(@Param("productCategory") Integer productCategory);
    Integer total(Integer productCategory);

    void addNode(@Param("id") Integer id,@Param("parentId") Integer parentId,@Param("name") String name);

    void deleteNode(Integer id);

    List<Category> queryParent(Integer id);

    Category query(Integer id);

    String queryChild(Integer id);

    List<Integer> getFirst();
    Integer getSale(Integer id);
    String getCateName(Integer id);
    Category getId(String name);
    List<OrderDaily> echartsOrder();
}
