--4)How can we insert(register) new users

CREATE OR REPLACE PROCEDURE insertUser
  (v_user_uid IN NUMBER,
   v_first_name IN VARCHAR2,
   v_last_name IN VARCHAR2,
   v_city IN VARCHAR2,
   v_contacts IN NUMBER,
   v_email IN VARCHAR2,
   v_password IN VARCHAR2,
   v_image IN BLOB) IS
BEGIN
    INSERT INTO eco_users (user_uid, first_name, last_name, city, CONTACT_NUMBER, email, password, profile_image)
    VALUES(
      v_user_uid,
      v_first_name,
      v_last_name,
      v_city,
      v_contacts,
      v_email,
      v_password,
      v_image);
END;