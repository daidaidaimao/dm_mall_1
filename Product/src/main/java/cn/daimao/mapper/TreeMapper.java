package cn.daimao.mapper;


import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;
import org.springframework.stereotype.Component;
import pojo.Category;
import pojo.Product;

import java.util.List;

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

}
