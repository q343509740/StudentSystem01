package com.ray.dao;

import com.ray.entity.Student;

import java.util.List;

/**
 * @author Ray
 * @date 2018/5/27 0027
 * DAO，即 Date Access Object，数据库访问对象
 * 对数据库相关操作的封装
 */
public interface StudentDao {

    int getTotal(); //查询数据条目
    void addStudent(Student student); //增加一条数据
    void deleteStudent(int id); //删除一条数据
    void updateStudent(Student student); //更新一条数据
    Student getStudent(int id); //根据id查询一条数据
    List<Student> list(int start,int count); //查询从start位置开始的count条数据
}
