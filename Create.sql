USE ProjetBDD;
GO

CREATE TABLE [compte] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [etablissement_id] int NOT NULL,
  [pseudo] varchar(20) NOT NULL,
  [email] varchar(40) NOT NULL,
  [mdp] varchar(60) NOT NULL,
  [photo_profil] varbinary,
  [biographie] varchar(150) NOT NULL,
  [dernier_golden_like] date
)
GO

CREATE TABLE [etablissement] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [nom] nvarchar(255) NOT NULL,
  [photo] varbinary,
  [code_postal] int NOT NULL,
  [ville] varchar(75) NOT NULL,
  [pays] varchar(50) NOT NULL
)
GO

CREATE TABLE [post] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [compte_id] int NOT NULL,
  [titre] varchar(75) NOT NULL,
  [description] varchar(2200) NOT NULL,
  [date] date NOT NULL,
  [temps_retard] time NOT NULL,
  [lien_video] varchar(255)
)
GO

CREATE TABLE [hashtag] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [texte] varchar(25) NOT NULL
)
GO

CREATE TABLE [post_hashtag] (
  [id_post] int NOT NULL,
  [id_hashtag] int NOT NULL,
  CONSTRAINT PK_post_hashtag PRIMARY KEY(id_post, id_hashtag)
)
GO

CREATE TABLE [photo] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [id_post] int NOT NULL,
  [code_photo] varbinary NOT NULL
)
GO

CREATE TABLE [like] (
  [post_id] int NOT NULL,
  [compte_id] int NOT NULL,
  [golden] bit
)
GO

CREATE TABLE [commentaire] (
  [post_id] int NOT NULL,
  [compte_id] int NOT NULL,
  [texte] varchar(2200) NOT NULL
)
GO

CREATE TABLE [abonnement] (
  [suiveur_id] int NOT NULL,
  [suivi_personne_id] int,
  [suivi_etablissement_id] int,
  [suivi_hashtag_id] int
)
GO

CREATE TABLE [signalement] (
  [id] int PRIMARY KEY NOT NULL IDENTITY(1, 1),
  [signaleur_id] int NOT NULL,
  [signale_id] int,
  [post_id] int,
  [motif] varchar(150) NOT NULL
)
GO

ALTER TABLE [post] ADD FOREIGN KEY ([compte_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [commentaire] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([id])
GO

ALTER TABLE [commentaire] ADD FOREIGN KEY ([compte_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [like] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([id])
GO

ALTER TABLE [like] ADD FOREIGN KEY ([compte_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [compte] ADD FOREIGN KEY ([etablissement_id]) REFERENCES [etablissement] ([id])
GO

ALTER TABLE [abonnement] ADD FOREIGN KEY ([suiveur_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [abonnement] ADD FOREIGN KEY ([suivi_personne_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [photo] ADD FOREIGN KEY ([id_post]) REFERENCES [post] ([id])
GO

ALTER TABLE [post_hashtag] ADD FOREIGN KEY ([id_post]) REFERENCES [post] ([id])
GO

ALTER TABLE [post_hashtag] ADD FOREIGN KEY ([id_hashtag]) REFERENCES [hashtag] ([id])
GO

ALTER TABLE [abonnement] ADD FOREIGN KEY ([suivi_etablissement_id]) REFERENCES [etablissement] ([id])
GO

ALTER TABLE [abonnement] ADD FOREIGN KEY ([suivi_hashtag_id]) REFERENCES [hashtag] ([id])
GO

ALTER TABLE [signalement] ADD FOREIGN KEY ([signaleur_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [signalement] ADD FOREIGN KEY ([signale_id]) REFERENCES [compte] ([id])
GO

ALTER TABLE [signalement] ADD FOREIGN KEY ([post_id]) REFERENCES [post] ([id])
GO
