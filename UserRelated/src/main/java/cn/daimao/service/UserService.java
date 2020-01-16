package cn.daimao.service;

import cn.daimao.mapper.UserMapper;
import com.fasterxml.jackson.core.JsonProcessingException;
import config.LoginMessage;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.StringRedisTemplate;

import org.springframework.stereotype.Service;
import pojo.Person;
import pojo.User;
import utils.MapperUtils;
import utils.SysResult;


import java.util.Date;
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
        Integer exist;
        try {
            exist = mapper.queryByName(user.getUsername());
            if (exist == 0){
                Person p = new Person();
                p.setUsername(user.getUsername());
//                Date data = new Date();
                p.setCreateTime(new Date());
                mapper.addDetail(p);
                mapper.addUser(user);
                return SysResult.build(200,LoginMessage.RegisterSuccess,null);
            }else{
                return SysResult.build(201,LoginMessage.RegisterFail+"原因是:"+LoginMessage.UserExist,null);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(202,LoginMessage.RegisterFail+"原因是"+e.toString(),null) ;
        }
    }

    public String login(User user) {
        User exist = mapper.queryExist(user);
        Integer u =mapper.queryByName(user.getUsername());
        if (exist == null ){
            if (u ==0){
                return LoginMessage.UserNotExist;
            }else{
                return LoginMessage.PassworddError;
            }
        }else{
//            String userloginlock = "user_login_lock_"+exist.getUserId();
            String ticket ="TICKET"+UUID.randomUUID().toString()+exist.getUsername();
//            if (redisTemplate.hasKey(userloginlock)){
//                String oldticket = redisTemplate.opsForValue().get(userloginlock);
//                redisTemplate.delete(oldticket);
//            }
//            String nTicket = "TICKET"+System.currentTimeMillis()+exist.getUsername();
//            redisTemplate.opsForValue().set(userloginlock,ticket,200, TimeUnit.SECONDS);
            try {
                String userJson = MapperUtils.MP.writeValueAsString(exist);
                redisTemplate.opsForValue().set(ticket,userJson,200,TimeUnit.SECONDS);
                return ticket;
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return e.toString();
            }
        }
    }

    public String queryJson(String ticket) {
        Long lefttime = redisTemplate.getExpire(ticket);
        String userJson = redisTemplate.opsForValue().get(ticket);
        if (lefttime!=null&&userJson!=null){
        try {
//            User user =MapperUtils.MP.readValue(userJson,User.class);
            Long leasetime = (long) 60;
            if (lefttime<=leasetime){
                lefttime = lefttime + 60*3L;
                redisTemplate.expire(ticket,lefttime,TimeUnit.SECONDS);
//                redisTemplate.expire("user_login_lock_"+user.getUserId(),lefttime,TimeUnit.SECONDS);
            }
            return userJson;
        } catch (Exception e) {
            e.printStackTrace();
            return e.toString();
        }
        }else{
            return null;
        }
    }

    public SysResult initDetail(String username) {
        try {
            Person person = mapper.queryDetail(username);
            return SysResult.build(200,LoginMessage.DetailSuccess,person);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,LoginMessage.DetailFail+e.toString(),null);
        }
    }

    public SysResult addDetail(Person person) {
        try {
            person.setAvatarUrl("");
            mapper.editDetail(person);
            return SysResult.build(200,LoginMessage.AddDetailSuccess,null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,LoginMessage.AddDetailFail+e.toString(),null);
        }
    }

    public SysResult remove(String ticket) {
        redisTemplate.expire(ticket,0,TimeUnit.SECONDS);
        return SysResult.build(200,"退出成功",null);

    }

    public String queryUsername(String userId) {
        return mapper.queryUsername(userId);
    }

    public String queryUserId(String username) {
        return mapper.queryUserId(username);
    }

    public SysResult partDetail(String username) {
        Person p = mapper.partDetail(username);
        return SysResult.build(200,"",p);
    }
}
