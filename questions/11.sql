/* 11. How can we display all questions and answers added by definite admin? (for example with id 12) */

SELECT question, answer FROM faq WHERE admin_id = 12;
