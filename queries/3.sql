-- How can we delete user’s data from all tables at once?
-- Suppose, we have to delete user with id = 10123. Tables, where user_uid can be found: eco_users, online_consultation, online_pcr.

CREATE OR REPLACE PROCEDURE DELETE_FROM_TABLES (arg_user_uid IN NUMBER) AS
  v_user_uid NUMBER(38);
  v_consultation_id NUMBER(5);
  v_pcr_id NUMBER(5);
CURSOR delete_user_data IS
      SELECT eco_users.user_uid, online_consultation.consultation_id, online_pcr.pcr_id FROM eco_users 
      JOIN online_consultation ON(eco_users.user_uid = online_consultation.user_uid) 
      JOIN online_pcr on(eco_users.user_uid = online_pcr.user_uid);  
BEGIN
  OPEN delete_user_data;
    LOOP
      FETCH delete_user_data INTO v_user_uid, v_consultation_id, v_pcr_id;
      EXIT WHEN delete_user_data%NOTFOUND;
      IF arg_user_uid = v_user_uid THEN
        DELETE FROM online_consultation WHERE v_consultation_id = arg_user_uid;
        DELETE FROM online_pcr WHERE v_pcr_id = arg_user_uid;
      END IF;
    END LOOP;
  CLOSE delete_user_data;
END;
