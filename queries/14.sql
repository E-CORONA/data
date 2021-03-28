/* 14. What are name, address, contacts and test cost of PCR centers in Almaty where cost of one PCR test is less that 15 000 tenge? */

SELECT center_name, address, contacts, cost FROM PCR WHERE cost < 15000;
