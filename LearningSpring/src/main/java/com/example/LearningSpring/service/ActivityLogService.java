package com.example.LearningSpring.service;

import com.example.LearningSpring.entity.ActivityLog;
import com.example.LearningSpring.entity.Customer;
import com.example.LearningSpring.repository.ActivityLogRepository;
import com.example.LearningSpring.repository.CustomerRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ActivityLogService {

    @Autowired
    private ActivityLogRepository activityLogRepository;
    @Autowired
    private CustomerRepository customerRepository;

//    public void saveAct(ActivityLog activityLog) {
//
//        activityLogRepository.save(activityLog);
//    }
//
//    public List<ActivityLog> findAllAct() {
//        return activityLogRepository.findAll();
//    }
//
//    public ActivityLog getActById(int id) {
//        return activityLogRepository.findById(id).get();
//    }
//
//    public void deleteActById(int id) {
//        activityLogRepository.deleteById(id);
//    }


    // Create an Activity Log
//    public ActivityLog createActivityLog(ActivityLog activityLog) {
//        return activityLogRepository.save(activityLog);
//    }

    @Transactional
    public ActivityLog createActivityLog(ActivityLog log) {
        Customer customer = customerRepository.findById(log.getCustomer().getId())
                .orElseThrow(() -> new EntityNotFoundException("Customer not found"));
        log.setCustomer(customer);
        return activityLogRepository.save(log); // Save the activity log with the attached customer
    }


    // List all Activity Logs
    public List<ActivityLog> getAllActivityLogs() {
        return activityLogRepository.findAll();
    }

    // Get an Activity Log by ID
    public Optional<ActivityLog> getActivityLogById(int id) {
        return activityLogRepository.findById(id);
    }

    // Update an existing Activity Log
    public ActivityLog updateActivityLog(int id, ActivityLog updatedActivityLog) {
        Optional<ActivityLog> optionalActivityLog = activityLogRepository.findById(id);
        if (optionalActivityLog.isPresent()) {
            ActivityLog existingActivityLog = optionalActivityLog.get();
            existingActivityLog.setActivityType(updatedActivityLog.getActivityType());
            existingActivityLog.setDescription(updatedActivityLog.getDescription());
            existingActivityLog.setActivityDate(updatedActivityLog.getActivityDate());
            existingActivityLog.setCustomer(updatedActivityLog.getCustomer());
            existingActivityLog.setUser(updatedActivityLog.getUser());
            return activityLogRepository.save(existingActivityLog);
        } else {
            throw new RuntimeException("Activity log not found for id: " + id);
        }
    }

    // Delete an Activity Log
    public void deleteActivityLog(int id) {
        activityLogRepository.deleteById(id);
    }


}
