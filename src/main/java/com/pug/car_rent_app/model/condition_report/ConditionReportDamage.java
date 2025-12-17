package com.pug.car_rent_app.model.condition_report;

public class ConditionReportDamage {

    private int id;
    private int reportId;
    private int damageTypeId;
    private int quantity;
    private String comment;

    // Optional: populated when joining with damage_types
    private DamageType damageType;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getReportId() {
        return reportId;
    }
    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public int getDamageTypeId() {
        return damageTypeId;
    }
    public void setDamageTypeId(int damageTypeId) {
        this.damageTypeId = damageTypeId;
    }

    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getComment() {
        return comment;
    }
    public void setComment(String comment) {
        this.comment = comment;
    }

    public DamageType getDamageType() {
        return damageType;
    }
    public void setDamageType(DamageType damageType) {
        this.damageType = damageType;
    }
}
