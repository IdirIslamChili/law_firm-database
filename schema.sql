-- ============================================================
-- Law Firm Management Database
-- Academic project (INF1096) : ER modeling -> relational mapping -> 3NF
-- ============================================================
-- 10 tables : 6 entity tables + 4 relationship tables
-- (including one ternary relationship with a (1,1) leg : Jugement)

CREATE TABLE Personnel_admin (
    ID_personnel INT PRIMARY KEY,
    nom          VARCHAR(100) NOT NULL,
    telephone    VARCHAR(20),
    fonction     VARCHAR(50)
);

CREATE TABLE Avocat (
    ID_avocat    INT PRIMARY KEY,
    nom          VARCHAR(100) NOT NULL,
    email        VARCHAR(100),
    specialite   VARCHAR(100),
    ID_personnel INT NOT NULL,
    FOREIGN KEY (ID_personnel) REFERENCES Personnel_admin (ID_personnel)
);

CREATE TABLE Client (
    ID_client INT PRIMARY KEY,
    nom       VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)
);

CREATE TABLE Tribunal (
    ID_tribunal  INT PRIMARY KEY,
    adresse      VARCHAR(200),
    nom_tribunal VARCHAR(100) NOT NULL
);

CREATE TABLE Dossier_client (
    Num_dossier  INT PRIMARY KEY,
    statut       VARCHAR(30),
    type_affaire VARCHAR(100),
    ID_client    INT NOT NULL,
    FOREIGN KEY (ID_client) REFERENCES Client (ID_client)
);

CREATE TABLE Salle_conf (
    Num_salle INT PRIMARY KEY,
    etage     INT
);

-- N-N : a staff member manages several files, a file can be
-- managed by several staff members
CREATE TABLE Gere (
    ID_personnel INT,
    Num_dossier  INT,
    PRIMARY KEY (ID_personnel, Num_dossier),
    FOREIGN KEY (ID_personnel) REFERENCES Personnel_admin (ID_personnel),
    FOREIGN KEY (Num_dossier)  REFERENCES Dossier_client (Num_dossier)
);

-- N-N : a lawyer represents several clients and vice versa
CREATE TABLE Represente (
    ID_avocat INT,
    ID_client INT,
    PRIMARY KEY (ID_avocat, ID_client),
    FOREIGN KEY (ID_avocat) REFERENCES Avocat (ID_avocat),
    FOREIGN KEY (ID_client) REFERENCES Client (ID_client)
);

-- Ternary relationship (Tribunal 1,1 - Avocat 1,N - Client 1,N) :
-- the (1,1) leg does NOT take part in the primary key, it stays
-- a simple foreign key because (ID_avocat, ID_client) -> ID_tribunal
CREATE TABLE Jugement (
    ID_avocat     INT,
    ID_client     INT,
    date_jugement DATE,
    heure_jugement TIME,
    juge          VARCHAR(100),
    ID_tribunal   INT NOT NULL,
    PRIMARY KEY (ID_avocat, ID_client),
    FOREIGN KEY (ID_avocat)   REFERENCES Avocat (ID_avocat),
    FOREIGN KEY (ID_client)   REFERENCES Client (ID_client),
    FOREIGN KEY (ID_tribunal) REFERENCES Tribunal (ID_tribunal)
);

-- Ternary relationship, all legs (1,N) : key = the 3 foreign keys
CREATE TABLE Rendez_vous (
    ID_avocat INT,
    ID_client INT,
    Num_salle INT,
    date_rdv  DATE,
    heure_rdv TIME,
    PRIMARY KEY (ID_avocat, ID_client, Num_salle),
    FOREIGN KEY (ID_avocat) REFERENCES Avocat (ID_avocat),
    FOREIGN KEY (ID_client) REFERENCES Client (ID_client),
    FOREIGN KEY (Num_salle) REFERENCES Salle_conf (Num_salle)
);
