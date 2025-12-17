package com.pug.car_rent_app.model.condition_report;

import java.math.BigDecimal;

public class DamageType {

    private int id;
    private String damageCode;
    private String description;
    private BigDecimal standardPrice;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getDamageCode() {
        return damageCode;
    }
    public void setDamageCode(String damageCode) {
        this.damageCode = damageCode;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getStandardPrice() {
        return standardPrice;
    }
    public void setStandardPrice(BigDecimal standardPrice) {
        this.standardPrice = standardPrice;
    }
}
