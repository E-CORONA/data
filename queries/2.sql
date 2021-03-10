-- What if a user wants to authorize from a non-email format?
-- Regex for checking email format:

ALTER TABLE users add constraint email_check CHECK(regexp_like(email, '.+@.+\..+'));

ALTER TABLE eco_users add constraint email_check CHECK(regexp_like(email, '.+@.+\..+'));
