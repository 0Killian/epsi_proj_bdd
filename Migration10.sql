-- Petits INSERT pour les tests
USE retarrosoir;

-- INSERTION DANS COMPTE
INSERT INTO compte (etablissement_id, pseudo, nom_affichage, email, mdp, biographie, id_photo)
VALUES (1, 'tete', 'Théo', 'tete@mail.fr', 'mdp1', 'biographie1', 1);
GO

INSERT INTO compte (etablissement_id, pseudo, nom_affichage, email, mdp, biographie, id_photo)
VALUES (1, 'klekle', 'Claire', 'klekle@mail.fr', 'mdp2', 'biographie2', 2);
GO

INSERT INTO compte (etablissement_id, pseudo, nom_affichage, email, mdp, biographie, id_photo)
VALUES (1, 'kiki', 'Killian', 'kiki@mail.fr', 'mdp3', 'biographie3', 3);
GO

-- INSERTION DANS ETABLISSEMENT
INSERT INTO etablissement (nom, id_photo, code_postal, ville, pays)
VALUES ('IUT de Nantes', 1, 44300, 'Nantes', 'France');
GO

INSERT INTO etablissement (nom, id_photo, code_postal, ville, pays)
VALUES ('EPSI Nantes', 2, 44300, 'Nantes', 'France');
GO

-- INSERTION DANS POST
INSERT INTO post (compte_id, titre, description, date, temps_retard)
VALUES (1, 'Premier post', 'Contenu du premier post', GETDATE(), '00:10:00')
GO

INSERT INTO post (compte_id, titre, description, date, temps_retard)
VALUES (2, 'Deuxième post', 'Contenu du deuxième post', GETDATE(), '00:05:00')
GO

-- INSERTION DANS COMMENTAIRE
INSERT INTO commentaire (post_id, compte_id, texte)
VALUES (1, 2, 'Commentaire sur le premier post')
GO

INSERT INTO commentaire (post_id, compte_id, texte)
VALUES (2, 3, 'Commentaire sur le deuxième post')
GO

-- INSERTION DANS LIKE
INSERT INTO "like" (post_id, compte_id)
VALUES (1, 3)
GO

INSERT INTO "like" (post_id, compte_id)
VALUES (2, 1)
GO

-- INSERTION DES HASHTAGS
INSERT INTO hashtag (id_post, texte)
VALUES (1, 'retard')
GO

INSERT INTO hashtag (id_post, texte)
VALUES (1, 'SNCF')
GO

INSERT INTO hashtag (id_post, texte)
VALUES (2, 'Grève')
GO

-- INSERTION DANS ABONNEMENT
INSERT INTO abonnement (suiveur_id, suivi_personne_id)
VALUES (1, 2)
GO

INSERT INTO abonnement (suiveur_id, suivi_etablissement_id)
VALUES (2, 2)
GO

INSERT INTO abonnement (suiveur_id, suivi_etablissement_id)
VALUES (1, 2)
GO

INSERT INTO abonnement (suiveur_id, suivi_etablissement_id)
VALUES (3, 1)
GO

-- INSERTION DE PHOTOS DE PROFIL
INSERT INTO photo (donnees_photo, format_id)
VALUES ('0x64865489', 1)
GO

INSERT INTO photo (donnees_photo, format_id)
VALUES ('0x56756484', 1)

INSERT INTO photo (donnees_photo, format_id)
VALUES ('0x65464546', 2)

INSERT INTO photo (donnees_photo, format_id)
VALUES ('0x98765432', 1)

INSERT INTO photo (donnees_photo, format_id)
VALUES ('0x12345678', 2)

-- INSERTION DE PHOTOS DE POST
INSERT INTO post_photo (id_post, id_photo)
VALUES (1, 1)
GO

INSERT INTO post_photo (id_post, id_photo)
VALUES (2, 2)
GO

INSERT INTO post_photo (id_post, id_photo)
VALUES (3, 3)
GO

-- INSERTION DANS SIGNALEMENT
INSERT INTO signal_white_now (signaleur_id, signale_id, motif)
VALUES (1, 2, 'Contenu inaproprié')
GO

INSERT INTO signal_white_now (signaleur_id, signale_id, motif)
VALUES (3, 1, 'Spam')
GO

-- INSERTION DANS FORMAT
INSERT INTO format (nom)
VALUES ('.jpg')
GO

INSERT INTO format (nom)
VALUES ('.png')
GO