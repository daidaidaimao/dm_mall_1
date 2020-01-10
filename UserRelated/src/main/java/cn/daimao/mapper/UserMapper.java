package cn.daimao.mapper;

import org.springframework.stereotype.Component;
import pojo.User;

@Component
public interface UserMapper {
    void addUser(User user);

    User queryExist(User user);

    Integer queryByName(String username);
}
