USE ProjetBDD;
GO

ALTER TABLE abonnement
ALTER COLUMN suivi_personne_id INT DEFAULT NULL;
GO

ALTER TABLE abonnement
ALTER COLUMN suivi_etablissement_id INT DEFAULT NULL;
GO

ALTER TABLE abonnement
ALTER COLUMN suivi_hashtag_id INT DEFAULT NULL;
GO

ALTER TABLE signalement
ADD CONSTRAINT CK_suivi CHECK (suivi_personne_id IS NOT NULL AND suivi_etablissement_id IS NULL AND suivi_hashtag_id IS NULL)
    OR (suivi_personne_id IS NULL AND suivi_etablissement_id IS NOT NULL AND suivi_hashtag_id IS NULL)
    OR (suivi_personne_id IS NULL AND suivi_etablissement_id IS NULL AND suivi_hashtag_id IS NOT NULL);
