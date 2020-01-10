package cn.daimao.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import pojo.Student;

import java.util.List;

@Component
public interface testMapper {
    List<Student> getAll();


    List<Student> register(Student student);


    Boolean login(@Param("username") String username, @Param("password") String password);
}
