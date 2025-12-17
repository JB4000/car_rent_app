package com.pug.car_rent_app.repository;

import com.pug.car_rent_app.mapper.ConditionReportDamageMapper;
import com.pug.car_rent_app.model.condition_report.ConditionReportDamage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ConditionReportDamageRepository {

    @Autowired
    private JdbcTemplate template;

    public void insert(ConditionReportDamage damage) {
        String sql = """
                INSERT INTO condition_report_damages
                (report_id, damage_type_id, quantity, comment)
                VALUES (?, ?, ?, ?)
                """;

        template.update(
                sql,
                damage.getReportId(),
                damage.getDamageTypeId(),
                damage.getQuantity(),
                damage.getComment()
        );
    }

    public List<ConditionReportDamage> findByReportId(int reportId) {
        String sql = """
                SELECT crd.*,
                       dt.id AS dt_id, dt.damage_code, dt.description, dt.standard_price
                FROM condition_report_damages crd
                JOIN damage_types dt ON crd.damage_type_id = dt.id
                WHERE crd.report_id = ?
                """;

        return template.query(sql, new ConditionReportDamageMapper(), reportId);
    }
}
