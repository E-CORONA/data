/*3. How can we delete user’s data from all tables at once? Suppose, we have to delete user with id = 10123. 
Tables, where user_uid can be found: eco_users, online_consultation, online_pcr./*

delete from eco_users, online_consultation, online_pcr where user_id = 10123;
