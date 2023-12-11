USE ProjetBDD;
GO


/* TOKEN MDP OUBLIE */
ALTER TABLE compte
ADD token_mdp_oublie VARCHAR(50) DEFAULT NULL;
GO




/* CENTRALISATION PHOTO */
DROP TABLE photo;
GO

CREATE TABLE photo (
	id INT NOT NULL IDENTITY (1, 1),
	donnees_photo VARBINARY NOT NULL,
	CONSTRAINT PK_photo PRIMARY KEY(id)
);
GO


CREATE TABLE post_photo (
	id_post INT NOT NULL,
	id_photo INT NOT NULL,
	CONSTRAINT PK_post_photo PRIMARY KEY(id_post, id_photo)
);
GO

ALTER TABLE post_photo
ADD CONSTRAINT FK_post_photo_post FOREIGN KEY(id_post) REFERENCES post(id);

ALTER TABLE post_photo
ADD CONSTRAINT FK_post_photo_photo FOREIGN KEY(id_photo) REFERENCES photo(id);


ALTER TABLE compte
DROP COLUMN photo_profil;

ALTER TABLE compte
ADD id_photo INT;

ALTER TABLE compte
ADD CONSTRAINT FK_compte_photo FOREIGN KEY(id_photo) REFERENCES photo(id);


ALTER TABLE etablissement
DROP COLUMN photo;

ALTER TABLE etablissement
ADD id_photo INT;

ALTER TABLE etablissement
ADD CONSTRAINT FK_etablissement_photo FOREIGN KEY(id_photo) REFERENCES photo(id);