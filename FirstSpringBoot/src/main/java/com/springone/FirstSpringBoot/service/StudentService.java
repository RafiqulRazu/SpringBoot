package com.springone.FirstSpringBoot.service;

import com.springone.FirstSpringBoot.entity.Student;
import com.springone.FirstSpringBoot.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public void saveStu(Student s) {
        studentRepository.save(s);
    }

    public List<Student> getAll() {
        return studentRepository.findAll();
    }

    public void deleteById(int id) {
        studentRepository.deleteById(id);
    }

    public Student findById(int id) {
        return studentRepository.findById(id).get();
    }
}
