package cn.daimao.controller;

import cn.daimao.service.UserService;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.google.common.collect.Maps;
import config.LoginMessage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import pojo.Person;
import pojo.ProductComment;
import pojo.User;
import utils.CookieUtils;
import utils.SysResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService service;

    @RequestMapping(value = "register",method = RequestMethod.POST)
    @ApiOperation("简单注册，以后有时间再好好改")
    public SysResult register(User user){
//        try {
//            return service.register(user);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SysResult.build(201,"注册失败 卡了别叫",null);
//    }
        return service.register(user);
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ApiOperation("带redis和各种验证的登陆")
    public SysResult login(User user, HttpServletRequest request, HttpServletResponse response){
        String ticket = service.login(user);
        if ("".equals(ticket)||ticket.equals(LoginMessage.UserNotExist)||LoginMessage.PassworddError.equals(ticket)||LoginMessage.UserBeBaned.equals(ticket)){
            return SysResult.build(201,ticket,null);
        }else{
            CookieUtils.setCookie(request,response,"TICKET",ticket,LoginMessage.LoginTime);
            return SysResult.build(200, LoginMessage.LoginSuccess,null);
        }
    }
    @RequestMapping(value = "out",method = RequestMethod.GET)
    @ApiOperation("用户注销操作")
    public SysResult out(String ticket){
            return service.remove(ticket);
    }

    @RequestMapping(value = "query/{ticket}",method = RequestMethod.GET)
    @ApiOperation("向redis中查询登陆验证是否还在，在就续约，不在就踢下线")
    public SysResult queryUser(@PathVariable String ticket,HttpServletRequest request,HttpServletResponse response){
        String userJson =service.queryJson(ticket);
        if (userJson==null) {
            CookieUtils.deleteCookie(request,response,"TICKET");
            return SysResult.build(201, LoginMessage.TimeOut,null);
        }else{
//            CookieUtils.setCookie(request,response,"TICKET",ticket,LoginMessage.LoginTime);
            return SysResult.build(200,LoginMessage.NotTimeOut,userJson);
        }
    }

    @RequestMapping(value = "detail",method = RequestMethod.GET)
    @ApiOperation("查询个人用户的详细信息")
    public SysResult initDetail(String userId){
        return service.initDetail(userId);
    }

    @RequestMapping(value = "partDetail",method = RequestMethod.GET)
    @ApiOperation("查看用户的部分详细信息，别问我这个有什么用")
    public SysResult partDetail(String userId){
        return service.partDetail(userId);
    }

    @RequestMapping(value = "addDetail",method = RequestMethod.POST)
    @ApiOperation("用于用户完善个人详细信息")
    public SysResult addDetail(Person person){
        return service.addDetail(person);
    }

    @RequestMapping(value = "queryUserId",method = RequestMethod.GET)
    @ApiOperation("用username 查 userId")
    public String queryUserId(String username){
        return service.queryUserId(username);
    }
    @RequestMapping(value = "queryUsername",method = RequestMethod.GET)
    @ApiOperation("用UserID查Username")
    public String queryUsername(String userId){
        return service.queryUsername(userId);
    }
    @RequestMapping(value = "showUser",method = RequestMethod.GET)
    @ApiOperation("用于后台显示所有用户")
    public SysResult showUser(){
        return service.showUser();
    }

    @RequestMapping(value = "/OnlineUser",method = RequestMethod.GET)
    @ApiOperation("判断用户是否在线")
    public SysResult OnlineUser(String userId){
        return service.OnlineUser(userId);
    }

    @RequestMapping(value = "/addComment", method = RequestMethod.POST)
    @ApiOperation("用户评论商品功能")
    public SysResult addComment(ProductComment comment){
        return service.addComment(comment);
    }

    @RequestMapping(value = "/showCommentProduct",method = RequestMethod.GET)
    @ApiOperation("前台商品显示所有评价")
    public List<ProductComment> showCommentProduct(String productId){
        return service.showCommentProduct(productId);
    }

    @RequestMapping(value = "/whetherComment",method = RequestMethod.GET)
    @ApiOperation("判断用户是否已经评论过该订单")
    public SysResult whetherComment(String userId,String orderId){
        return service.whetherComment(userId,orderId);
    }

    @RequestMapping(value = "/changeStatus",method = RequestMethod.GET)
    @ApiOperation("封禁/解封用户")
    public SysResult changeStatus(String userId){
        return service.changeStatus(userId);
    }

    @RequestMapping(value="/alipay",method = RequestMethod.GET)
    @ApiOperation("支付宝付款沙箱测试")
    public SysResult aliPay(String orderId,String pName,Double orderMoney) throws AlipayApiException {
        return service.aliPay(orderId,pName,orderMoney);
    }

    @RequestMapping(value = "/recommend",method = RequestMethod.GET)
    @ApiOperation("基于用户的协同过滤推荐算法")
    public SysResult recommend(String logUserId){
        return service.recommend(logUserId);
    }


}
