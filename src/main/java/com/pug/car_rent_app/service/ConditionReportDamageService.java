package com.pug.car_rent_app.service;

import com.pug.car_rent_app.model.condition_report.ConditionReportDamage;
import com.pug.car_rent_app.repository.ConditionReportDamageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConditionReportDamageService {

    @Autowired
    private ConditionReportDamageRepository repository;

    public void addDamageToReport(ConditionReportDamage damage) {
        repository.insert(damage);
    }

    public List<ConditionReportDamage> getDamagesForReport(int reportId) {
        return repository.findByReportId(reportId);
    }

    public void insertDamage(ConditionReportDamage damage) {
        repository.insert(damage);
    }
}
