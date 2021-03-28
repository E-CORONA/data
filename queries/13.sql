/* 13. How to get info about of medical center near your home (name, full address, contacts) knowing only the name of street and city?  

SELECT mcenter_name, address, contacts FROM medical_center WHERE address LIKE '%Manasa%' AND city = 'Almaty'; 
