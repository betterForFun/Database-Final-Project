-- 生成者Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   时间:        2022-04-02 12:53:59 EDT
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ltd_corp_coupon (
    c_discount_rate NUMBER(30, 2) NOT NULL,
    corp_coupon_id  NUMBER NOT NULL
);

COMMENT ON COLUMN ltd_corp_coupon.c_discount_rate IS
    'the rate of the discount';

ALTER TABLE ltd_corp_coupon ADD CONSTRAINT ltd_corp_coupon_pk PRIMARY KEY ( corp_coupon_id );

CREATE TABLE ltd_corp_cus (
    email          VARCHAR2(30) NOT NULL,
    corp_no        VARCHAR2(30) NOT NULL,
    emp_id         VARCHAR2(30) NOT NULL,
    corp_name      VARCHAR2(30) NOT NULL,
    corp_coupon_id NUMBER NOT NULL
);

COMMENT ON COLUMN ltd_corp_cus.email IS
    'email of the customer';

COMMENT ON COLUMN ltd_corp_cus.corp_no IS
    'the cop registrartion number';

COMMENT ON COLUMN ltd_corp_cus.emp_id IS
    'the employee id of the customer';

COMMENT ON COLUMN ltd_corp_cus.corp_name IS
    'the name of the corp';

ALTER TABLE ltd_corp_cus ADD CONSTRAINT ltd_corp_cus_pk PRIMARY KEY ( email );

ALTER TABLE ltd_corp_cus ADD CONSTRAINT ltd_corp_cus_pkv1 UNIQUE ( corp_no,
                                                                   emp_id );

CREATE TABLE ltd_customer (
    email         VARCHAR2(30) NOT NULL,
    phone         NUMBER(10) NOT NULL,
    street        VARCHAR2(30) NOT NULL,
    city          VARCHAR2(30) NOT NULL,
    state         VARCHAR2(30) NOT NULL,
    zip           NUMBER(30) NOT NULL,
    customer_type VARCHAR2(1) NOT NULL
);

ALTER TABLE ltd_customer
    ADD CONSTRAINT ch_inh_ltd_customer CHECK ( customer_type IN ( 'c', 'i' ) );

COMMENT ON COLUMN ltd_customer.email IS
    'email of the customer';

COMMENT ON COLUMN ltd_customer.phone IS
    'phone number of the customer';

COMMENT ON COLUMN ltd_customer.street IS
    'the street name of the address';

COMMENT ON COLUMN ltd_customer.city IS
    'the city of the address';

COMMENT ON COLUMN ltd_customer.state IS
    'the state of the address';

COMMENT ON COLUMN ltd_customer.zip IS
    'the zip code of the address';

COMMENT ON COLUMN ltd_customer.customer_type IS
    'the type of the customer';

ALTER TABLE ltd_customer ADD CONSTRAINT ltd_customer_pk PRIMARY KEY ( email );

CREATE TABLE ltd_indi_coupon (
    indi_coupon_id     NUMBER(10) NOT NULL,
    indi_discount_rate NUMBER(10, 2) NOT NULL,
    start_date         DATE NOT NULL,
    end_date           DATE NOT NULL,
    license_id         VARCHAR2(30)
);

COMMENT ON COLUMN ltd_indi_coupon.indi_coupon_id IS
    'the coupon id ';

COMMENT ON COLUMN ltd_indi_coupon.indi_discount_rate IS
    'the rate of the discount';

COMMENT ON COLUMN ltd_indi_coupon.start_date IS
    'the start date';

COMMENT ON COLUMN ltd_indi_coupon.end_date IS
    'the end date of the coupon';

ALTER TABLE ltd_indi_coupon ADD CONSTRAINT ltd_indi_coupon_pk PRIMARY KEY ( indi_coupon_id );

CREATE TABLE ltd_indi_cus (
    email          VARCHAR2(30) NOT NULL,
    license_id     VARCHAR2(30) NOT NULL,
    cus_fn         VARCHAR2(30) NOT NULL,
    cus_ln         VARCHAR2(30) NOT NULL,
    insurance_name VARCHAR2(30) NOT NULL,
    insurance_no   VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN ltd_indi_cus.email IS
    'email of the customer';

COMMENT ON COLUMN ltd_indi_cus.license_id IS
    'the driver license number';

COMMENT ON COLUMN ltd_indi_cus.cus_fn IS
    'the first name of the customer';

COMMENT ON COLUMN ltd_indi_cus.cus_ln IS
    'the last name of the customer';

COMMENT ON COLUMN ltd_indi_cus.insurance_name IS
    'the insurance company name';

COMMENT ON COLUMN ltd_indi_cus.insurance_no IS
    'the insrance number';

ALTER TABLE ltd_indi_cus ADD CONSTRAINT ltd_indi_cus_pk PRIMARY KEY ( email );

ALTER TABLE ltd_indi_cus ADD CONSTRAINT ltd_indi_cus_pkv1 UNIQUE ( license_id );

CREATE TABLE ltd_invoice (
    invoice_id NUMBER(10) NOT NULL,
    "date"     DATE NOT NULL,
    amount     NUMBER(30, 3) NOT NULL,
    record_id  NUMBER(10) NOT NULL
);

COMMENT ON COLUMN ltd_invoice.invoice_id IS
    'the invoice id';

COMMENT ON COLUMN ltd_invoice."date" IS
    'the invoice date';

COMMENT ON COLUMN ltd_invoice.amount IS
    'the amount of this invoice';

CREATE UNIQUE INDEX ltd_invoice__idx ON
    ltd_invoice (
        record_id
    ASC );

ALTER TABLE ltd_invoice ADD CONSTRAINT ltd_invoice_pk PRIMARY KEY ( invoice_id );

CREATE TABLE ltd_payment (
    payment_id     NUMBER(10) NOT NULL,
    payment_date   DATE NOT NULL,
    payment_status VARCHAR2(30) NOT NULL,
    payment_type   VARCHAR2(30) NOT NULL,
    card_no        VARCHAR2(30) NOT NULL,
    invoice_id     NUMBER(10) NOT NULL
);

COMMENT ON COLUMN ltd_payment.payment_id IS
    'the payment id';

COMMENT ON COLUMN ltd_payment.payment_date IS
    'the date of this payment';

COMMENT ON COLUMN ltd_payment.payment_status IS
    'the status of this payment';

COMMENT ON COLUMN ltd_payment.payment_type IS
    'the payment type ( credit, debit, gift ) ';

COMMENT ON COLUMN ltd_payment.card_no IS
    'the card number ';

ALTER TABLE ltd_payment ADD CONSTRAINT ltd_payment_pk PRIMARY KEY ( payment_id );

CREATE TABLE ltd_rent_record (
    record_id         NUMBER(10) NOT NULL,
    pickup_office_id  VARCHAR2(30) NOT NULL,
    dropoff_office_id VARCHAR2(30) NOT NULL,
    pickup_date       DATE NOT NULL,
    dropoff_date      DATE NOT NULL,
    start_meter       NUMBER(30) NOT NULL,
    end_meter         NUMBER(30) NOT NULL,
    daliy_meter_limit NUMBER(30) NOT NULL,
    email             VARCHAR2(30) NOT NULL,
    vin               VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN ltd_rent_record.record_id IS
    'the id of the record';

COMMENT ON COLUMN ltd_rent_record.pickup_office_id IS
    'the pick up location';

COMMENT ON COLUMN ltd_rent_record.dropoff_office_id IS
    'the drop off location';

COMMENT ON COLUMN ltd_rent_record.pickup_date IS
    'the pick up date';

COMMENT ON COLUMN ltd_rent_record.dropoff_date IS
    'the drop off date';

COMMENT ON COLUMN ltd_rent_record.start_meter IS
    'the start millage';

COMMENT ON COLUMN ltd_rent_record.end_meter IS
    'the end millage';

COMMENT ON COLUMN ltd_rent_record.daliy_meter_limit IS
    'the daily millage limit( if -1 then it''s unlimited)';

ALTER TABLE ltd_rent_record ADD CONSTRAINT ltd_rent_record_pk PRIMARY KEY ( record_id );

CREATE TABLE ltd_vehicle (
    vin                  VARCHAR2(30) NOT NULL,
    make                 VARCHAR2(30) NOT NULL,
    model                VARCHAR2(30) NOT NULL,
    year                 NUMBER(10) NOT NULL,
    license_plate_number VARCHAR2(30) NOT NULL,
    status               NUMBER NOT NULL,
    class_name           VARCHAR2(30) NOT NULL,
    office_id            VARCHAR2(30)
);

COMMENT ON COLUMN ltd_vehicle.vin IS
    'the vin number of this vehicle';

COMMENT ON COLUMN ltd_vehicle.make IS
    'the make of this vehicle';

COMMENT ON COLUMN ltd_vehicle.model IS
    'the model of this vehicle';

COMMENT ON COLUMN ltd_vehicle.year IS
    'the year of this vehicle';

COMMENT ON COLUMN ltd_vehicle.license_plate_number IS
    'the license plate number';

COMMENT ON COLUMN ltd_vehicle.status IS
    'the renting status of this vehicle';

ALTER TABLE ltd_vehicle ADD CONSTRAINT ltd_vehicle_pk PRIMARY KEY ( vin );

CREATE TABLE ltd_vehicle_class (
    class_name       VARCHAR2(30) NOT NULL,
    rental_rate      NUMBER(10, 2) NOT NULL,
    over_millage_fee NUMBER(10, 2) NOT NULL
);

COMMENT ON COLUMN ltd_vehicle_class.class_name IS
    'the class name';

COMMENT ON COLUMN ltd_vehicle_class.rental_rate IS
    'rental rate';

COMMENT ON COLUMN ltd_vehicle_class.over_millage_fee IS
    'the over millage fee';

ALTER TABLE ltd_vehicle_class ADD CONSTRAINT ltd_vehicle_class_pk PRIMARY KEY ( class_name );

CREATE TABLE ltd_wow_office (
    office_id   VARCHAR2(30) NOT NULL,
    office_name VARCHAR2(30) NOT NULL,
    phone       VARCHAR2(30) NOT NULL,
    street      VARCHAR2(30) NOT NULL,
    city        VARCHAR2(30) NOT NULL,
    state       VARCHAR2(30) NOT NULL,
    zip         NUMBER(30) NOT NULL
);

COMMENT ON COLUMN ltd_wow_office.office_id IS
    'the office id ';

COMMENT ON COLUMN ltd_wow_office.office_name IS
    'the name of this office';

COMMENT ON COLUMN ltd_wow_office.phone IS
    'the phone number of this office';

COMMENT ON COLUMN ltd_wow_office.street IS
    'the street of this office';

COMMENT ON COLUMN ltd_wow_office.city IS
    'the city of this office';

COMMENT ON COLUMN ltd_wow_office.state IS
    'the state of this office';

COMMENT ON COLUMN ltd_wow_office.zip IS
    'the zip code of this office';

ALTER TABLE ltd_wow_office ADD CONSTRAINT ltd_wow_office_pk PRIMARY KEY ( office_id );

ALTER TABLE ltd_corp_cus
    ADD CONSTRAINT corp_cus_corp_coupon_fk FOREIGN KEY ( corp_coupon_id )
        REFERENCES ltd_corp_coupon ( corp_coupon_id );

ALTER TABLE ltd_corp_cus
    ADD CONSTRAINT corp_cus_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_indi_coupon
    ADD CONSTRAINT indi_coupon_indi_cus_fk FOREIGN KEY ( license_id )
        REFERENCES ltd_indi_cus ( license_id );

ALTER TABLE ltd_indi_cus
    ADD CONSTRAINT indi_cus_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_invoice
    ADD CONSTRAINT invoice_rent_record_fk FOREIGN KEY ( record_id )
        REFERENCES ltd_rent_record ( record_id );

ALTER TABLE ltd_payment
    ADD CONSTRAINT payment_invoice_fk FOREIGN KEY ( invoice_id )
        REFERENCES ltd_invoice ( invoice_id );

ALTER TABLE ltd_rent_record
    ADD CONSTRAINT rent_record_customer_fk FOREIGN KEY ( email )
        REFERENCES ltd_customer ( email );

ALTER TABLE ltd_rent_record
    ADD CONSTRAINT rent_record_vehicle_fk FOREIGN KEY ( vin )
        REFERENCES ltd_vehicle ( vin );

ALTER TABLE LTD_rent_record 
	ADD CONSTRAINT dropoff_date CHECK (dropoff_date>=pickup_date);


ALTER TABLE ltd_vehicle
    ADD CONSTRAINT vehicle_vehicle_class_fk FOREIGN KEY ( class_name )
        REFERENCES ltd_vehicle_class ( class_name );

ALTER TABLE ltd_vehicle
    ADD CONSTRAINT vehicle_wow_office_fk FOREIGN KEY ( office_id )
        REFERENCES ltd_wow_office ( office_id );



CREATE OR REPLACE TRIGGER arc_fkarc_1_ltd_corp_cus BEFORE
    INSERT OR UPDATE OF email ON ltd_corp_cus
    FOR EACH ROW
DECLARE
    d VARCHAR2(1);
BEGIN
    SELECT
        a.customer_type
    INTO d
    FROM
        ltd_customer a
    WHERE
        a.email = :new.email;

    IF ( d IS NULL OR d <> 'c' ) THEN
        raise_application_error(-20223, 'FK corp_cus_customer_FK in Table LTD_corp_cus violates Arc constraint on Table LTD_customer - discriminator column customer_type doesn''t have value ''c''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_1_ltd_indi_cus BEFORE
    INSERT OR UPDATE OF email ON ltd_indi_cus
    FOR EACH ROW
DECLARE
    d VARCHAR2(1);
BEGIN
    SELECT
        a.customer_type
    INTO d
    FROM
        ltd_customer a
    WHERE
        a.email = :new.email;

    IF ( d IS NULL OR d <> 'i' ) THEN
        raise_application_error(-20223, 'FK Indi_cus_customer_FK in Table LTD_Indi_cus violates Arc constraint on Table LTD_customer - discriminator column customer_type doesn''t have value ''i''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE SEQUENCE LTD_corp_coupon_corp_coupon_id 
START WITH 1 
    NOCACHE 
    ORDER ;


CREATE OR REPLACE TRIGGER LTD_corp_coupon_corp_coupon_id 
BEFORE INSERT ON LTD_corp_coupon 
FOR EACH ROW 
WHEN (NEW.corp_coupon_id IS NULL) 
BEGIN
:new.corp_coupon_id := ltd_corp_coupon_corp_coupon_id.nextval;

end;
/

CREATE SEQUENCE LTD_invoice_invoice_id_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER LTD_invoice_invoice_id_TRG 
BEFORE INSERT ON LTD_invoice 
FOR EACH ROW 
WHEN (NEW.invoice_id IS NULL) 
BEGIN
:new.invoice_id := ltd_invoice_invoice_id_seq.nextval;

end;
/

CREATE SEQUENCE LTD_payment_payment_id_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER LTD_payment_payment_id_TRG 
BEFORE INSERT ON LTD_payment 
FOR EACH ROW 
WHEN (NEW.payment_id IS NULL) 
BEGIN
:new.payment_id := ltd_payment_payment_id_seq.nextval;

end;
/

CREATE SEQUENCE LTD_rent_record_record_id_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER LTD_rent_record_record_id_TRG 
BEFORE INSERT ON LTD_rent_record 
FOR EACH ROW 
WHEN (NEW.record_id IS NULL) 
BEGIN
:new.record_id := ltd_rent_record_record_id_seq.nextval;

end;
/
		


#trigger for invoice
CREATE OR REPLACE TRIGGER invoice_trigger
AFTER INSERT ON LTD_rent_record FOR EACH ROW
DECLARE
amount NUMBER;
overamount NUMBER;
extramile NUMBER;
days NUMBER;
discount NUMBER;
IndiOrCorp CHAR;
BEGIN

	extramile := :NEW.daliy_meter_limit - (:NEW.end_meter - :NEW.start_meter);
	days := :NEW.dropoff_date - :NEW.pickup_date;
	
	
	SELECT LTD_CUSTOMER.CUSTOMER_TYPE
	INTO IndiOrCorp
	FROM LTD_CUSTOMER
	WHERE LTD_CUSTOMER.EMAIL = :NEW.EMAIL;
	

	IF IndiOrCorp = 'i' THEN
    	SELECT MIN(LTD_INDI_COUPON.INDI_DISCOUNT_RATE)
    	INTO discount
    	FROM LTD_INDI_CUS
    	INNER JOIN LTD_INDI_COUPON
    	ON LTD_INDI_COUPON.LICENSE_ID = LTD_INDI_CUS.LICENSE_ID and :NEW.EMAIL = LTD_INDI_CUS.EMAIL;
	ELSE
		SELECT MIN(LTD_CORP_COUPON.C_DISCOUNT_RATE)
		INTO discount
		FROM LTD_CORP_COUPON
		INNER JOIN LTD_CORP_CUS
		ON LTD_CORP_CUS.CORP_COUPON_ID = LTD_CORP_COUPON.CORP_COUPON_ID and :NEW.EMAIL = LTD_CORP_CUS.EMAIL;
	END IF;
	
	
	SELECT SUM(LTD_vehicle_class.rental_rate * days * discount)
	INTO amount
	FROM LTD_vehicle_class
	INNER JOIN LTD_vehicle
	ON LTD_vehicle.class_name = LTD_vehicle_class.class_name
	WHERE :NEW.vin = LTD_vehicle.vin;
	

		
	SELECT SUM((LTD_vehicle_class.rental_rate * days + (-1 * extramile * LTD_vehicle_class.over_millage_fee)) * discount)
	INTO overamount
	FROM LTD_vehicle_class
	INNER JOIN LTD_vehicle
	ON LTD_vehicle.class_name = LTD_vehicle_class.class_name
	WHERE :NEW.vin = LTD_vehicle.vin;


	IF :NEW.daliy_meter_limit = -1 or extramile > 0 THEN
	    INSERT INTO LTD_invoice VALUES(default, :NEW.dropoff_date, amount, :NEW.record_id);
    ELSIF extramile < 0 THEN
        INSERT INTO LTD_invoice VALUES(default, :NEW.dropoff_date, overamount, :NEW.record_id);
	END IF;

END;
/


-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             1
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           6
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          4
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
