package com.pug.car_rent_app.service;

import com.pug.car_rent_app.model.condition_report.DamageType;
import com.pug.car_rent_app.repository.DamageTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DamageTypeService {

    @Autowired
    private DamageTypeRepository repository;

    @Autowired
    private ConditionReportDamageService damageService;

    // Get all available damage types
    public List<DamageType> getAllDamageTypes() {
        return repository.findAll();
    }

}
