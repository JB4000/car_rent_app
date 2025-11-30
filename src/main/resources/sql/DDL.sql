DROP TABLE IF EXISTS condition_report_damages;
DROP TABLE IF EXISTS condition_reports;
DROP TABLE IF EXISTS car_returns;
DROP TABLE IF EXISTS car_deliveries;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS transport_orders;
DROP TABLE IF EXISTS car_sales;
DROP TABLE IF EXISTS presale_agreements;
DROP TABLE IF EXISTS lease_agreements;
DROP TABLE IF EXISTS car_status_histories;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS damage_types;
DROP TABLE IF EXISTS car_statuses;
DROP TABLE IF EXISTS subscription_types;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS location_providers;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS app_users;


CREATE TABLE IF NOT EXISTS clients
(
    client_id   INT AUTO_INCREMENT PRIMARY KEY,
    name_first  VARCHAR(40)                              NOT NULL,
    name_last   VARCHAR(40)                              NOT NULL,
    company     VARCHAR(50),
    email       VARCHAR(50)                              NOT NULL,
    phone       VARCHAR(40)                              NOT NULL,
    address     VARCHAR(120)                             NOT NULL,
    country     VARCHAR(50),
    client_type ENUM ('LEASE_CUSTOMER', 'BUYER', 'BOTH') NOT NULL
);



CREATE TABLE IF NOT EXISTS app_users
(
    user_id   INT AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(20)                                   NOT NULL UNIQUE,
    password  VARCHAR(100)                                  NOT NULL,
    user_type ENUM ('DATA_REG', 'WORKSHOP', 'BUSINESS_DEV') NOT NULL
);



CREATE TABLE IF NOT EXISTS location_providers
(
    provider_id   INT AUTO_INCREMENT PRIMARY KEY,
    -- code er fx FDM
    provider_code VARCHAR(20) NOT NULL UNIQUE,
    -- name er fx Vestsjællands FDM Charge og Info point
    name          VARCHAR(50) NOT NULL
);



CREATE TABLE IF NOT EXISTS locations
(
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_id INT          NOT NULL,
    name        VARCHAR(100) NOT NULL,
    address     VARCHAR(100) NOT NULL,
    city        VARCHAR(20),
    CONSTRAINT fk_location_providers
        FOREIGN KEY (provider_id) REFERENCES location_providers (provider_id)
);



CREATE TABLE IF NOT EXISTS car_statuses
(
    status_id   INT AUTO_INCREMENT PRIMARY KEY,
    -- status_code er fx SKADET, UDLEJET osv
    status_code VARCHAR(20)  NOT NULL UNIQUE,
    description VARCHAR(200) NOT NULL
);



CREATE TABLE IF NOT EXISTS cars
(
    vehicle_no    VARCHAR(20) NOT NULL PRIMARY KEY,
    frame_no      VARCHAR(30) NOT NULL UNIQUE,
    license_plate VARCHAR(20),
    brand         VARCHAR(30) NOT NULL,
    model         VARCHAR(30) NOT NULL,
    status_id     INT         NOT NULL,
    CONSTRAINT fk_car_status
        FOREIGN KEY (status_id) REFERENCES car_statuses (status_id)
);



CREATE TABLE IF NOT EXISTS car_status_histories
(
    status_history_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_no        VARCHAR(20) NOT NULL,
    status_id         INT         NOT NULL,
    change_time       DATETIME    NOT NULL,
    CONSTRAINT fk_car_status_histories_car
        FOREIGN KEY (vehicle_no) REFERENCES cars (vehicle_no),
    CONSTRAINT fk_car_status_histories_statuses
        FOREIGN KEY (status_id) REFERENCES car_statuses (status_id)
);



CREATE TABLE IF NOT EXISTS subscription_types
(
    subscription_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name            VARCHAR(30) NOT NULL,
    min_months           INT         NOT NULL,
    max_months           INT
);



CREATE TABLE IF NOT EXISTS lease_agreements
(
    lease_id             INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_no           VARCHAR(20)         NOT NULL,
    client_id            INT                 NOT NULL,
    subscription_type_id INT                 NOT NULL,
    start_date           DATE                NOT NULL,
    end_date             DATE                NOT NULL,
    monthly_price        DECIMAL(10, 2)      NOT NULL,
    currency             ENUM ('DKK', 'EUR') NOT NULL,
    first_payment_date   DATE,
    CONSTRAINT fk_lease_agreements_cars
        FOREIGN KEY (vehicle_no) REFERENCES cars (vehicle_no),
    CONSTRAINT fk_lease_agreements_clients
        FOREIGN KEY (client_id) REFERENCES clients (client_id),
    CONSTRAINT fk_lease_agreements_subscription_types
        FOREIGN KEY (subscription_type_id) REFERENCES subscription_types (subscription_type_id)
);



CREATE TABLE IF NOT EXISTS car_deliveries
-- dette er til udlevering af bil til lease kunde
(
    delivery_id   INT AUTO_INCREMENT PRIMARY KEY,
    lease_id      INT  NOT NULL,
    location_id   INT  NOT NULL,
    delivery_date DATE NOT NULL,
    CONSTRAINT fk_car_deliveries_lease_agreements
        FOREIGN KEY (lease_id) REFERENCES lease_agreements (lease_id),
    CONSTRAINT fk_car_deliveries_locations
        FOREIGN KEY (location_id) REFERENCES locations (location_id)
);



CREATE TABLE IF NOT EXISTS car_returns
-- dette er i forbindelse med at lease kunde indleverer bil
(
    return_id           INT AUTO_INCREMENT PRIMARY KEY,
    lease_id            INT  NOT NULL,
    return_location_id  INT  NOT NULL,
    return_date         DATE NOT NULL,
    ready_for_sale_date DATE,
    CONSTRAINT fk_car_returns_lease_agreements
        FOREIGN KEY (lease_id) REFERENCES lease_agreements (lease_id),
    CONSTRAINT fk_car_returns_locations
        FOREIGN KEY (return_location_id) REFERENCES locations (location_id)
);



CREATE TABLE IF NOT EXISTS condition_reports
(
    report_id    INT AUTO_INCREMENT PRIMARY KEY,
    return_id    INT                           NOT NULL,
    date_created DATETIME                      NOT NULL,
    done_by      ENUM ('BILABONNEMENT', 'FDM') NOT NULL,
    comment      VARCHAR(300),
    CONSTRAINT fk_condition_reports_car_returns
        FOREIGN KEY (return_id) REFERENCES car_returns (return_id)

);



CREATE TABLE IF NOT EXISTS damage_types
(
    damage_type_id INT AUTO_INCREMENT PRIMARY KEY,
    -- kort navn/tag for en damage
    damage_code    VARCHAR(20)    NOT NULL UNIQUE,
    description    VARCHAR(200)   NOT NULL,
    standard_price DECIMAL(10, 2) NOT NULL
);



CREATE TABLE IF NOT EXISTS condition_report_damages
(
    report_damage_id INT AUTO_INCREMENT PRIMARY KEY,
    report_id        INT            NOT NULL,
    damage_type_id   INT            NOT NULL,
    -- skade på 3 sæder eller 1 sæde fx
    quantity         INT            NOT NULL,
    price_per_unit   DECIMAL(10, 2) NOT NULL,
    comment          VARCHAR(100),
    CONSTRAINT fk_condition_report_damages_condition_reports
        FOREIGN KEY (report_id) REFERENCES condition_reports (report_id),
    CONSTRAINT fk_condition_report_damages_damage_types
        FOREIGN KEY (damage_type_id) REFERENCES damage_types (damage_type_id)
);



CREATE TABLE IF NOT EXISTS presale_agreements
(
    presale_id      INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_no      VARCHAR(20)         NOT NULL,
    buyer_client_id INT                 NOT NULL,
    km_included     INT                 NOT NULL,
    extra_km_rate   DECIMAL(10, 2)      NOT NULL,
    base_price      DECIMAL(10, 2)      NOT NULL,
    currency        ENUM ('DKK', 'EUR') NOT NULL,
    comment         VARCHAR(500),
    CONSTRAINT fk_presale_agreements_cars
        FOREIGN KEY (vehicle_no) REFERENCES cars (vehicle_no),
    CONSTRAINT fk_presale_agreements_clients
        FOREIGN KEY (buyer_client_id) REFERENCES clients (client_id)
);



CREATE TABLE IF NOT EXISTS car_sales
(
    sale_id          INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_no       VARCHAR(20)                   NOT NULL,
    buyer_client_id  INT                           NOT NULL,
    presale_id       INT,
    sale_date        DATE                          NOT NULL,
    sale_price       DECIMAL(10, 2)                NOT NULL,
    currency         ENUM ('DKK', 'EUR')           NOT NULL,

    sale_type        ENUM ('PRESALE', 'AFTERSALE') NOT NULL,
    damage_deduction DECIMAL(10, 2),
    CONSTRAINT fk_car_sales_cars
        FOREIGN KEY (vehicle_no) REFERENCES cars (vehicle_no),
    CONSTRAINT fk_car_sales_clients
        FOREIGN KEY (buyer_client_id) REFERENCES clients (client_id),
    CONSTRAINT fk_car_sales_presale_agreements
        FOREIGN KEY (presale_id) REFERENCES presale_agreements (presale_id)
);



CREATE TABLE IF NOT EXISTS invoices
(
    invoice_id   INT AUTO_INCREMENT PRIMARY KEY,
    sale_id      INT                 NOT NULL,
    invoice_date DATE                NOT NULL,
    due_date     DATE                NOT NULL,
    amount       DECIMAL(10, 2)      NOT NULL,
    currency     ENUM ('DKK', 'EUR') NOT NULL,
    CONSTRAINT fk_invoices_car_sales
        FOREIGN KEY (sale_id) REFERENCES car_sales (sale_id)
);



CREATE TABLE IF NOT EXISTS payments
(
    payment_id   INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id   INT            NOT NULL,
    payment_date DATE           NOT NULL,
    amount       DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_payments_invoices
        FOREIGN KEY (invoice_id) REFERENCES invoices (invoice_id)
);



CREATE TABLE IF NOT EXISTS transport_orders
(
    transport_id       INT AUTO_INCREMENT PRIMARY KEY,
    sale_id            INT          NOT NULL,
    pickup_location_id INT          NOT NULL,
    destination        VARCHAR(100) NOT NULL,
    ordered_date       DATE         NOT NULL,
    pickup_date        DATE,
    delivered_date     DATE,
    CONSTRAINT fk_transport_orders_car_sales
        FOREIGN KEY (sale_id) REFERENCES car_sales (sale_id),
    CONSTRAINT fk_transport_orders_locations
        FOREIGN KEY (pickup_location_id) REFERENCES locations (location_id)
);
