package cn.daimao.mapper;

import org.springframework.stereotype.Component;
import pojo.Person;
import pojo.User;

//import javax.xml.soap.Detail;

@Component
public interface UserMapper {
    void addUser(User user);

    User queryExist(User user);

    Integer queryByName(String username);

    void addDetail(Person person);

    Person queryDetail(String username);

    void editDetail(Person person);

    String queryUsername(String userId);

    String queryUserId(String username);

    Person partDetail(String username);
}
