CREATE TABLE LAWYER (
    lawyer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    specialty VARCHAR2(100)
);

CREATE TABLE CASE_FILE (
    case_id NUMBER PRIMARY KEY,
    client_name VARCHAR2(150) NOT NULL,
    opponent VARCHAR2(150),
    hearing_date DATE NOT NULL,
    status VARCHAR2(50)
);

CREATE TABLE LAWYER_CASE (
    lawyer_id NUMBER NOT NULL,
    case_id NUMBER NOT NULL,
    assigned_date DATE DEFAULT SYSDATE,
    CONSTRAINT pk_lawyer_case PRIMARY KEY (lawyer_id, case_id),
    CONSTRAINT fk_lawyer FOREIGN KEY (lawyer_id)
        REFERENCES LAWYER(lawyer_id),
    CONSTRAINT fk_case FOREIGN KEY (case_id)
        REFERENCES CASE_FILE(case_id)
);

CREATE TABLE HOLIDAY_CALENDAR (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);

CREATE TABLE AUDIT_LOG (
    audit_id NUMBER PRIMARY KEY,
    user_id VARCHAR2(50),
    action_date DATE DEFAULT SYSDATE,
    table_name VARCHAR2(50),
    operation VARCHAR2(20),
    status VARCHAR2(20),
    remarks VARCHAR2(200)
);
