package cn.daimao.mapper;

import org.springframework.stereotype.Component;
import pojo.Person;
import pojo.ProductComment;
import pojo.User;

import java.util.List;

//import javax.xml.soap.Detail;

@Component
public interface UserMapper {
    void addUser(User user);

    User queryExist(User user);

    Integer queryByName(String username);

    void addDetail(Person person);

    Person queryDetail(String userId);

    void editDetail(Person person);

    String queryUsername(String userId);

    String queryUserId(String username);

    Person partDetail(String userId);

    List<User> showUser();

    void addComment(ProductComment comment);

    List<ProductComment> showCommentProduct(String productId);
}
