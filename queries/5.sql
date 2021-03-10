-- How can a user be added to PCR testing in a country's medical centers? 

CREATE OR REPLACE PROCEDURE insert_pcr
  (v_pcr_id IN NUMBER,
   v_center_id IN NUMBER,
   v_user_uid IN NUMBER,
   v_first_name IN VARCHAR2,
   v_last_name IN VARCHAR2,
   v_city IN VARCHAR2,
   v_punkt IN VARCHAR2,
   v_pcr_date IN VARCHAR2) IS
BEGIN
    INSERT INTO online_pcr (
     pcr_id,
     center_id,
     user_uid,
     first_name,
     last_name,
     city,
     punkt,
     pcr_date)
    VALUES(
     v_pcr_id,
     v_center_id,
     v_user_uid,
     v_first_name,
     v_last_name,
     v_city,
     v_punkt,
     v_pcr_date);
END;
