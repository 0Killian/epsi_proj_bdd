USE ProjetBDD;
GO

ALTER TABLE compte
ADD CONSTRAINT AK_pseudo UNIQUE(pseudo);
GO

ALTER TABLE compte
ADD nom_affichage VARCHAR(20) NOT NULL;
GO

ALTER TABLE compte
ADD CONSTRAINT AK_email UNIQUE(email);
GO
