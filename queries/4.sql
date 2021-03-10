-- How can a user be added to consultation with a doctor?

CREATE OR REPLACE PROCEDURE insert_consultation
  (v_consultation_id IN NUMBER,
   v_user_uid IN NUMBER,
   v_doctor_id IN NUMBER,
   v_first_name IN VARCHAR2,
   v_last_name IN VARCHAR2,
   v_age in NUMBER,
   v_phone IN VARCHAR2,
   v_city IN VARCHAR2,
   v_doctor_name IN VARCHAR2,
   v_clinics IN VARCHAR2,
   v_consultation_date IN VARCHAR2) IS
BEGIN
    INSERT INTO online_consultation (
     consultation_id,
     user_uid,
     doctor_id,
     first_name,
     last_name,
     age,
     phone,
     city,
     doctor,
     clinics,
     consultation_date)
    VALUES(
       v_consultation_id,
       v_user_uid,
       v_doctor_id,
       v_first_name,
       v_last_name,
       v_age,
       v_phone,
       v_city,
       v_doctor_name,
       v_clinics,
       v_consultation_date);
END;
