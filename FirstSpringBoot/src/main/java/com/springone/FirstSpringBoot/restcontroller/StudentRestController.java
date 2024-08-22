package com.springone.FirstSpringBoot.restcontroller;

import com.springone.FirstSpringBoot.entity.Student;
import com.springone.FirstSpringBoot.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("student/api")
public class StudentRestController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/")
    public List<Student> getAllStudent() {
        return studentService.getAll();
    }

    @PostMapping("/save")
    public void saveStudent(@RequestBody Student s) {
        studentService.saveStu();
    }
}
