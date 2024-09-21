package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.ActivityLog;
import com.example.LearningSpring.entity.Customer;
import com.example.LearningSpring.repository.ActivityLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityLogService {

    @Autowired
    private ActivityLogRepository activityLogRepository;

    public void saveAct(ActivityLog activityLog) {

        activityLogRepository.save(activityLog);
    }

    public List<ActivityLog> findAllAct() {
        return activityLogRepository.findAll();
    }

    public ActivityLog getActById(int id) {
        return activityLogRepository.findById(id).get();
    }

    public void deleteActById(int id) {
        activityLogRepository.deleteById(id);
    }


}
