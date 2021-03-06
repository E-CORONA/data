
CREATE TABLE admins(
    admin_id NUMBER(2),
    first_name VARCHAR2(255 CHAR),
    last_name VARCHAR2(255 CHAR),
    email VARCHAR2(50 CHAR),
    password VARCHAR2(50 CHAR),--ERD DIAGRAMM PASSWORD 50 CHAR
    CONSTRAINT admins_pk PRIMARY KEY (admin_id)
);

CREATE TABLE news(
    topic VARCHAR2(500 CHAR),
    thesis VARCHAR2(1000 CHAR),
    admin_id NUMBER(2),
    news_image BLOB,
    CONSTRAINT news_to_admins_fk FOREIGN KEY (admin_id) REFERENCES admins (admin_id)
);

CREATE TABLE faq(
    question_id NUMBER(4),
    question VARCHAR2(1000 CHAR),
    answer VARCHAR2(1000 CHAR),
    admin_id NUMBER(2),
    CONSTRAINT faq_pk PRIMARY KEY (question_id),
    CONSTRAINT faq_to_admins_fk FOREIGN KEY (admin_id) REFERENCES admins (admin_id)
);

CREATE TABLE eco_users(
    user_uid NUMBER(5),
    first_name VARCHAR2(255 CHAR),
    last_name VARCHAR2(255 CHAR),
    city VARCHAR2(255 CHAR),
    contact_number NUMBER(11),
    email VARCHAR2(255 CHAR),
    password VARCHAR2(50 CHAR),
    profile_image BLOB, 
    CONSTRAINT eco_users_pk PRIMARY KEY (user_uid)
);

CREATE TABLE pcr(
    center_id NUMBER(4),
    city VARCHAR2(255 CHAR),
    center_name VARCHAR2(100 CHAR),
    address VARCHAR2(100 CHAR),
    cost NUMBER(6),
    webpage VARCHAR2(100 CHAR),
    contacts VARCHAR2(255 CHAR),
    additional_inf VARCHAR2(100 CHAR),
    queues VARCHAR2(100 CHAR),
    fax NUMBER(11),
    CONSTRAINT center_pk PRIMARY KEY (center_id)
);

CREATE TABLE online_pcr(
    pcr_id NUMBER(5),
    center_id NUMBER(4),
    user_uid NUMBER(5),
    first_name VARCHAR2(255 CHAR),
    last_name VARCHAR2(255 CHAR),
    city VARCHAR2(255 CHAR),
    punkt VARCHAR2(1024 CHAR),
    pcr_date VARCHAR2(255 CHAR),
    CONSTRAINT pcr_pk PRIMARY KEY (pcr_id),
    CONSTRAINT online_pcr_to_eco_users FOREIGN KEY (user_uid) REFERENCES eco_users (user_uid),
    CONSTRAINT online_pcr_to_pcr FOREIGN KEY (center_id) REFERENCES pcr (center_id)
);


CREATE TABLE medical_center(
    mcenter_id NUMBER(4),
    mcenter_name VARCHAR2(100 CHAR),
    city VARCHAR2(50 CHAR),
    address VARCHAR2(100 CHAR),
    contacts NUMBER(11),
    CONSTRAINT medical_center_pk PRIMARY KEY (mcenter_id)
);

CREATE TABLE doctors(
    doctor_id NUMBER(5),
    doctor_name VARCHAR2(255 CHAR),
    specialty VARCHAR2(100 CHAR),
    experince NUMBER(2),
    home_visits VARCHAR2(5 CHAR) DEFAULT 'FALSE',--CHANGE DATA TYPE IN ERD
    accept_children VARCHAR2(5 CHAR) DEFAULT 'FALSE',--CHANGE DATA TYPE IN ERD
    initial_reception NUMBER(6),
    secondary_reception NUMBER(6),
    mcenter_id NUMBER(4),
    CONSTRAINT doctors_pk PRIMARY KEY (doctor_id),
    CONSTRAINT doctors_to_medical_center_fk FOREIGN KEY (mcenter_id) REFERENCES medical_center (mcenter_id)
);

CREATE TABLE online_consultation(
    consultation_id NUMBER(5),
    user_uid NUMBER(5),
    doctor_id NUMBER(5),
    first_name VARCHAR2(255 CHAR),
    last_name VARCHAR2(255 CHAR),
    age NUMBER(6),
    phone NUMBER(11),
    city VARCHAR2(128 CHAR),
    clinics VARCHAR2 (1000 CHAR),
    consultation_date VARCHAR2(255 CHAR),
    CONSTRAINT online_consultation_pk PRIMARY KEY (consultation_id),
    CONSTRAINT online_consultation_to_doctors FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id),
    CONSTRAINT online_consultation_to_eco_users FOREIGN KEY (user_uid) REFERENCES eco_users(user_uid)
);