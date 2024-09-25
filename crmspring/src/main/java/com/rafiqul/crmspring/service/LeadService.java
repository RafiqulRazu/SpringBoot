package com.rafiqul.crmspring.service;

import com.rafiqul.crmspring.entity.Lead;
import com.rafiqul.crmspring.repository.LeadRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class LeadService {

    @Autowired
    private LeadRepository leadRepository;

    @Transactional
    public Lead createLead(Lead lead) {
        lead.setCreatedAt(LocalDate.now());
        lead.setUpdatedAt(LocalDate.now());
        lead.setStatus("New"); // Default status for new leads
        return leadRepository.save(lead);
    }

    public Optional<Lead> getLeadById(Long id) {
        return leadRepository.findById(id);
    }

    public List<Lead> getAllLeads() {
        return leadRepository.findAll();
    }

    @Transactional
    public Lead updateLead(Long id, Lead leadDetails) {
        Lead existingLead = leadRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lead not found with id: " + id));

        // Update fields
        existingLead.setName(leadDetails.getName());
        existingLead.setEmail(leadDetails.getEmail());
        existingLead.setPhone(leadDetails.getPhone());
        existingLead.setAddress(leadDetails.getAddress());
        existingLead.setCompany(leadDetails.getCompany());
        existingLead.setUser(leadDetails.getUser());  // Assigned Sales Executive/Agent
        existingLead.setStatus(leadDetails.getStatus());
        existingLead.setUpdatedAt(LocalDate.now());

        return leadRepository.save(existingLead);
    }

    @Transactional
    public void deleteLead(Long id) {
        Lead existingLead = leadRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Lead not found with id: " + id));

        leadRepository.delete(existingLead);
    }
}
