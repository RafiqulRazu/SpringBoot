package com.example.LearningSpring.restcontroller;

import com.example.LearningSpring.entity.ActivityLog;
import com.example.LearningSpring.service.ActivityLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/act/api")
public class ActivityLogRestController {

    @Autowired
    private ActivityLogService activityLogService;

    @GetMapping("/")
    public List<ActivityLog> findAllAct() {
        return activityLogService.findAllAct();
    }

    @PostMapping("/save")
    public void saveAct(@RequestBody ActivityLog act) {
        activityLogService.saveAct(act);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteActById(@PathVariable int id) {
        activityLogService.deleteActById(id);
    }

    @PutMapping("/update")
    public void updateAct(@RequestBody ActivityLog act) {
        activityLogService.saveAct(act);
    }
}
