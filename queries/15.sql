/* Suppose, patient was registered to online consultation. How to recognize doctor's name,workplace and experience knowing only consultation id? */

SELECT doctor_name, mcenter_id, experience FROM doctors WHERE doctor_id = (SELECT doctor_id FROM online_consultation where consultation_id = 9001);
