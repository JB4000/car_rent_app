package com.pug.car_rent_app.mapper;

import com.pug.car_rent_app.model.condition_report.DamageType;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DamageTypeMapper implements RowMapper<DamageType> {

    @Override
    public DamageType mapRow(ResultSet rs, int rowNum) throws SQLException {
        DamageType damageType = new DamageType();

        damageType.setId(rs.getInt("id"));
        damageType.setDamageCode(rs.getString("damage_code"));
        damageType.setDescription(rs.getString("description"));
        damageType.setStandardPrice(rs.getBigDecimal("standard_price"));

        return damageType;
    }
}
