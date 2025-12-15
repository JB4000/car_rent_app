package com.pug.car_rent_app.mapper;

import com.pug.car_rent_app.model.Car;
import com.pug.car_rent_app.model.login.AppUsers;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AppUserMapper implements RowMapper<AppUsers> {
    @Override
    public AppUsers mapRow(ResultSet rs, int rowNum) throws SQLException {
        AppUsers appUsers = new AppUsers();

                appUsers.setUsername(rs.getString("username"));
                appUsers.setPassword(rs.getString("password"));
                appUsers.setRole(rs.getString("user_type_id"));

        return appUsers;
    }
}
