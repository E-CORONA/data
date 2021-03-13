--5)How can we track every changes(such as deleting, inserting, updating user) in user table (for admins)

CREATE OR REPLACE TRIGGER user_triggers
    AFTER INSERT OR UPDATE OR DELETE ON eco_users FOR EACH ROW
BEGIN
    IF DELETING THEN
        INSERT INTO eco_users_log (ID, OPERATION_DATE, OLD_ID, NEW_ID, OLD_EMAIL, NEW_EMAIL, ACTION, ACTIONAUTHOR)
        VALUES (:OLD.user_uid, SYSDATE, :OLD.user_uid, :NEW.user_uid, :OLD.email, :NEW.email,'Delete',(SELECT USER FROM DUAL));
    END IF;
    IF INSERTING THEN 
        INSERT INTO eco_users_log (ID, OPERATION_DATE, OLD_ID, NEW_ID, OLD_EMAIL, NEW_EMAIL, ACTION, ACTIONAUTHOR)
        VALUES (:OLD.user_uid, SYSDATE, :OLD.user_uid, :NEW.user_uid, :OLD.email, :NEW.email,'Insert',(SELECT USER FROM DUAL) );
    END IF;
    IF UPDATING THEN 
        INSERT INTO eco_users_log (ID, OPERATION_DATE, OLD_ID, NEW_ID, OLD_EMAIL, NEW_EMAIL, ACTION, ACTIONAUTHOR)
        VALUES (:OLD.user_uid, SYSDATE, :OLD.user_uid, :NEW.user_uid, :OLD.email, :NEW.email,'Update',(SELECT USER FROM DUAL) );
    END IF;
END;