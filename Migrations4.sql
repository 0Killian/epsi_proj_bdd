USE ProjetBDD;
GO

CREATE TRIGGER golden_like_insert
ON [like]
INSTEAD OF INSERT
AS
BEGIN
    IF (SELECT golden FROM inserted) = 0
    OR (SELECT dernier_golden_like FROM compte WHERE compte.id = (SELECT compte_id FROM inserted)) IS NULL
    OR ((SELECT DATEPART(week, dernier_golden_like) FROM compte WHERE compte.id = (SELECT compte_id FROM inserted)) <= DATEPART(week, GETDATE()))
    BEGIN
        INSERT INTO [like] (compte_id, post_id, golden)
        SELECT compte_id, post_id, golden
        FROM inserted
    END
END;
GO

CREATE TRIGGER golden_like
ON [like]
AFTER INSERT
AS
BEGIN
    IF (SELECT golden FROM inserted) = 1
    BEGIN
        UPDATE compte
        SET dernier_golden_like = GETDATE()
        WHERE compte.id = (SELECT compte_id FROM inserted)
    END
END;
GO

CREATE TRIGGER golden_like_cancel
ON [like]
INSTEAD OF DELETE
AS
BEGIN
    IF (SELECT golden FROM deleted) = 0
	BEGIN
	DELETE FROM [like]
	WHERE post_id = (SELECT post_id FROM deleted)
	  AND compte_id = (SELECT compte_id FROM deleted);
	END
END;
