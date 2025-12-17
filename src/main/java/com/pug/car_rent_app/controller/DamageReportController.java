package com.pug.car_rent_app.controller;

import com.pug.car_rent_app.model.condition_report.ConditionReportDamage;
import com.pug.car_rent_app.model.condition_report.DamageType;
import com.pug.car_rent_app.service.ConditionReportDamageService;
import com.pug.car_rent_app.service.ConditionReportService;
import com.pug.car_rent_app.service.DamageTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/condition_report")
public class DamageReportController {

    @Autowired
    private ConditionReportDamageService damageService;

    @Autowired
    private DamageTypeService damageTypeService;

    @Autowired
    private ConditionReportService conditionReportService;

    @GetMapping("/damage")
    public String showDamageForm(@RequestParam("carId") int carId, Model model) {
        Integer reportId = conditionReportService.getLatestConditionReportIdForCar(carId);
        if (reportId == null) {
            return "redirect:/workshop";
        }

        List<DamageType> damageTypes = damageTypeService.getAllDamageTypes();
        ConditionReportDamage damage = new ConditionReportDamage();

        model.addAttribute("damage", damage);
        model.addAttribute("damageTypes", damageTypes);
        model.addAttribute("reportId", reportId);

        return "condition_report/damage";
    }

    @PostMapping("/damage")
    public String handleDamageForm(
            @RequestParam("reportId") int reportId,
            @RequestParam(value = "damageTypeId", required = false) List<Integer> damageTypeIds,
            @RequestParam(value = "quantity", required = false) List<Integer> quantities,
            @RequestParam(value = "comment", required = false) List<String> comments
    ) {

        // Save all damages
        if (damageTypeIds != null) {
            for (int i = 0; i < damageTypeIds.size(); i++) {
                ConditionReportDamage damage = new ConditionReportDamage();
                damage.setReportId(reportId);
                damage.setDamageTypeId(damageTypeIds.get(i));
                damage.setQuantity(quantities.get(i));
                damage.setComment(comments.get(i));
                damageService.insertDamage(damage);
            }
        }

        return "redirect:/workshop";
    }


}

