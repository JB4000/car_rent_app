package com.pug.car_rent_app.repository;

import com.pug.car_rent_app.mapper.DamageTypeMapper;
import com.pug.car_rent_app.model.condition_report.DamageType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DamageTypeRepository {

    @Autowired
    private JdbcTemplate template;

    public List<DamageType> findAll() {
        String sql = """
                SELECT id, damage_code, description, standard_price
                FROM damage_types
                ORDER BY damage_code
                """;
        return template.query(sql, new DamageTypeMapper());
    }
}
