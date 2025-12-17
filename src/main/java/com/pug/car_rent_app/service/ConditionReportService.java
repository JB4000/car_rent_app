package com.pug.car_rent_app.service;

import com.pug.car_rent_app.model.condition_report.ConditionReport;
import com.pug.car_rent_app.repository.ConditionReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class ConditionReportService {

    @Autowired
    private ConditionReportRepository conditionReportRepository;

    public List<ConditionReport> getAllConditionReports() {
        return conditionReportRepository.getAllConditionReports();
    }

    @Transactional
    public void insertConditionReport(ConditionReport report) {
        conditionReportRepository.insertConditionReport(report);
    }

    public Integer getLatestConditionReportIdForCar(int carId) {
        return conditionReportRepository.findLatestConditionReportIdByReturnId(carId);
    }
}
