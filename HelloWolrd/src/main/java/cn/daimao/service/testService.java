package cn.daimao.service;

import cn.daimao.mapper.testMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Student;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class testService {

    @Autowired
    private testMapper test ;
    public void testFromService(){
        System.out.println(23333);
    }

    public List<Student> getData() {
        return test.getAll();
    }


    public List<Student> register(Student student) {
        return test.register(student);
    }



    public Boolean login(String username, String password, HttpServletRequest request) {
        Boolean b = test.login(username,password);
        if (b){
            request.getSession().setAttribute("userinfo",username+"-"+password);
            return b;
        }else{
            return false;
        }
    }
}
