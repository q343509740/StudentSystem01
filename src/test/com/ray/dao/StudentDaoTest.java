package com.ray.dao;

import com.ray.entity.Student;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * @author Ray
 * @date 2018/5/27 0027
 */
public class StudentDaoTest extends BaseTest {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StudentDao studentDao;

    /**
     * 查询数据条目
     */
    @Test
    public void getTotal() {
        int count;
        count = studentDao.getTotal();
        System.out.println(count);
    }

    /**
     * 增加数据
     */
    @Test
    public void addStudent() {
        for (int i = 0; i < 20; i++){
            Student student = new Student();
            student.setStudent_id(i);
            student.setName("Ray" + i);
            student.setSex("男");
            student.setAge(17 + i);
            student.setBirthday(new Date());
            studentDao.addStudent(student);
        }
    }

    /**
     * 删除一条数据
     */
    @Test
    public void deleteStudent() {
        studentDao.deleteStudent(1);
    }

    /**
     * 更新一条数据
     */
    @Test
    public void updateStudent() {
        Student student = new Student();
        student.setId(1);
        student.setStudent_id(3);
        student.setName("Ray3");
        student.setSex("男");
        student.setAge(18);
        student.setBirthday(new Date());
        studentDao.updateStudent(student);
    }

    /**
     * 根据id查询一条数据
     */
    @Test
    public void getStudent() {

        Student student = studentDao.getStudent(1);
        System.out.println(student);
    }

    @Test
    public void list() {
    }
}