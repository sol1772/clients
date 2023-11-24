CREATE TABLE IF NOT EXISTS PUBLIC.CLIENT
(
    id
    INT
    AUTO_INCREMENT
    NOT
    NULL
    PRIMARY
    KEY,
    firstName
    VARCHAR
(
    30
) NOT NULL,
    lastName VARCHAR
(
    30
) NOT NULL,
    passwordHash VARCHAR
(
    128
),
    registeredAt TIMESTAMP
    );
CREATE TABLE IF NOT EXISTS PUBLIC.CONTACT
(
    id
    INT
    AUTO_INCREMENT
    NOT
    NULL
    PRIMARY
    KEY,
    clientId
    INT,
    txtContent
    VARCHAR
(
    50
) NOT NULL,
    contactType ENUM
(
    'PHONE',
    'EMAIL'
) NOT NULL,
    CONSTRAINT Uq_contacts UNIQUE
(
    clientId,
    txtContent,
    contactType
)
    );
-- INSERT INTO Client (id, firstName,lastName,registeredAt) VALUES (1, 'Alina', 'Zagitova', now());
-- INSERT INTO Client (id, firstName,lastName,registeredAt) VALUES (2, 'Kamila', 'Valieva', now());
-- INSERT INTO Client (id, firstName,lastName,registeredAt) VALUES (3, 'Dmitry', 'Petrov', now());
-- INSERT INTO Client (id, firstName,lastName,registeredAt) VALUES (4, 'Srinivasa', 'Ramanujan', now());
-- INSERT INTO Client (id, firstName,lastName,registeredAt) VALUES (5, 'Godfrey', 'Hardy', now());