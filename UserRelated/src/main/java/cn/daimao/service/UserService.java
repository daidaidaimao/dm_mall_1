package cn.daimao.service;

import cn.daimao.mapper.UserMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.StringRedisTemplate;

import org.springframework.stereotype.Service;
import pojo.User;
import utils.MapperUtils;
import utils.SysResult;

import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
public class UserService {
    @Autowired
    private UserMapper mapper;
    @Autowired
    private StringRedisTemplate redisTemplate;
    public SysResult register(User user) {
        user.setUserId(UUID.randomUUID().toString());
        Integer exist = mapper.queryByName(user.getUsername());
        if (exist == 0){
            mapper.addUser(user);
            return SysResult.ok();
        }else{
            return SysResult.build(201,"用户已经存在",null);
        }
    }

    public String login(User user) {
        User exist = mapper.queryExist(user);
        if (exist == null){
            return "";
        }else{
            String userloginlock = "user_login_lock_"+exist.getUserId();
            String ticket ="TICKET"+System.currentTimeMillis()+exist.getUsername();

            if (redisTemplate.hasKey(userloginlock)){
                String oldticket = redisTemplate.opsForValue().get(userloginlock);
                redisTemplate.delete(oldticket);
            }
            redisTemplate.opsForValue().set(userloginlock,ticket,200, TimeUnit.SECONDS);
            try {
                String userJson = MapperUtils.MP.writeValueAsString(exist);
                redisTemplate.opsForValue().set(ticket,userJson,200,TimeUnit.SECONDS);

                return ticket;
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return "";
            }
        }
    }

    public String queryJson(String ticket) {
        Long lefttime = redisTemplate.getExpire(ticket);
        String userJson = redisTemplate.opsForValue().get(ticket);
        try {
            User user =MapperUtils.MP.readValue(userJson,User.class);
            Long leasetime = (long) 60;
            if (lefttime<=leasetime){
                lefttime = lefttime + 60*3L;
                redisTemplate.expire(ticket,lefttime,TimeUnit.SECONDS);
                redisTemplate.expire("user_login_lock_"+user.getUserId(),lefttime,TimeUnit.SECONDS);
            }
            return userJson;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
