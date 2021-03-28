/* 12. How can we count number of medical consultations and PCR tests of one user in one query */ 

SELECT COUNT(c.consultation_id) as online_consultations, COUNT(p.pcr_id) as pcr FROM online_consultation c, online_pcr p;
