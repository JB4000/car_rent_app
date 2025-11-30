-- Dummies
-- Husk at først køre DDL filen så tables er tomme


-- clients

INSERT INTO clients (client_id, name_first, name_last, company, email, phone, address, country, client_type)
VALUES (1, 'Anna', 'Andersen', 'Nordic Leasing A/S', 'anna.andersen@example.com', '+45 20103040',
        'Østerbrogade 12, 2100 København Ø', 'Denmark', 'LEASE_CUSTOMER'),
       (2, 'Bjørn', 'Berg', 'Berg Consulting ApS', 'bjorn.berg@example.com', '+45 40556677',
        'Vesterbrogade 55, 1620 København V', 'Denmark', 'BUYER'),
       (3, 'Caroline', 'Christensen', 'Christensen Holding', 'caroline.chr@example.com', '+45 28881122',
        'Algade 3, 4000 Roskilde', 'Denmark', 'BOTH'),
       (4, 'David', 'Dahl', NULL, 'david.dahl@example.com', '+45 50112233', 'Nørrebrogade 88, 2200 København N',
        'Denmark', 'LEASE_CUSTOMER'),
       (5, 'Emma', 'Eriksen', 'Eriksen & Co.', 'emma.eriksen@example.com', '+45 60123344',
        'H.C. Andersens Blvd 10, 1553 København V', 'Denmark', 'BUYER'),
       (6, 'Frederik', 'Friis', NULL, 'frederik.friis@example.com', '+45 71134455', 'Toldbodgade 7, 1253 København K',
        'Denmark', 'BOTH'),
       (7, 'Gitte', 'Gundersen', 'Gundersen Logistics', 'gitte.gundersen@example.com', '+45 22145566',
        'Havnegade 20, 5000 Odense C', 'Denmark', 'LEASE_CUSTOMER'),
       (8, 'Henrik', 'Hansen', NULL, 'henrik.hansen@example.com', '+45 32156677', 'Åboulevarden 30, 8000 Aarhus C',
        'Denmark', 'BUYER'),
       (9, 'Ida', 'Iversen', 'Iversen IT', 'ida.iversen@example.com', '+45 43167788',
        'Lyngby Hovedgade 15, 2800 Kgs. Lyngby', 'Denmark', 'LEASE_CUSTOMER'),
       (10, 'Jonas', 'Jørgensen', NULL, 'jonas.joergensen@example.com', '+45 54178899',
        'Strandvejen 100, 2900 Hellerup', 'Denmark', 'BUYER');


-- app_users

INSERT INTO app_users (user_id, username, password, user_type)
VALUES (1, 'databoy', '1234', 'DATA_REG'),
       (2, 'datamonkey', '1234', 'DATA_REG'),
       (3, 'klarklar24', 'kage', 'WORKSHOP'),
       (4, 'jonna22', 'password', 'WORKSHOP'),
       (5, 'manager25', 'million', 'BUSINESS_DEV'),
       (6, 'johnK', 'guld', 'BUSINESS_DEV');


-- location_providers

INSERT INTO location_providers (provider_id, provider_code, name)
VALUES (1, 'FDM', 'FDM Sjælland'),
       (2, 'FDMJY', 'FDM Jylland'),
       (3, 'FDMFYN', 'FDM Fyn'),
       (4, 'DS', 'DS Automobiler Danmark'),
       (5, 'BILA', 'Bilabonnement Servicecenter');


-- locations

INSERT INTO locations (location_id, provider_id, name, address, city)
VALUES (1, 1, 'FDM Holbæk Center', 'Industrivej 10', 'Holbæk'),
       (2, 1, 'FDM Roskilde Center', 'Ringstedvej 120', 'Roskilde'),
       (3, 2, 'FDM Aarhus Center', 'Viby Ringvej 20', 'Aarhus'),
       (4, 3, 'FDM Odense Center', 'Ørbækvej 75', 'Odense'),
       (5, 4, 'DS Showroom København', 'Borgmester Christiansens Gade 50', 'København S'),
       (6, 5, 'Bilabonnement København', 'Havnegade 5', 'København K');


-- car_statuses

INSERT INTO car_statuses (status_id, status_code, description)
VALUES (1, 'AVAILABLE', 'Available for lease or sale'),
       (2, 'LEASED', 'Currently leased to a customer'),
       (3, 'RETURNED', 'Returned from lease, awaiting inspection'),
       (4, 'CHECKED', 'Inspected and condition report created'),
       (5, 'DAMAGED', 'Has severe damages that must be handled'),
       (6, 'READY_FOR_SALE', 'Ready to be sold'),
       (7, 'READY_FOR_TRANSPORT', 'Ready to be transported to buyer'),
       (8, 'DELIVERED', 'Delivered to buyer');


-- subscription_types

INSERT INTO subscription_types (subscription_type_id, type_name, min_months, max_months)
VALUES (1, 'Limited', 5, 5),
       (2, 'Unlimited', 3, NULL);


-- damage_types

INSERT INTO damage_types (damage_type_id, damage_code, description, standard_price)
VALUES (1, 'PAINT_SCRATCH', 'Lille ridse i lak', 1500.00),
       (2, 'DENT_PANEL', 'Bulkeskade på karrosseri', 3500.00),
       (3, 'INTERIOR_STAIN', 'Plet på interiør', 800.00),
       (4, 'WINDSHIELD_CHIP', 'Stenslag i forrude', 1200.00),
       (5, 'BROKEN_LIGHT', 'Ødelagt lygte', 900.00),
       (6, 'TIRE_DAMAGE', 'Skade på dæk eller fælg', 2000.00),
       (7, 'BUMPER_DAMAGE', 'Skade på kofanger', 4000.00),
       (8, 'MIRROR_DAMAGE', 'Skade på sidespejl', 1300.00),
       (9, 'HEADLINER_STAIN', 'Plet i loftbeklædning', 1100.00),
       (10, 'SMELL_REMOVAL', 'Lugt- og dybderens', 2500.00);


-- cars

INSERT INTO cars (vehicle_no, frame_no, license_plate, brand, model, status_id)
VALUES ('CAR-1001', 'FR-1001-XYZ-AB', 'CZ12345', 'Tesla', 'Model 3', 2),
       ('CAR-1002', 'FR-1002-9QW-PL', 'DK23456', 'Volkswagen', 'ID.4', 2),
       ('CAR-1003', 'FR-1003-ZZ7-XY', NULL, 'Hyundai', 'Kona Electric', 4),
       ('CAR-1004', 'FR-1004-A1B-77', NULL, 'Škoda', 'Enyaq iV', 6),
       ('CAR-1005', 'FR-1005-QQ8-19', NULL, 'Peugeot', 'e-208', 3),
       ('CAR-1006', 'FR-1006-MN6-XY', NULL, 'Kia', 'Niro EV', 7),
       ('CAR-1007', 'FR-1007-KL3-J9', NULL, 'BMW', 'i3', 8),
       ('CAR-1008', 'FR-1008-XY2-BC', NULL, 'Nissan', 'Leaf', 1),
       ('CAR-1009', 'FR-1009-TR5-ZZ', NULL, 'Renault', 'Zoe', 5),
       ('CAR-1010', 'FR-1010-UU1-LM', NULL, 'Polestar', '2', 1);


-- car_status_histories
INSERT INTO car_status_histories (status_history_id, vehicle_no, status_id, change_time)
VALUES

-- CAR-1001
(1, 'CAR-1001', 1, '2022-12-15 09:00:00'),
(2, 'CAR-1001', 2, '2023-01-01 09:00:00'),
(3, 'CAR-1001', 3, '2023-12-31 18:00:00'),
(4, 'CAR-1001', 4, '2024-01-10 10:00:00'),
(5, 'CAR-1001', 6, '2024-01-20 09:00:00'),


-- CAR-1002
(6, 'CAR-1002', 1, '2023-12-01 10:00:00'),
(7, 'CAR-1002', 2, '2024-01-01 10:00:00'),
(8, 'CAR-1002', 3, '2024-05-31 18:00:00'),
(9, 'CAR-1002', 4, '2025-01-15 09:00:00'),
(10, 'CAR-1002', 6, '2025-02-01 09:00:00'),


-- CAR-1003
(11, 'CAR-1003', 1, '2023-12-20 11:00:00'),
(12, 'CAR-1003', 2, '2024-01-01 11:00:00'),
(13, 'CAR-1003', 3, '2024-12-31 18:30:00'),
(14, 'CAR-1003', 4, '2025-01-06 11:00:00'),


-- CAR-1004
(15, 'CAR-1004', 1, '2023-08-15 08:30:00'),
(16, 'CAR-1004', 2, '2023-09-01 08:30:00'),
(17, 'CAR-1004', 3, '2024-08-31 18:30:00'),
(18, 'CAR-1004', 4, '2024-09-06 12:00:00'),
(19, 'CAR-1004', 6, '2024-09-21 09:00:00'),


-- CAR-1005
(20, 'CAR-1005', 1, '2024-12-15 08:00:00'),
(21, 'CAR-1005', 2, '2025-01-01 08:00:00'),
(22, 'CAR-1005', 3, '2025-11-20 18:00:00'),


-- CAR-1006
(23, 'CAR-1006', 1, '2024-04-15 09:00:00'),
(24, 'CAR-1006', 2, '2024-05-01 09:00:00'),
(25, 'CAR-1006', 3, '2025-04-30 18:00:00'),
(26, 'CAR-1006', 4, '2025-05-06 10:00:00'),
(27, 'CAR-1006', 6, '2025-05-26 09:00:00'),
(28, 'CAR-1006', 7, '2025-06-01 09:00:00'),


-- CAR-1007
(29, 'CAR-1007', 1, '2022-12-01 09:00:00'),
(30, 'CAR-1007', 2, '2023-01-15 09:00:00'),
(31, 'CAR-1007', 3, '2024-01-20 18:00:00'),
(32, 'CAR-1007', 4, '2024-02-05 10:00:00'),
(33, 'CAR-1007', 6, '2024-02-20 09:00:00'),
(34, 'CAR-1007', 7, '2024-02-25 09:00:00'),
(35, 'CAR-1007', 8, '2024-03-01 09:00:00'),


-- CAR-1008
(36, 'CAR-1008', 1, '2025-11-01 09:00:00'),


-- CAR-1009
(37, 'CAR-1009', 1, '2024-05-20 09:00:00'),
(38, 'CAR-1009', 2, '2024-06-01 09:00:00'),
(39, 'CAR-1009', 3, '2025-05-31 18:00:00'),
(40, 'CAR-1009', 5, '2025-06-11 15:00:00'),


-- CAR-1010
(41, 'CAR-1010', 1, '2023-02-15 09:00:00'),
(42, 'CAR-1010', 2, '2023-03-01 09:00:00'),
(43, 'CAR-1010', 3, '2024-02-29 18:00:00'),
(44, 'CAR-1010', 4, '2024-03-21 09:00:00');



-- lease_agreements

-- Some finished, some ending 2025-12-01
-- some finishing later, and one not yet started

INSERT INTO lease_agreements
(lease_id, vehicle_no, client_id, subscription_type_id, start_date, end_date, monthly_price, currency,
 first_payment_date)
VALUES (1, 'CAR-1001', 1, 1, '2025-03-01', '2026-02-28', 3999.00, 'DKK', '2025-03-01'),  -- active, ends later
       (2, 'CAR-1002', 3, 2, '2025-06-01', '2025-12-01', 3799.00, 'DKK', '2025-06-01'),  -- ends "tomorrow"
       (3, 'CAR-1003', 4, 1, '2024-01-01', '2024-12-31', 3599.00, 'DKK', '2024-01-01'),  -- finished
       (4, 'CAR-1004', 7, 1, '2023-09-01', '2024-08-31', 3299.00, 'DKK', '2023-09-01'),  -- finished
       (5, 'CAR-1005', 9, 2, '2025-01-01', '2025-11-15', 3099.00, 'DKK', '2025-01-01'),  -- finished recently
       (6, 'CAR-1006', 6, 1, '2024-05-01', '2025-04-30', 3899.00, 'DKK', '2024-05-01'),  -- finished
       (7, 'CAR-1007', 2, 2, '2023-01-15', '2024-01-14', 3499.00, 'DKK', '2023-01-15'),  -- finished
       (8, 'CAR-1008', 5, 2, '2026-01-01', '2026-12-31', 2999.00, 'DKK', '2026-01-01'),  -- not yet started
       (9, 'CAR-1009', 8, 1, '2024-06-01', '2025-05-31', 3199.00, 'DKK', '2024-06-01'),  -- finished, damaged
       (10, 'CAR-1001', 3, 2, '2023-01-01', '2023-12-31', 3899.00, 'DKK', '2023-01-01'), -- old lease
       (11, 'CAR-1002', 1, 1, '2024-01-01', '2024-05-31', 3699.00, 'DKK', '2024-01-01'), -- old lease
       (12, 'CAR-1010', 4, 1, '2023-03-01', '2024-02-29', 2899.00, 'DKK', '2023-03-01'), -- finished
       (13, 'CAR-1003', 1, 2, '2022-01-01', '2022-12-31', 3399.00, 'DKK', '2022-01-01'), -- older
       (14, 'CAR-1004', 6, 2, '2022-06-01', '2023-05-31', 3199.00, 'DKK', '2022-06-01');
-- older


-- car_deliveries

INSERT INTO car_deliveries (delivery_id, lease_id, location_id, delivery_date)
VALUES (1, 1, 6, '2025-03-01'),
       (2, 2, 6, '2025-06-01'),
       (3, 3, 6, '2024-01-02'),
       (4, 4, 5, '2023-09-02'),
       (5, 5, 6, '2025-01-02'),
       (6, 6, 6, '2024-05-02'),
       (7, 7, 5, '2023-01-16'),
       (8, 9, 3, '2024-06-02'),
       (9, 10, 6, '2023-01-02'),
       (10, 11, 6, '2024-01-02'),
       (11, 12, 2, '2023-03-02'),
       (12, 13, 1, '2022-01-03'),
       (13, 14, 1, '2022-06-02');


-- car_returns

INSERT INTO car_returns
(return_id, lease_id, return_location_id, return_date, ready_for_sale_date)
VALUES (1, 3, 1, '2025-01-05', '2025-01-20'),  -- CAR-1003, checked
       (2, 4, 2, '2024-09-05', '2024-09-20'),  -- CAR-1004, ready for sale
       (3, 5, 3, '2025-11-20', NULL),          -- CAR-1005, just returned
       (4, 6, 1, '2025-05-05', '2025-05-25'),  -- CAR-1006, later sold
       (5, 7, 2, '2024-01-20', '2024-02-05'),  -- CAR-1007, later delivered
       (6, 9, 3, '2025-06-10', NULL),          -- CAR-1009, returned with damages
       (7, 12, 4, '2024-03-05', '2024-03-20'), -- CAR-1010
       (8, 13, 1, '2023-01-10', '2023-01-25'), -- CAR-1003 older lease
       (9, 14, 2, '2023-06-05', '2023-06-20');
-- CAR-1004 older lease


-- condition_reports

INSERT INTO condition_reports
    (report_id, return_id, date_created, done_by, comment)
VALUES (1, 1, '2025-01-06 10:00:00', 'FDM', 'Slutinspektion efter leasing, mindre slid og et par ridser'),
       (2, 2, '2024-09-06 11:00:00', 'FDM', 'Overordnet god stand, klar til salg efter rengøring'),
       (3, 4, '2025-05-06 09:30:00', 'BILABONNEMENT', 'God stand, kun mindre plet på interiør'),
       (4, 6, '2025-06-11 14:15:00', 'FDM', 'Alvorlige skader på venstre side og bagkofanger');


-- condition_report_damages

INSERT INTO condition_report_damages
(report_damage_id, report_id, damage_type_id, quantity, price_per_unit, comment)
VALUES (1, 1, 1, 2, 1200.00, 'Ridser på venstre for- og bagdør'),
       (2, 1, 3, 1, 700.00, 'Lille plet på passagersæde'),
       (3, 2, 10, 1, 2000.00, 'Dybderens før salg'),
       (4, 2, 9, 1, 900.00, 'Let plet i loftbeklædning over bagsæder'),
       (5, 3, 3, 1, 600.00, 'Kaffeflækket plet på armlæn i midten'),
       (6, 3, 4, 1, 1100.00, 'Lille stenslag i forrude, kan repareres'),
       (7, 3, 6, 1, 1800.00, 'Skrammet fælg på venstre baghjul'),
       (8, 4, 2, 1, 3300.00, 'Bulkeskade på venstre bagpanel'),
       (9, 4, 7, 1, 3800.00, 'Skade på bagkofanger efter lavhastighedspåkørsel'),
       (10, 4, 6, 2, 1900.00, 'To beskadigede dæk efter kantstensslag'),
       (11, 4, 8, 1, 1200.00, 'Ødelagt venstre sidespejl'),
       (12, 1, 4, 1, 1000.00, 'Stenslag nederst i forruden'),
       (13, 2, 1, 1, 1300.00, 'Ridse på bagkofanger'),
       (14, 3, 9, 1, 950.00, 'Lille mærke i loftbeklædning over fører'),
       (15, 2, 5, 1, 850.00, 'Knækket højre baglygten');



-- presale_agreements

-- CAR-1007 is left without presale for AFTERSALE

INSERT INTO presale_agreements
(presale_id, vehicle_no, buyer_client_id, km_included, extra_km_rate, base_price, currency, comment)
VALUES (1, 'CAR-1003', 5, 15000, 1.25, 185000.00, 'DKK', 'Presale after end-of-lease check'),
       (2, 'CAR-1004', 2, 20000, 1.10, 210000.00, 'DKK', 'Presale agreement with DS showroom customer'),
       (3, 'CAR-1006', 3, 18000, 1.20, 230000.00, 'DKK', 'Presale after very good condition report');



-- car_sales

-- Includes one AFTERSALE (no presale) for CAR-1007

INSERT INTO car_sales
(sale_id, vehicle_no, buyer_client_id, presale_id, sale_date, sale_price, currency, sale_type, damage_deduction)
VALUES (1, 'CAR-1004', 2, 2, '2024-10-01', 208000.00, 'DKK', 'PRESALE', 2000.00),
       (2, 'CAR-1006', 3, 3, '2025-06-10', 228000.00, 'DKK', 'PRESALE', 1500.00),
       (3, 'CAR-1007', 5, NULL, '2024-03-05', 195000.00, 'DKK', 'AFTERSALE', NULL),
       (4, 'CAR-1003', 4, 1, '2025-02-01', 183000.00, 'DKK', 'PRESALE', 2500.00);


-- invoices

INSERT INTO invoices
    (invoice_id, sale_id, invoice_date, due_date, amount, currency)
VALUES (1, 1, '2024-10-02', '2024-10-16', 206000.00, 'DKK'), -- 208000 - 2000
       (2, 2, '2025-06-11', '2025-06-25', 226500.00, 'DKK'), -- 228000 - 1500
       (3, 3, '2024-03-06', '2024-03-20', 195000.00, 'DKK'),
       (4, 4, '2025-02-02', '2025-02-16', 180500.00, 'DKK');
-- 183000 - 2500


-- payments

-- Some invoices fully paid, some partial (partial giver nok ikke mening)

INSERT INTO payments
    (payment_id, invoice_id, payment_date, amount)
VALUES (1, 1, '2024-10-15', 206000.00), -- invoice 1 paid in full
       (2, 2, '2025-06-20', 100000.00), -- partial payment on invoice 2
       (3, 3, '2024-03-15', 195000.00);
-- invoice 3 paid in full


-- transport_orders

-- Transport for some sold cars

INSERT INTO transport_orders
(transport_id, sale_id, pickup_location_id, destination, ordered_date, pickup_date, delivered_date)
VALUES (1, 1, 2, 'Grønnegrensvej 34, 2500 Valby', '2024-10-03', '2024-10-06', '2024-10-07'),
       (2, 3, 5, 'Fuglekvertersboulevarden 145, 2200 Kbh N', '2024-03-06', '2024-03-08', '2024-03-09'),
       (3, 2, 3, 'Hansestien 12, 4840 Nørre Alslev', '2025-06-12', '2025-06-15', NULL);

