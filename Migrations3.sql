USE ProjetBDD;
GO

/* ALTER TABLE compte
ADD suspendu BIT NOT NULL DEFAULT 0;
GO */

CREATE TRIGGER suspendre_compte
ON signalement
AFTER INSERT
AS
BEGIN
    /*
    Récuperer l'id du compte à suspendre (soit signale_id, soit post_id avec un JOIN)
    */
    DECLARE @id_compte INT;
    SET @id_compte = (
        SELECT CASE
            WHEN signale_id IS NOT NULL THEN signale_id
            WHEN post_id    IS NOT NULL THEN (SELECT compte_id FROM post WHERE id = (SELECT post_id FROM inserted))
        END
        FROM inserted
    );

    /*
    Un utilisateur peut signaler un post (signalement.post_id) ou un autre utilisateur (signalement.signale_id).
    Si un utilisateur a 10 signalements, son compte est suspendu.
    */
    IF (
        SELECT COUNT(*) FROM signalement
        INNER JOIN post ON post.id = signalement.post_id
        WHERE  signale_id = @id_compte
            OR post.compte_id = @id_compte
    ) >= 10
    BEGIN
        /*
        Suspendre le compte
        */
        UPDATE compte
        SET suspendu = 1
        WHERE id = @id_compte;
    END
END;
