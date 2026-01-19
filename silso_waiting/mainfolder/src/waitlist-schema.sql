-- Create waitlist table for Silso app
CREATE TABLE IF NOT EXISTS waitlist (
  email VARCHAR(255) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);