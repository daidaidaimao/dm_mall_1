package cn.daimao.controller;

import cn.daimao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
        try {

            return service.register(user);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,"注册失败 卡了别叫",null);
        }
    }

    @RequestMapping("login")
    public SysResult login(User user, HttpServletRequest request, HttpServletResponse response){
        String ticket = service.login(user);
        if ("".equals(ticket)){
            return SysResult.build(201,"redis连接失败",null);
        }else{
            CookieUtils.setCookie(request,response,"TICKET",ticket);
            return SysResult.ok();
        }

    }
    @RequestMapping("out")
    public SysResult out(HttpServletRequest request,HttpServletResponse response){
        try {
            CookieUtils.deleteCookie(request,response,"TICKET");
            return SysResult.build(200,"退出成功",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,"失败了",null);
        }
    }
    @RequestMapping("query/{ticket}")
    public SysResult queryUser(@PathVariable String ticket){
        String userJson =service.queryJson(ticket);
        if (userJson==null) {
            return SysResult.build(201, "登录失效", null);
        }else{
            return SysResult.build(200,"成功",userJson);
        }
    }



}
