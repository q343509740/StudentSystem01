package com.ray.service;

import com.ray.entity.Student;

import java.util.List;

/**
 * @author Ray
 * @date 2018/5/27 0027
 * Service 层我们可以增加一些非 CRUD 的方法去更好的完成本身抽离出来的 service 服务
 */
public interface StudentService {

    /**
     * 获取到 Student 的总数
     * @return
     */
    int getTotal();

    /**
     * 增加一条数据
     * @param student
     */
    void addStudent(Student student);

    /**
     * 删除一条数据
     * @param id
     */
    void deleteStudent(int id);

    /**
     * 更新一条数据
     * @param student
     */
    void updateStudent(Student student);

    /**
     * 找到一条数据
     * @param id
     * @return
     */
    Student getStudent(int id);

    /**
     * 列举出从 start 位置开始的 count 条数据
     * @param start
     * @param count
     * @return
     */
    List<Student> list(int start, int count);
}
