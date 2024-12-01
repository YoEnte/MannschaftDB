USE MannschaftDB;

CREATE TABLE players (
    ID int NOT NULL AUTO_INCREMENT,
    firstname varchar(64) NOT NULL,
    lastname varchar(64) NOT NULL,
    nickname varchar(64),
    activePay bit NOT NULL,
    useNick bit NOT NULL,
    prepayed int NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE penalties (
    ID int NOT NULL AUTO_INCREMENT,
    penaltyName varchar(16) NOT NULL,
    details varchar(128),
    price decimal(4,1) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE contributions (
    ID int NOT NULL AUTO_INCREMENT,
    price decimal(4,1) NOT NULL,
    since date NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE receivesPenalty (
    ID int NOT NULL AUTO_INCREMENT,
    playerID int NOT NULL,
    penaltyID int NOT NULL,
    happend date NOT NULL,
    served date,
    PRIMARY KEY (ID),
    FOREIGN KEY (playerID) REFERENCES players(ID),
    FOREIGN KEY (penaltyID) REFERENCES penalties(ID)
);

CREATE TABLE monthlyPay (
    ID int NOT NULL AUTO_INCREMENT,
    playerID int NOT NULL,
    contributionID int NOT NULL,
    payed date,
    PRIMARY KEY (ID),
    FOREIGN KEY (playerID) REFERENCES players(ID),
    FOREIGN KEY (contributionID) REFERENCES contributions(ID)
);

CREATE TABLE specialPay (
    ID int NOT NULL AUTO_INCREMENT,
    penaltyName varchar(16) NOT NULL,
    details varchar(128),
    price decimal(4,1) NOT NULL,
    happend date NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (playerID) REFERENCES players(ID)
);