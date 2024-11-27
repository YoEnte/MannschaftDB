USE MannschaftDB;

CREATE TABLE spieler (
    ID int NOT NULL AUTO_INCREMENT,
    firstname varchar(64) NOT NULL,
    lastname varchar(64) NOT NULL,
    spitznamen varchar(64),
    PRIMARY KEY (ID)
);