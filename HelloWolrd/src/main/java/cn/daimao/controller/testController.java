package cn.daimao.controller;

import cn.daimao.service.testService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pojo.Student;
import utils.SysResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class testController {
@Autowired
private testService test ;



    @RequestMapping("/test")
    public String doSomeTest(){
        return "HelloWorld";
    }

    @RequestMapping("/test32")
    public void fromService(){
        test.testFromService();
    }

    @RequestMapping("/student/getdata")
    public List<Student> getData(){
        return test.getData();
    }

    @RequestMapping("/student/register")
    public List<Student> register(Student student) {return test.register(student);}

    @RequestMapping("/student/login")
    public Boolean login(String username, String password, HttpServletRequest request){
        return test.login(username,password,request);
    }

    @RequestMapping("/student/loginout")
    public String loginout(HttpServletRequest request){
        HttpSession session =request.getSession();
        session.removeAttribute("userinfo");
        Object userInfo =session.getAttribute("userinfo");
        if (userInfo==null) {
            return "退出成功";
        }else {
            return "失败";
        }
    }

}
