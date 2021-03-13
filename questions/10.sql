/* 10. What are the first names and city of user who asked a question on March 12 on the topic of “Doctors”? (knowing that only one question was asked on that day)? */

SELECT first_name, city FROM users where user_id = (SELECT user_id FROM questions WHERE topic = 'Doctors' AND date = '12-Mar-2021’);
