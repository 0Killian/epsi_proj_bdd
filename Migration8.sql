USE retarrosoir;
GO

ALTER TABLE compte
ADD CONSTRAINT CK_email CHECK (email LIKE '%@%');
GO