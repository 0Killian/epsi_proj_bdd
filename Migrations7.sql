USE ProjetBDD;
GO

ALTER TABLE signalement
ALTER COLUMN signale_id INT DEFAULT NULL;
GO

ALTER TABLE signalement
ALTER COLUMN post_id INT DEFAULT NULL;
GO

ALTER TABLE signalement
ADD CONSTRAINT CK_suivi CHECK (signale_id IS NOT NULL AND post_id IS NULL)
    OR (signale_id IS NULL AND post_id IS NOT NULL);
