--1) Question: How can we get list of users

CREATE OR REPLACE PROCEDURE get_list_users IS 
  var_id NUMBER(5);
  var_operation_date DATE;
  var_old_id NUMBER(5);
  var_new_id NUMBER(5);
  var_old_email VARCHAR2(50);
  var_new_email VARCHAR2(50);
  var_action VARCHAR2(20);
  var_actionauthor VARCHAR2(20);

  CURSOR list_users_curs IS
    SELECT * FROM eco_users_log;
  list_users_rec list_users_curs%ROWTYPE;
BEGIN
     OPEN list_users_curs;
  loop
    FETCH list_users_curs INTO list_users_rec;
    EXIT WHEN list_users_curs%NOTFOUND;
    var_id := list_users_rec.id;
    var_operation_date := list_users_rec.operation_date;
    var_old_id := list_users_rec.old_id;
    var_new_id := list_users_rec.new_id;
    var_old_email := list_users_rec.old_email;
    var_new_email := list_users_rec.new_email;
    var_action := list_users_rec.action;
    var_actionauthor := list_users_rec.ACTIONAUTHOR;
  end loop;
END get_list_users;






