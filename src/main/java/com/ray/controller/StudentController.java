package com.ray.controller;

import com.ray.entity.Student;
import com.ray.service.StudentService;
import com.ray.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Ray
 * @date 2018/5/27 0027
 * Student 控制器
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 新增学生视图
     */
    @RequestMapping("/addStudentView")
    public ModelAndView addStudentView(){
        ModelAndView modelAndView = new ModelAndView("addStudentView");
        return modelAndView;
    }

    /**
     * 新增学生操作
     */
    @RequestMapping("/addStudent")
    public String addStudent(HttpServletRequest request, HttpServletResponse response){

        Student student = new Student();

        int studentId = Integer.parseInt(request.getParameter("student_id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        Date birthday = null;
        // String 类型按照 yyyy-MM-dd 的格式转换为 java.util.Date 类
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try{
            birthday = simpleDateFormat.parse(request.getParameter("birthday"));
        }catch (Exception e){
            e.printStackTrace();
        }

        student.setStudent_id(studentId);
        student.setName(name);
        student.setAge(age);
        student.setSex(sex);
        student.setBirthday(birthday);

        studentService.addStudent(student);

        return "redirect:listStudent"; // 重定向
    }

    /**
     * 列出所有学生操作
     */
    @RequestMapping("/listStudent")
    public String listStudent(HttpServletRequest request, HttpServletResponse response){

        // 获取分页参数
        int start = 0;
        int count = 10;

        try{
            start = Integer.parseInt(request.getParameter("page.start"));
//            count = Integer.parseInt(request.getParameter("page.count"));
        }catch (Exception e){
            e.printStackTrace();
        }

        Page page = new Page(start, count);

        List<Student> students = studentService.list(page.getStart(), page.getCount());
        int total = studentService.getTotal();
        page.setTotal(total);

        request.setAttribute("students", students);
        request.setAttribute("page", page);

        return "listStudent";
    }

    /**
     * 修改学生信息视图
     */
    @RequestMapping("/editStudent")
    public ModelAndView editStudent(int id){
        ModelAndView modelAndView = new ModelAndView("editStudent");
        Student student = studentService.getStudent(id);
        modelAndView.addObject("student",student);
        return modelAndView;
    }

    /**
     *  修改学生信息操作
     */
    @RequestMapping("/updateStudent")
    public String updateStudent(HttpServletRequest request, HttpServletResponse response){
        Student student = new Student();

        int id = Integer.parseInt(request.getParameter("id"));
        int student_id = Integer.parseInt(request.getParameter("student_id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
        try{
            birthday = simpleDateFormat.parse(request.getParameter("birthday"));
        }catch (Exception e){
            e.printStackTrace();
        }

        student.setId(id);
        student.setStudent_id(student_id);
        student.setName(name);
        student.setAge(age);
        student.setSex(sex);
        student.setBirthday(birthday);

        studentService.updateStudent(student);
        return "redirect:listStudent";
    }

    /**
     *  删除学生信息操作
     */
    @RequestMapping("/deleteStudent")
    public String deleteStudent(int id){
        studentService.deleteStudent(id);
        return "redirect:listStudent";
    }
}
