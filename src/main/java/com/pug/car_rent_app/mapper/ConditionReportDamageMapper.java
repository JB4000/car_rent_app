package com.pug.car_rent_app.mapper;

import com.pug.car_rent_app.model.condition_report.ConditionReportDamage;
import com.pug.car_rent_app.model.condition_report.DamageType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConditionReportDamageMapper implements RowMapper<ConditionReportDamage> {

    @Override
    public ConditionReportDamage mapRow(ResultSet rs, int rowNum) throws SQLException {
        ConditionReportDamage damage = new ConditionReportDamage();

        damage.setId(rs.getInt("id"));
        damage.setReportId(rs.getInt("report_id"));
        damage.setDamageTypeId(rs.getInt("damage_type_id"));
        damage.setQuantity(rs.getInt("quantity"));
        damage.setComment(rs.getString("comment"));

        // Joined damage type
        DamageType type = new DamageType();
        type.setId(rs.getInt("dt_id"));
        type.setDamageCode(rs.getString("damage_code"));
        type.setDescription(rs.getString("description"));
        type.setStandardPrice(rs.getBigDecimal("standard_price"));

        damage.setDamageType(type);

        return damage;
    }
}
