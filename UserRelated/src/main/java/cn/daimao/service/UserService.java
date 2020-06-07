package cn.daimao.service;

import cn.daimao.config.AlipayConfig;
import cn.daimao.mapper.UserMapper;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import config.LoginMessage;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.StringRedisTemplate;

import org.springframework.stereotype.Service;
import pojo.*;
import utils.MapperUtils;
import utils.SysResult;


import java.util.*;
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
                p.setUserId(user.getUserId());
//                Date data = new Date();
                p.setCreateTime(new Date());
                user.setStatus(1);
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

    public String
    login(User user) {
        User exist = mapper.queryExist(user);
        Integer u =mapper.queryByName(user.getUsername());
        if( exist !=null && exist.getStatus() ==0){
            return LoginMessage.UserBeBaned;
        }
        if (exist == null ){
            if (u ==0){
                return LoginMessage.UserNotExist;
            }else{
                return LoginMessage.PassworddError;
            }
        }else{
//            String userloginlock = "user_login_lock_"+exist.getUserId();
//            String ticket ="TICKET"+UUID.randomUUID().toString()+exist.getUsername();
            String ticket = exist.getUserId();
//            if (redisTemplate.hasKey(userloginlock)){
//                String oldticket = redisTemplate.opsForValue().get(userloginlock);
//                redisTemplate.delete(oldticket);
//            }
//            String nTicket = "TICKET"+System.currentTimeMillis()+exist.getUsername();
//            redisTemplate.opsForValue().set(userloginlock,ticket,200, TimeUnit.SECONDS);
            //                String userJson = MapperUtils.MP.writeValueAsString(exist);
            redisTemplate.opsForValue().set(ticket,user.getIdentity(),LoginMessage.LoginTime,TimeUnit.SECONDS);
            return ticket;
        }
    }

    public String queryJson(String ticket) {
        Long lefttime = redisTemplate.getExpire(ticket);
        String userJson = redisTemplate.opsForValue().get(ticket);
        if (lefttime!=null&&userJson!=null){
        try {
//            User user =MapperUtils.MP.readValue(userJson,User.class);
            Long leasetime = (long) 200;
            if (lefttime<=leasetime){
                lefttime = lefttime + 200*3L;
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

    public SysResult initDetail(String userId) {
        try {

            Person person = mapper.queryDetail(userId);
            return SysResult.build(200,LoginMessage.DetailSuccess,person);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,LoginMessage.DetailFail+e.toString(),null);
        }
    }

    public SysResult addDetail(Person person) {
        try {
            //person.setAvatarUrl("");
            mapper.editDetail(person);
            return SysResult.build(200,LoginMessage.AddDetailSuccess,null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,LoginMessage.AddDetailFail+e.toString(),null);
        }
    }

    public SysResult remove(String ticket) {
        try {
            redisTemplate.expire(ticket,0,TimeUnit.SECONDS);
            return SysResult.build(200,LoginMessage.LoginOutSuccess,null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,LoginMessage.LoginOutFail+e.toString(),null);
        }
//        return SysResult.build(200,"退出成功",null);

    }

    public String queryUsername(String userId) {
        return mapper.queryUsername(userId);
    }

    public String queryUserId(String userId) {
        return mapper.queryUserId(userId);
    }

    public SysResult partDetail(String userId) {
//        String userId = mapper.queryUsername(username);
        Person p = mapper.partDetail(userId);
        return SysResult.build(200,"",p);
    }

    public SysResult showUser() {
        try {
            List<User> list = mapper.showUser();
            return SysResult.build(200,"",list);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,e.toString(),"");
        }
    }

    public SysResult OnlineUser(String userId) {
        String s = redisTemplate.opsForValue().get(userId);
        Long expire = redisTemplate.getExpire(userId, TimeUnit.SECONDS);
        if ( expire ==0 || s ==null){
            return SysResult.build(201,"离线",null);
        }else{
            return SysResult.build(200,"在线",null);
        }

    }

    public SysResult addComment(ProductComment comment) {
        comment.setCreateTime(new Date());
        comment.setCommentId(UUID.randomUUID().toString());
        Person person = mapper.queryDetail(comment.getUserId());
        comment.setUserName(person.getName());
        try {
            mapper.addComment(comment);
            return SysResult.build(200,"success",null);
        } catch (Exception e) {
            e.printStackTrace();
            return SysResult.build(201,"fail"+e.toString(),null);
        }

    }

    public List<ProductComment> showCommentProduct(String productId) {
        List<ProductComment> list =  mapper.showCommentProduct(productId);
        for(ProductComment p :list){
            String userId = p.getUserId();
            Person person = mapper.queryDetail(userId);
            p.setAurl(person.getAvatarUrl());
        }
        return list;
    }

    public SysResult whetherComment(String userId, String orderId) {
        Integer num = mapper.countComment(userId,orderId);
        List<OrderItem> list = mapper.queryOrderItem(orderId);
        if (num == list.size()){
            return SysResult.build(300,"已经全部评论完",num);
        }else {
            return SysResult.build(200, "尚未评价完", num);
        }
//
//        if (num == 0){
//            return SysResult.build(200,"尚未评论",num);
//        }else {
//            return SysResult.build(202,"只准评论1次！",null);
//        }
    }

    public SysResult changeStatus(String userId) {
        User user = mapper.queryByUserId(userId);
        if (user.getStatus() == 1){
            mapper.changStatus(userId,0);
        }else{
            mapper.changStatus(userId,1);
        }
        return SysResult.build(200,"",null);
    }

    public SysResult aliPay(String orderId, String pName, Double orderMoney) throws AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json",
                AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        //付款金额，必填
        String total_amount = orderMoney.toString();
        //订单名称，必填
        //商品描述，可空
        String body = "商品描述";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderId + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + pName + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return SysResult.build(200,"",result);
    }


    public SysResult recommend(String logUserId) {
        List<User> uList = mapper.showUser();

        Map<String,Double> result = new HashMap<>();
        // 交集 和并集 的个数
        for(User u : uList){
            int intersection = 0;
            int unio = 0;
            int diffSet = 0;
            //拿到非当前登录用户进行比较
            if(!u.getUserId().equals(logUserId)){
                String tUserId = u.getUserId();
                String temp = "";

                List<Order> lorder = mapper.queryOrder(logUserId);
                List<Order> torder = mapper.queryOrder(tUserId);
                Map<String,Integer> lmap = getpList(lorder);
                Map<String,Integer> tmap = getpList(torder);
                for(String key1 : lmap.keySet()){
                    if(tmap.containsKey(key1)){
                        intersection++;
                    }else{
                        diffSet++;
                    }
                }
                for(String key2: tmap.keySet()){
                    if(!lmap.containsKey(key2)){
                        diffSet++;
                        temp = key2+","+temp;
                    }
                }
                unio = intersection + diffSet;
                double res  = (double) intersection / unio ;
                result.put(temp,res);
            }
        }
        List<Map.Entry<String,Double>> list = new ArrayList<>(result.entrySet());
        list.sort(Map.Entry.comparingByValue(Comparator.reverseOrder()));
        return SysResult.build(200,"",list);

    }

    public Map<String,Integer> getpList(List<Order> list){
//        List<Product> result ;
        Map<String,Integer> map = new HashMap<>();
        for (Order o :list){
            List<OrderItem> plist = mapper.queryOrderItem(o.getOrderId());
            for(OrderItem p : plist){
                if(!map.containsKey(p.getProductId())) {
                    map.put(p.getProductId(), p.getProductNum());
                }else{
                    Integer value = map.get(p.getProductId())+p.getProductNum();
                    map.put(p.getOrderId(),value);
                }
            }
        }
        return map;
    }
}
