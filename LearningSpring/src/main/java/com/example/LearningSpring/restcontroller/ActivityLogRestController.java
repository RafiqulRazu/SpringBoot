package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.ActivityLog;
import com.example.LearningSpring.service.ActivityLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/act")
public class ActivityLogRestController {

    @Autowired
    private ActivityLogService activityLogService;

//    @GetMapping("/")
//    public List<ActivityLog> findAllAct() {
//
//        return activityLogService.findAllAct();
//    }
//
//    @PostMapping("/save")
//    public void saveAct(@RequestBody ActivityLog act) {
//
//        activityLogService.saveAct(act);
//    }
//
//    @DeleteMapping("/delete/{id}")
//    public void deleteActById(@PathVariable int id) {
//
//        activityLogService.deleteActById(id);
//    }
//
//    @PutMapping("/update")
//    public void updateAct(@RequestBody ActivityLog act) {
//
//        activityLogService.saveAct(act);
//    }


    @PostMapping("/save")
    public ResponseEntity<ActivityLog> createActivityLog(@RequestBody ActivityLog activityLog) {
        ActivityLog createdActivityLog = activityLogService.createActivityLog(activityLog);
        return ResponseEntity.ok(createdActivityLog);
    }

    @GetMapping("/")
    public List<ActivityLog> getAllActivityLogs() {
        return activityLogService.getAllActivityLogs();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ActivityLog> getActivityLogById(@PathVariable int id) {
        return activityLogService.getActivityLogById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PutMapping("update/{id}")
    public ResponseEntity<ActivityLog> updateActivityLog(@PathVariable int id, @RequestBody ActivityLog activityLog) {
        return ResponseEntity.ok(activityLogService.updateActivityLog(id, activityLog));
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity<Void> deleteActivityLog(@PathVariable int id) {
        activityLogService.deleteActivityLog(id);
        return ResponseEntity.noContent().build();
    }
}
