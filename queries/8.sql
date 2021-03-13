--3) Question: How can we find phone numbers of patient

CREATE OR REPLACE PROCEDURE findPhones AS
  CURSOR phones IS
    SELECT * FROM eco_users;
  v_row   eco_users%ROWTYPE;
  v_phones SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST(); //встроенная функция эррейя
  v_count INT := 0;
 BEGIN
  OPEN phones;
  LOOP
    FETCH phones INTO v_row;
    EXIT WHEN phones%NOTFOUND;
    v_phones.EXTEND;
    v_phones(v_phones.COUNT) := v_row.contact_number;
    FOR i IN 1 .. v_row.contact_number.COUNT LOOP
      v_phones.EXTEND;
      v_phones(v_phones.COUNT) := v_row.contact_number(i);
    END LOOP;
  END LOOP;
  CLOSE phones;
END;
