package com.pug.car_rent_app.repository;
import com.pug.car_rent_app.mapper.AppUserMapper;
import com.pug.car_rent_app.model.login.AppUsers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AppUserRepository {
    @Autowired
    JdbcTemplate template;

    public List<AppUsers> getAllAppUsers() {
        String sql = """
                SELECT username, password, user_type_id FROM app_users
                """;
        return template.query(sql, new AppUserMapper());
    }

}

