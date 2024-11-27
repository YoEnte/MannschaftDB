USE MannschaftDB;

CREATE TABLE players (
    ID int NOT NULL AUTO_INCREMENT,
    firstname varchar(64) NOT NULL,
    lastname varchar(64) NOT NULL,
    nickname varchar(64),
    active: boolean NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE penalties (
    ID int NOT NULL AUTO_INCREMENT,
    penaltyName varchar(64) NOT NULL,
    details varchar(512),
    price: decimal(4,1),
    PRIMARY KEY (ID)
);

CREATE TABLE contributions (
    ID int NOT NULL AUTO_INCREMENT,
    price: decimal(4,1),
    since: date,
    PRIMARY KEY (ID)
);

CREATE TABLE receivesPenalty (
    ID int NOT NULL AUTO_INCREMENT,
    playerID int NOT NULL,
    penaltyID int NOT NULL,
    served boolean,
    PRIMARY KEY (ID),
    FOREIGN KEY (playerID) REFERENCES players(ID),
    FOREIGN KEY (penaltyID) REFERENCES penalties(ID),
);

CREATE TABLE monthlyPay (
    ID int NOT NULL AUTO_INCREMENT,
    playerID int NOT NULL,
    contributionID int NOT NULL,
    payed boolean,
    PRIMARY KEY (ID),
    FOREIGN KEY (playerID) REFERENCES players(ID),
    FOREIGN KEY (contributionID) REFERENCES contributions(ID),
);