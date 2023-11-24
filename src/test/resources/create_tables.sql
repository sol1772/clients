CREATE TABLE IF NOT EXISTS Client
(
    id           INT AUTO_INCREMENT,
    firstName    VARCHAR(30) NOT NULL,
    lastName     VARCHAR(30) NOT NULL,
    passwordHash VARCHAR(128),
    registeredAt TIMESTAMP,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS Contact
(
    id          INT AUTO_INCREMENT,
    clientId    INT,
    txtContent  VARCHAR(50)             NOT NULL,
    contactType ENUM ('PHONE', 'EMAIL') NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT Uq_contacts UNIQUE (clientId, txtContent, contactType)
);