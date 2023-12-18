USE ProjetBDD;
GO

CREATE TABLE format (
    id INT NOT NULL IDENTITY(1, 1),
    nom VARCHAR(4) NOT NULL UNIQUE,
    CONSTRAINT PK_format PRIMARY KEY (id),
);

ALTER TABLE photo
ADD format_id INT NOT NULL;

ALTER TABLE photo
ADD CONSTRAINT FK_photo_format FOREIGN KEY (format_id) REFERENCES format(id);
