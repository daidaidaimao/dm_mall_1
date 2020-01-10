package cn.daimao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cn.daimao.mapper")
public class UserStart {
    public static void main(String[] args) {
        SpringApplication.run(UserStart.class,args);
    }
}
