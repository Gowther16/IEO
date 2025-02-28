-- Add reset password columns to Users table
ALTER TABLE Users
ADD reset_code VARCHAR(6),
ADD reset_code_expiry TIMESTAMP;
