package com.rafiqul.crmspring.service;


import com.rafiqul.crmspring.entity.*;
import com.rafiqul.crmspring.repository.ActivityRepository;
import com.rafiqul.crmspring.repository.CustomerRepository;
import com.rafiqul.crmspring.repository.LeadRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class LeadService {

    @Autowired
    private LeadRepository leadRepository;

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private ActivityRepository activityRepository;

    @Transactional
    public Lead createLead(Lead lead) {
        Activity existingActivity = activityRepository.findById(lead.getActivity().getId())
                .orElseThrow(() -> new IllegalArgumentException("Activity not found"));
        lead.setCreatedAt(new Date());
        return leadRepository.save(lead);
    }

    public Optional<Lead> getLeadById(Long id) {
        return leadRepository.findById(id);
    }

    public List<Lead> getAllLeads() {
        return leadRepository.findAll();
    }

    // Delete a lead
    @Transactional
    public void deleteLead(Long id) {
        Lead existingLead = leadRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lead not found with id: " + id));

        leadRepository.delete(existingLead);
    }
}
