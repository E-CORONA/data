What is the doctor name, medical center name, medical center is where consultation id is 9001

select c.consultation_id, d.doctor_id, m.mcenter_id, m.mcenter_name from online_consultation c, doctors d, medical_center m where c.doctor_id = d.doctor_id and m.mcenter_id = d. mcenter_id and c.consultation_id  = 9001;
