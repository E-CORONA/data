-- cursor-based records
-- What if a user wants to get the list of all medical Centers?

DECLARE
  var_mcenter_id medical_center.mcenter_id%TYPE;
  var_mcenter_name medical_center.mcenter_name%TYPE;
  var_mcenter_city medical_center.city%TYPE;
  var_mcenter_contacts medical_center.contacts%TYPE;
  
  CURSOR list_mcenters_cur IS
    SELECT * FROM medical_center;
  list_mcenters_rec list_mcenters_cur%ROWTYPE;
BEGIN
  OPEN list_mcenters_cur;
  loop
    FETCH list_mcenters_cur INTO list_mcenters_rec;
    EXIT WHEN list_mcenters_cur%NOTFOUND;
    var_mcenter_id := list_mcenters_rec.mcenter_id;
    var_mcenter_name := list_mcenters_rec.mcenter_name;
    var_mcenter_city := list_mcenters_rec.city;
    var_mcenter_address medical_center.address%TYPE := list_mcenters_rec.address;
    var_mcenter_contacts := list_mcenters_rec.contacts;
  end loop;
END;
