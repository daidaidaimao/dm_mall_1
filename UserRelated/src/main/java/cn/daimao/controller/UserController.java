package cn.daimao.controller;

import cn.daimao.service.UserService;
import config.LoginMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pojo.Person;
import pojo.User;
import utils.CookieUtils;
import utils.SysResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService service;
    @RequestMapping("register")
    public SysResult register(User user){
//        try {
//            return service.register(user);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SysResult.build(201,"注册失败 卡了别叫",null);
//    }
        return service.register(user);
    }

    @RequestMapping("login")
    public SysResult login(User user, HttpServletRequest request, HttpServletResponse response){
        String ticket = service.login(user);
        if ("".equals(ticket)||ticket.equals(LoginMessage.UserNotExist)||LoginMessage.PassworddError.equals(ticket)){
            return SysResult.build(201,ticket,null);
        }else{
            CookieUtils.setCookie(request,response,"TICKET",ticket);
            return SysResult.build(200, LoginMessage.LoginSuccess,null);
        }
    }
    @RequestMapping("out")
    public SysResult out(String ticket){
            return service.remove(ticket);
    }
    @RequestMapping("query/{ticket}")
    public SysResult queryUser(@PathVariable String ticket,HttpServletRequest request,HttpServletResponse response){
        String userJson =service.queryJson(ticket);
        if (userJson==null) {
            CookieUtils.deleteCookie(request,response,"TICKET");
            return SysResult.build(201, LoginMessage.TimeOut,null);
        }else{
            return SysResult.build(200,LoginMessage.NotTimeOut,userJson);
        }
    }

    @RequestMapping("detail")
    public SysResult initDetail(String username){
        return service.initDetail(username);
    }

    @RequestMapping("addDetail")
    public SysResult addDetail(Person person){
        return service.addDetail(person);
    }

    @RequestMapping("queryUserId")
    public String queryUserId(String username){
        return service.queryUserId(username);
    }
    @RequestMapping("queryUsername")
    public String queryUsername(String userId){
        return service.queryUsername(userId);
    }
}
