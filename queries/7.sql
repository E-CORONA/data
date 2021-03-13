--2) Question how can we get list of consultations

CREATE OR REPLACE PROCEDURE get_list_consulation IS 
  var_id NUMBER(5);
  var_operation_date DATE;
  var_old_cid NUMBER(5);
  var_new_cid NUMBER(5);
  var_old_uid NUMBER(5);
  var_new_uid NUMBER(5);
  var_old_did NUMBER(5);
  var_new_did NUMBER(5);
  var_old_clinics VARCHAR2(50);
  var_new_clinics VARCHAR2(50);
  var_old_date NUMBER(5);
  var_new_date NUMBER(5);
  var_action VARCHAR2(20);
  var_actionauthor VARCHAR2(20);

  CURSOR list_consultations_curs IS
    SELECT * FROM online_consultation_log;
  list_consultations_rec list_consultations_curs%ROWTYPE;
BEGIN
     OPEN list_consultations_curs;
  loop
    FETCH list_consultations_curs INTO list_consultations_rec;
    EXIT WHEN list_consultations_curs%NOTFOUND;
    var_id := list_consultations_rec.id;
    var_operation_date := list_consultations_rec.operation_date;
    var_old_cid := list_consultations_rec.old_cid;
    var_new_cid := list_consultations_rec.new_cid;
    var_old_uid := list_consultations_rec.old_uid;
    var_new_uid := list_consultations_rec.new_uid;
    var_old_did := list_consultations_rec.old_did;
    var_new_did := list_consultations_rec.new_did;
    var_old_clinics := list_consultations_rec.OLD_CLINICS;
    var_new_clinics := list_consultations_rec.NEW_CLINICS;
    var_old_date := list_consultations_rec.OLD_DATE;
    var_new_date := list_consultations_rec.NEW_DATE;
    var_action := list_consultations_rec.action;
    var_actionauthor := list_consultations_rec.ACTIONAUTHOR;
  end loop;
END get_list_consulation;
