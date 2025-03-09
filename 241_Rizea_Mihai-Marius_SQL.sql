--4.Implementați în Oracle diagrama conceptuală realizată: definiți toate tabelele, 
--adăugând toate constrângerile de integritate necesare (chei primare, cheile externe etc).

--1.Pentru tabelul SALA
CREATE TABLE Sala (
    id_sala NUMBER PRIMARY KEY,
    nr_clienti NUMBER,
    venituri NUMBER(10,2),
    nr_produse NUMBER,
    nume_manager VARCHAR2(255),
    deschis VARCHAR2(5)
);

--2.Pentru tabelul PRODUSE

CREATE TABLE Produse (
    id_produse NUMBER PRIMARY KEY,
    nume VARCHAR2(100),
    cantitate NUMBER,
    pret NUMBER(10, 2)
);


--3.Pentru tabelul APARATE

CREATE TABLE Aparate (
    id_aparat NUMBER PRIMARY KEY,
    id_sala NUMBER,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    nume VARCHAR2(100),
    masa_maxima NUMBER,
    disponibilitate VARCHAR2(5),
    grupa_musculara_lucrata VARCHAR2(255)
);

--4.Pentru tabelul ABONAMENT

CREATE TABLE Abonament (
    id_abonament NUMBER PRIMARY KEY,
    id_sala NUMBER,
    pret NUMBER(10,2),
    tip_abonament VARCHAR2(100),
    data_valabilitate DATE,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

--5.Pentru tabelul CLIENT

CREATE TABLE Client ( 
    id_client NUMBER PRIMARY KEY,
    id_abonament NUMBER,
    nume VARCHAR2(255),
    prenume VARCHAR2(255),
    email VARCHAR2(255),
    nr_telefon VARCHAR2(15),
    FOREIGN KEY (id_abonament) REFERENCES Abonament(id_abonament)
);


--6.Pentru tabelul ACHIZITIE

CREATE TABLE Achizitie (
    id_achizitie NUMBER PRIMARY KEY,
    id_client NUMBER,
    data DATE,
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

--7.Pentru tabelul DETALII_ACHIZITIE
CREATE TABLE Detalii_Achizitie (
    id_detalii_achizitie NUMBER PRIMARY KEY,
    id_produse NUMBER,
    id_achizitie NUMBER,
    cantitate NUMBER,
    FOREIGN KEY (id_produse) REFERENCES Produse(id_produse),
    FOREIGN KEY (id_achizitie) REFERENCES Achizitie(id_achizitie)
);


--8.Pentru tabelul DETINE

CREATE TABLE Detine (
    id_sala NUMBER,
    id_produse NUMBER,
    PRIMARY KEY (id_sala, id_produse),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala),
    FOREIGN KEY (id_produse) REFERENCES Produse(id_produse)
);


--9.Pentru tabelul UTILITATI

CREATE TABLE Utilitati (
    id_utilitati NUMBER PRIMARY KEY,
    nume VARCHAR2(100),
    cantitate NUMBER,
    pret NUMBER(10, 2),
    id_sala NUMBER,
    FOREIGN KEY (id_sala) REFERENCES SALA(id_sala)
);

--10.Pentru tabelul FACTURI 

CREATE TABLE Facturi (
    id_facturi NUMBER PRIMARY KEY,
    suma NUMBER(10,2),
    data DATE
);


--11.Pentru tabelul FACTURI_UTILITATI

CREATE TABLE Facturi_Utilitati (
    id_facturi NUMBER,
    id_facturi_utilitati NUMBER,
    PRIMARY KEY (id_facturi, id_facturi_utilitati),
    FOREIGN KEY (id_facturi) REFERENCES Facturi(id_facturi)
);


--12.Pentru tabelul UTILITATI_PLATITE_PRIN

CREATE TABLE Utilitati_platite_prin (
    id_utilitati NUMBER,
    id_facturi NUMBER,
    id_facturi_utilitati NUMBER,
    PRIMARY KEY (id_utilitati, id_facturi, id_facturi_utilitati),
    FOREIGN KEY (id_utilitati) REFERENCES Utilitati(id_utilitati),
    FOREIGN KEY (id_facturi, id_facturi_utilitati) REFERENCES Facturi_Utilitati(id_facturi, id_facturi_utilitati)
);


–13.Pentru tabelul FACTURI_ABONAMENT

CREATE TABLE Facturi_Abonament (
    id_facturi NUMBER,
    id_facturi_abonament NUMBER,
    id_client NUMBER,
    PRIMARY KEY (id_facturi, id_facturi_abonament),
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_facturi) REFERENCES Facturi(id_facturi)
);


--14.Pentru tabelul FACTURI_PRODUSE

CREATE TABLE Facturi_Produse (
    id_facturi NUMBER,
    id_facturi_produse NUMBER,
    id_achizitie NUMBER,
    PRIMARY KEY (id_facturi, id_facturi_produse),
    FOREIGN KEY (id_achizitie) REFERENCES Achizitie(id_achizitie),
    FOREIGN KEY (id_facturi) REFERENCES Facturi(id_facturi)
);


-- 5. Adăugați informații coerente în tabelele create (minim 5 înregistrări pentru fiecare entitate independentă; 
--minim 10 înregistrări pentru fiecare tabelă asociativă)

--1.Pentru tabelul SALA
INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (1, 50, 1500.75, 20, 'Ion Popescu', 'Da');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (2, 30, 1200.50, 15, 'Maria Ionescu', 'Nu');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (3, 40, 2000.00, 25, 'George Marinescu', 'Da');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (4, 20, 800.25, 10, 'Elena Popa', 'Nu');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (5, 60, 2500.90, 30, 'Alexandru Stoica', 'Da');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (6, 45, 1800.60, 18, 'Ana Radu', 'Nu');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (7, 55, 2200.35, 22, 'Andrei Dima', 'Da');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (8, 25, 1000.00, 12, 'Cristina Vlad', 'Nu');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (9, 35, 1500.50, 16, 'Mihai Pop', 'Da');


INSERT INTO Sala (id_sala, nr_clienti, venituri, nr_produse, nume_manager, deschis)
VALUES (10, 48, 1900.75, 19, 'Ana-Maria Radulescu', 'Nu');


--2.Pentru tabelul PRODUSE

INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (1, 'Proteina', 50, 69.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (2, 'Bara proteica', 40, 2.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (3, 'Energy drink', 30, 3.49);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (4, 'Multivitamine', 25, 19.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (5, 'Mix seminte', 20, 7.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (6, 'Batoane energizante', 35, 1.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (7, 'Omega-3', 15, 24.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (8, 'Pudra de carbohidrati', 30, 29.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (9, 'Aminoacizi', 20, 39.99);
INSERT INTO Produse (id_produse, nume, cantitate, pret) VALUES (10, 'Bautura proteica', 10, 4.99);


--3.Pentru tabelul APARATE

INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (1, 1, 'Banca abdomene', 150, 'DA', 'Abdomen');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (2, 1, 'Bicicleta', 200, 'DA', 'Cardio');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (3, 2, 'Ghemuit cu gantere', 100, 'NU', 'Biceps');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (4, 2, 'Scripete spate', 180, 'DA', 'Spate');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (5, 3, 'Bench press', 220, 'DA', 'Piept');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (6, 3, 'Leg press', 300, 'DA', 'Picioare');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (7, 4, 'Tractiuni la bara', 180, 'NU', 'Spate');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (8, 5, 'Extensii triceps', 150, 'DA', 'Triceps');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (9, 6, 'Fluturari gantere', 120, 'DA', 'Piept');


INSERT INTO Aparate (id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
VALUES (10, 7, 'Fandari', 100, 'NU', 'Picioare');


--4.Pentru tabelul ABONAMENT

INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (1, 1, 150.00, 'Abonament Lunar', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (2, 1, 300.00, 'Abonament Trimestrial', TO_DATE('2025-03-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (3, 2, 200.00, 'Abonament Lunar', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (4, 2, 500.00, 'Abonament Anual', TO_DATE('2025-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (5, 3, 180.00, 'Abonament Lunar', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (6, 3, 450.00, 'Abonament Semestrial', TO_DATE('2025-06-30', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (7, 4, 250.00, 'Abonament Lunar', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (8, 4, 600.00, 'Abonament Anual', TO_DATE('2025-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (9, 5, 190.00, 'Abonament Lunar', TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO Abonament (id_abonament, id_sala, pret, tip_abonament, data_valabilitate) VALUES (10, 5, 400.00, 'Abonament Trimestrial', TO_DATE('2025-02-28', 'YYYY-MM-DD'));


--5.Pentru tabelul CLIENT

INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (1, 1, 'Popescu', 'Ion', 'popescu.ion@gmail.com', '0721123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (2, 2, 'Ionescu', 'Maria', 'ionescu.maria@gmail.com', '0732123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (3, 3, 'Pop', 'Ana', 'pop.ana@gmail.com', '0743123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (4, 4, 'Georgescu', 'Andrei', 'georgescu.andrei@gmail.com', '0754123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (5, 5, 'Popa', 'Elena', 'popa.elena@gmail.com', '0765123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (6, 6, 'Dragomir', 'Mihai', 'dragomir.mihai@gmail.com', '0776123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (7, 7, 'Stancu', 'Ioana', 'stancu.ioana@gmail.com', '0787123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (8, 8, 'Dumitrescu', 'Alex', 'dumitrescu.alex@gmail.com', '0798123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (9, 9, 'Radu', 'Andreea', 'radu.andreea@gmail.com', '0709123456');


INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (10, 10, 'Neagu', 'Cristian', 'neagu.cristian@gmail.com', '0710123456');


--6.Pentru tabelul ACHIZITIE

INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (1, 1, TO_DATE('2024-12-04', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (2, 2, TO_DATE('2024-12-08', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (3, 3, TO_DATE('2024-12-06', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (4, 4, TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (5, 5, TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (6, 6, TO_DATE('2024-12-03', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (7, 7, TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (8, 8, TO_DATE('2024-12-10', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (9, 9, TO_DATE('2024-12-02', 'YYYY-MM-DD'));
INSERT INTO Achizitie (id_achizitie, id_client, data) VALUES (10, 10, TO_DATE('2024-12-05', 'YYYY-MM-DD'));


--7.Pentru tabelul DETALII_ACHIZITIE

INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (1, 1, 1, 5);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (2, 2, 2, 10);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (3, 3, 3, 3);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (4, 4, 4, 8);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (5, 5, 5, 2);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (6, 6, 6, 7);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (7, 7, 7, 4);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (8, 8, 8, 6);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (9, 9, 9, 9);
INSERT INTO Detalii_Achizitie (id_detalii_achizitie, id_produse, id_achizitie, cantitate) VALUES (10, 10, 10, 1);


--8.Pentru tabelul DETINE

INSERT INTO Detine (id_sala, id_produse) VALUES (1, 1);
INSERT INTO Detine (id_sala, id_produse) VALUES (1, 2);
INSERT INTO Detine (id_sala, id_produse) VALUES (2, 3);
INSERT INTO Detine (id_sala, id_produse) VALUES (2, 4);
INSERT INTO Detine (id_sala, id_produse) VALUES (3, 5);
INSERT INTO Detine (id_sala, id_produse) VALUES (3, 6);
INSERT INTO Detine (id_sala, id_produse) VALUES (4, 7);
INSERT INTO Detine (id_sala, id_produse) VALUES (4, 8);
INSERT INTO Detine (id_sala, id_produse) VALUES (5, 9);
INSERT INTO Detine (id_sala, id_produse) VALUES (5, 10);


--9.Pentru tabelul UTILITATI

INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (1, 1, 'Gaze naturale', 100, 150.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (2, 2, 'Electricitate', 200, 200.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (3, 3, 'Apa calda', 150, 100.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (4, 4, 'Apa rece', 300, 80.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (5, 5, 'Intretinere', 50, 300.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (6, 6, 'Internet', 70, 250.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (7, 7, 'Apa potabila', 200, 120.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (8, 8, 'Cablu', 180, 90.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (9, 9, 'Curatenie', 80, 180.00);
INSERT INTO Utilitati (id_utilitati, id_sala, nume, cantitate, pret) VALUES (10, 10, 'Gaze', 30, 400.00);


--10.Pentru tabelul FACTURI 

INSERT INTO Facturi (id_facturi, suma, data) VALUES (1, 500.00, TO_DATE('2024-12-01', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (2, 750.00, TO_DATE('2024-12-03', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (3, 600.00, TO_DATE('2024-12-05', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (4, 900.00, TO_DATE('2024-12-07', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (5, 550.00, TO_DATE('2024-12-09', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (6, 400.00, TO_DATE('2024-12-10', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (7, 700.00, TO_DATE('2024-12-12', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (8, 650.00, TO_DATE('2024-12-14', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (9, 850.00, TO_DATE('2024-12-16', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (10, 500.00, TO_DATE('2024-12-18', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (11, 450.00, TO_DATE('2024-12-20', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (12, 800.00, TO_DATE('2024-12-22', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (13, 670.00, TO_DATE('2024-12-24', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (14, 950.00, TO_DATE('2024-12-26', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (15, 600.00, TO_DATE('2024-12-28', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (16, 420.00, TO_DATE('2024-12-30', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (17, 730.00, TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (18, 640.00, TO_DATE('2025-01-03', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (19, 920.00, TO_DATE('2025-01-05', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (20, 580.00, TO_DATE('2025-01-07', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (21, 470.00, TO_DATE('2025-01-09', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (22, 760.00, TO_DATE('2025-01-11', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (23, 630.00, TO_DATE('2025-01-13', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (24, 880.00, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (25, 590.00, TO_DATE('2025-01-17', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (26, 460.00, TO_DATE('2025-01-19', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (27, 740.00, TO_DATE('2025-01-21', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (28, 650.00, TO_DATE('2025-01-23', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (29, 910.00, TO_DATE('2025-01-25', 'YYYY-MM-DD'));
INSERT INTO Facturi (id_facturi, suma, data) VALUES (30, 600.00, TO_DATE('2025-01-27', 'YYYY-MM-DD'));


--11.Pentru tabelul FACTURI_UTILITATI

INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (1, 1);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (2, 2);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (3, 3);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (4, 4);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (5, 5);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (6, 6);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (7, 7);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (8, 8);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (9, 9);
INSERT INTO Facturi_Utilitati (id_facturi, id_facturi_utilitati) VALUES (10, 10);


--12.Pentru tabelul UTILITATI_PLATITE_PRIN

INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (1, 1, 1);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (2, 2, 2);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (3, 3, 3);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (4, 4, 4);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (5, 5, 5);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (6, 6, 6);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (7, 7, 7);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (8, 8, 8);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (9, 9, 9);
INSERT INTO Utilitati_platite_prin (id_utilitati, id_facturi_utilitati, id_facturi) VALUES (10, 10, 10);


--13.Pentru tabelul FACTURI_ABONAMENT

INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (1, 1, 11);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (2, 2, 12);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (3, 3, 13);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (4, 4, 14);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (5, 5, 15);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (6, 6, 16);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (7, 7, 17);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (8, 8, 18);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (9, 9, 19);
INSERT INTO Facturi_Abonament (id_facturi_abonament, id_client, id_facturi) VALUES (10, 10, 20);


--14.Pentru tabelul FACTURI_PRODUSE

INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (1, 21, 1);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (2, 22, 2);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (3, 23, 3);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (4, 24, 4);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (5, 25, 5);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (6, 26, 6);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (7, 27, 7);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (8, 28, 8);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (9, 29, 9);
INSERT INTO Facturi_Produse (id_facturi_produse, id_facturi, id_achizitie) VALUES (10, 30, 10);


--6. Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat independent 
-- care să utilizeze toate cele 3 tipuri de colecții studiate. Apelați subprogramul. 

CREATE OR REPLACE TYPE aparate_tip AS OBJECT (
    id_aparat NUMBER,
    id_sala NUMBER,
    nume VARCHAR2(100),
    masa_maxima NUMBER,
    disponibilitate VARCHAR2(5),
    grupa_musculara_lucrata VARCHAR2(255)
);
CREATE OR REPLACE TYPE aparate_table AS TABLE OF aparate_tip;

-- Pentru TABEL IMBRICAT FUNCTIA:

CREATE OR REPLACE FUNCTION EX6_COLECTII1 (id IN sala.id_sala%TYPE)
   RETURN aparate_table
IS
    tabel aparate_table := aparate_table();
    nr_sali NUMBER;
    nr_aparate NUMBER;

    exceptie1 EXCEPTION; -- exceptie pentru ca nu exista sala cu id ul dat
    exceptie2 EXCEPTION; -- exceptie ca nu exista aparate in sala data
BEGIN
    SELECT COUNT(*)
    INTO nr_sali
    FROM sala
    WHERE id_sala = id;

    IF nr_sali = 0 THEN
        RAISE exceptie1;
    END IF;

    SELECT COUNT(*)
    INTO nr_aparate
    FROM aparate
    WHERE id_sala = id;

    IF nr_aparate = 0 THEN
        RAISE exceptie2;
    END IF;
    
    -- creez un obiect cu datele din coloane, pe care-l pun in tabel
    SELECT aparate_tip(
               id_aparat,
               id_sala,
               nume,
               masa_maxima,
               disponibilitate,
               grupa_musculara_lucrata
           )
    BULK COLLECT INTO tabel
    FROM aparate
    WHERE id_sala = id;

    RETURN tabel;

EXCEPTION
    WHEN exceptie1 THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista sala cu ID-ul: ' || id);
    WHEN exceptie2 THEN
        DBMS_OUTPUT.PUT_LINE('Sala cu ID-ul: ' || id || ' nu are aparate.');
END EX6_COLECTII1;

-- BLOC APEL TABEL IMBRICAT:
DECLARE
    result aparate_table;
    id sala.id_sala%type:='&id_sala';
BEGIN
    result := EX6_COLECTII1(id);
    DBMS_OUTPUT.PUT_LINE('Sala cu id-ul: ' || id || ' contine urmatoarele aparate');
    FOR i IN 1..result.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Aparat ID: ' || result(i).id_aparat || 
                            ', Nume: ' || result(i).nume || 
                            ', Masa maxima: ' || result(i).masa_maxima);
    END LOOP;
END;

-- Pentru Tabel INDEXAT PROCEDURA:

CREATE OR REPLACE PROCEDURE EX6_COLECTII_2(
    id IN sala.id_sala%TYPE
)
IS
    TYPE aparate_index_table IS TABLE OF aparate_tip INDEX BY PLS_INTEGER;
    tabel_indexat aparate_index_table;
    nr_sali NUMBER;
    nr_aparate NUMBER;
    
    exceptie1 EXCEPTION;
    exceptie2 EXCEPTION;

BEGIN
    SELECT COUNT(*)
    INTO nr_sali
    FROM sala
    WHERE id_sala = id;

    IF nr_sali = 0 THEN
        RAISE exceptie1;
    END IF;

    SELECT COUNT(*)
    INTO nr_aparate
    FROM aparate
    WHERE id_sala = id;

    IF nr_aparate = 0 THEN
        RAISE exceptie2;
    END IF;

    DECLARE
        idx PLS_INTEGER := 1;
    BEGIN
        FOR r IN (
            SELECT id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata
            FROM aparate
            WHERE id_sala = id
        ) LOOP
            tabel_indexat(idx) := aparate_tip(r.id_aparat, r.id_sala, r.nume, r.masa_maxima, r.disponibilitate, r.grupa_musculara_lucrata);
            idx := idx + 1;
        END LOOP;
    END;

    DBMS_OUTPUT.PUT_LINE('Aparate in tabelul indexat:');
    FOR i IN 1..tabel_indexat.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Aparat ID: ' || tabel_indexat(i).id_aparat || 
                             ', Nume: ' || tabel_indexat(i).nume || 
                             ', Masa maxima: ' || tabel_indexat(i).masa_maxima);
    END LOOP;

EXCEPTION
    WHEN exceptie1 THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista sala cu ID-ul: ' || id);
    WHEN exceptie2 THEN
        DBMS_OUTPUT.PUT_LINE('Sala cu ID-ul: ' || id || ' nu are aparate.');
END EX6_COLECTII_2;

-- BLOC APEL TABEL INDEXAT:
DECLARE
    id sala.id_sala%type:='&id_sala';
BEGIN
    EX6_COLECTII_2(id);
END;

-- Pentru VECTOR PROCEDURA:

CREATE OR REPLACE PROCEDURE EX6_COLECTII_3(
    id IN sala.id_sala%TYPE
)
IS
    TYPE aparate_vector IS varray(100) OF aparate_tip;
    vector aparate_vector;
    nr_sali NUMBER;
    nr_aparate NUMBER;

    exceptie1 EXCEPTION;
    exceptie2 EXCEPTION;

BEGIN
    SELECT COUNT(*)
    INTO nr_sali
    FROM sala
    WHERE id_sala = id;

    IF nr_sali = 0 THEN
        RAISE exceptie1;
    END IF;

    SELECT COUNT(*)
    INTO nr_aparate
    FROM aparate
    WHERE id_sala = id;

    IF nr_aparate = 0 THEN
        RAISE exceptie2;
    END IF;

    SELECT aparate_tip(id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata)
    BULK COLLECT INTO vector
    FROM aparate
    WHERE id_sala = id;

    DBMS_OUTPUT.PUT_LINE('Aparate in vector:');
    FOR i IN 1..vector.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Aparat ID: ' || vector(i).id_aparat ||
                             ', Nume: ' || vector(i).nume ||
                             ', Masa maxima: ' || vector(i).masa_maxima);
    END LOOP;

EXCEPTION
    WHEN exceptie1 THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista sala cu ID-ul: ' || id);
    WHEN exceptie2 THEN
        DBMS_OUTPUT.PUT_LINE('Sala cu ID-ul: ' || id || ' nu are aparate.');
END EX6_COLECTII_3;



-- Bloc Apel Vector:
DECLARE
    id sala.id_sala%type:='&id_sala';
BEGIN
    EX6_COLECTII_3(id);
END;

-- Pentru a fii si mai eficienti cu memoria putem folosii o astfel de abordare in cazul varray ului, in care extindem vectorul de fiecare data cand inseram in el:
FOR aparat IN (SELECT id_aparat, id_sala, nume, masa_maxima, disponibilitate, grupa_musculara_lucrata FROM aparate WHERE id_sala = id) LOOP
    vector.EXTEND;
    vector(vector.COUNT) := aparate_tip(
            aparat.id_aparat,
            aparat.id_sala,
            aparat.nume,
            aparat.masa_maxima,
            aparat.disponibilitate,
            aparat.grupa_musculara_lucrata
        );
END LOOP;

--7.Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat
-- independent care să utilizeze 2 tipuri diferite de cursoare studiate, unul dintre acestea fiind cursor 
-- parametrizat, dependent de celălalt cursor. Apelați subprogramul.

-- Varianta 1: cu ciclu cursor:
create or replace procedure Exercitul7_cursoare
as 
    cursor c1_sali is 
        select id_sala as id
        from sala;

    cursor c2_id_produse(id sala.id_sala%type) is
        select p.nume, p.cantitate
        from sala s
        join detine d on s.id_sala = d.id_sala
        join produse p on p.id_produse = d.id_produse
        where s.id_sala = id;
    gasit BOOLEAN:=FALSE; -- variabila pe care o folosesc la fiecare iteratie pentru a vedea daca am in sala produse pentru a putea da un mesaj specific. 
begin
    for sala in c1_sali loop
        DBMS_OUTPUT.PUT_LINE('Produsele din sala cu id: ' || sala.id);
        gasit:=FALSE;
        for produs in c2_id_produse(sala.id) loop
            DBMS_OUTPUT.PUT_LINE(produs.nume || ' ' || produs.cantitate);
            gasit:=TRUE;
        end loop;
        if gasit = FALSE then
            DBMS_OUTPUT.PUT_LINE('Sala nu detine produse');
        end if;
        DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
end Exercitul7_cursoare;

-- Bloc Aoel Varianta 1:
begin
    exercitul7_cursoare();
end;

-- Varianta 2: cu open + fetch:
CREATE OR REPLACE PROCEDURE Exercitul7_cursoare2
AS 
    CURSOR c1_sali IS 
        SELECT id_sala AS id
        FROM sala;

    CURSOR c2_id_produse(id sala.id_sala%type) IS
        SELECT p.nume, p.cantitate
        FROM sala s
        JOIN detine d ON s.id_sala = d.id_sala
        JOIN produse p ON p.id_produse = d.id_produse
        WHERE s.id_sala = id;

    v_nume produse.nume%TYPE;
    v_cantitate produse.cantitate%TYPE;

BEGIN
    OPEN c1_sali;
    LOOP
        FETCH c1_sali INTO v_nume;
        EXIT WHEN c1_sali%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Produsele din sala cu id: ' || v_nume);

        OPEN c2_id_produse(v_nume);
        
        FETCH c2_id_produse INTO v_nume, v_cantitate;

       IF c2_id_produse%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('Sala nu detine produse');
        ELSE
            LOOP
                DBMS_OUTPUT.PUT_LINE(v_nume || ' ' || v_cantitate);
                FETCH c2_id_produse INTO v_nume, v_cantitate;
                EXIT WHEN c2_id_produse%NOTFOUND;
            END LOOP;
        END IF;
        CLOSE c2_id_produse;
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
    CLOSE c1_sali;
END Exercitul7_cursoare2;

-- Bloc Apel Varianta 2:
begin
    Exercitul7_cursoare2();
end;


-- 8.Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat independent de tip
-- funcție care să utilizeze într-o singură comandă SQL 3 dintre tabelele create. Tratați toate excepțiile care pot 
-- apărea, incluzând excepțiile predefinite NO_DATA_FOUND și TOO_MANY_ROWS. Apelați subprogramul astfel încât să 
-- evidențiați toate cazurile tratate.

-- Varianta 1:

CREATE OR REPLACE TYPE clienti_ex8 AS OBJECT (
    nume VARCHAR2(255),
    prenume VARCHAR2(255),
    nr_zile NUMBER
);
CREATE OR REPLACE TYPE clienti_tabel_ex8 AS TABLE OF clienti_ex8;

-- Functia:

CREATE OR REPLACE FUNCTION exercitiu_8 (id IN sala.id_sala%type) 
return clienti_tabel_ex8
as
    tabel_cu_clienti clienti_tabel_ex8 := clienti_tabel_ex8();

    nr_sali NUMBER;
    exceptie1 EXCEPTION;
    
    nr_clienti NUMBER;
    exceptie2 EXCEPTION;
    i NUMBER:=1;
    
    cursor c1 is 
        SELECT c.nume, c.prenume, TRUNC(a.data_valabilitate - SYSDATE) AS nr_zile
        FROM client c
        JOIN abonament a ON c.id_abonament = a.id_abonament
        JOIN sala s ON s.id_sala = a.id_sala
        WHERE s.id_sala = id;
    -- pentru a trata cazul in care exista 2 clienti cu acelasi nume si prenume in aceeasi sala
    -- voi crea o noua variabila cu numele: nr_clienti_distincti
    -- aceasta numara cu un count distinct, numarul de clienti unic, care au combinatia nume + prenume
    -- daca sunt 2 cu acelasi nume, count distinct returneaza 1,
    -- dar in tabel voi avea 2
    
    -- deci, voi compara valoarea din nr_clienti_distincti cu nr de clineti din tabel, daca e egal nu am prob, daca nu, exceptie;
    
    nr_clienti_distincti NUMBER;
    exceptie3 EXCEPTION;
BEGIN
    SELECT COUNT(id_sala)
    INTO nr_sali
    FROM sala
    WHERE id_sala = id;
    
    IF nr_sali = 0 THEN
        RAISE exceptie1;
    END IF;

    SELECT COUNT(c.id_client)
    INTO nr_clienti
    FROM client c
    JOIN abonament a ON c.id_abonament = a.id_abonament
    JOIN sala s ON s.id_sala = a.id_sala
    WHERE s.id_sala = id;
    
    select count(distinct(c.nume || c.prenume))
    into nr_clienti_distincti
    FROM client c
    JOIN abonament a ON c.id_abonament = a.id_abonament
    JOIN sala s ON s.id_sala = a.id_sala
    WHERE s.id_sala = id;
    
    IF nr_clienti = 0 THEN
        RAISE exceptie2;
    END IF;
    
    for client in c1 loop
        tabel_cu_clienti.EXTEND;
        tabel_cu_clienti(i):= clienti_ex8(client.nume, client.prenume, client.nr_zile);
        i:= i+1;
    end loop;
    if nr_clienti_distincti = tabel_cu_clienti.count() then
        return tabel_cu_clienti;
    else
        raise exceptie3;
    end if;

EXCEPTION
    WHEN exceptie1 THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista sala data');
        return clienti_tabel_ex8();
    WHEN exceptie2 THEN
        DBMS_OUTPUT.PUT_LINE('Sala data nu are clienti');
        return clienti_tabel_ex8();
    when exceptie3 then
        DBMS_OUTPUT.PUT_LINE('In sala exista cel putin 2 clienti cu acelasi nume');
        return clienti_tabel_ex8();
END exercitiu_8;

-- Bloc Apel
declare
    id sala.id_sala%type:='&id';
    tabel_cu_clienti clienti_tabel_ex8:=clienti_tabel_ex8();
begin
    tabel_cu_clienti:=exercitiu_8(id);
    for i in 1..tabel_cu_clienti.count() loop
        if tabel_cu_clienti(i).nr_zile >= 0 then
            DBMS_OUTPUT.PUT_LINE('Abonamentul clientului ' || tabel_cu_clienti(i).nume || ' ' || tabel_cu_clienti(i).prenume || ' este valid');
        else
            DBMS_OUTPUT.PUT_LINE('Abonamentul clientului ' || tabel_cu_clienti(i).nume || ' ' || tabel_cu_clienti(i).prenume || ' nu este valid');
        end if;
    end loop;
end;

-- INSERT UL + DELETE PENTRU TOO_MANY_ROWS:
INSERT INTO Client (id_client, id_abonament, nume, prenume, email, nr_telefon) 
VALUES (11, 3, 'Pop', 'Ana', 'pop.ana@gmail.com', '0743123456');

delete from Client
where id_client = 11;

-- Varianta 2:
CREATE OR REPLACE FUNCTION exercitiu_8_v2 (id IN sala.id_sala%type) 
RETURN clienti_tabel_ex8
AS
    tabel_cu_clienti clienti_tabel_ex8 := clienti_tabel_ex8();
    nr_sali NUMBER;
    nr_clienti NUMBER;
    exceptie2 EXCEPTION;
    i NUMBER := 1;

    cursor c1 is 
        SELECT c.nume, c.prenume, TRUNC(a.data_valabilitate - SYSDATE) AS nr_zile
        FROM client c
        JOIN abonament a ON c.id_abonament = a.id_abonament
        JOIN sala s ON s.id_sala = a.id_sala
        WHERE s.id_sala = id;

    v_id_sala NUMBER;
    v_nume client.nume%type; 
BEGIN
    -- verific daca exista sala
    SELECT id_sala
    INTO v_id_sala
    FROM sala
    WHERE id_sala = id;

    -- calculez cu un count nr de clienti care apartin salii
    SELECT COUNT(c.id_client)
    INTO nr_clienti
    FROM client c
    JOIN abonament a ON c.id_abonament = a.id_abonament
    JOIN sala s ON s.id_sala = a.id_sala
    WHERE s.id_sala = id;

    IF nr_clienti = 0 THEN
        RAISE exceptie2;
    END IF;

    -- parcurg cursorul pentru a trata exceptia + a adauga clientii in tabel
    FOR client IN c1 LOOP
        -- verific daca exista clienti cu ac nume si prenume, ma folosesc de var v_nume pentru a exemplifica TOO_MANY_ROWS
        -- NO_DATA_FOUND nu e posibil in acest subloc deoarece deja a fost tratata mai sus.
        BEGIN
            SELECT c.nume
            INTO v_nume
            FROM client c
            WHERE c.nume = client.nume AND c.prenume = client.prenume;
        EXCEPTION
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('In sala exista cel putin 2 clienti cu acelasi nume si prenume');
                RETURN clienti_tabel_ex8();
        END;

        tabel_cu_clienti.EXTEND;
        tabel_cu_clienti(i) := clienti_ex8(client.nume, client.prenume, client.nr_zile);
        i := i + 1;
    END LOOP;

    RETURN tabel_cu_clienti;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista sala data');
        RETURN clienti_tabel_ex8();
    WHEN exceptie2 THEN
        DBMS_OUTPUT.PUT_LINE('Sala data nu are clienti');
        RETURN clienti_tabel_ex8();
END exercitiu_8_v2;

-- BLOC APEL:
declare
    id sala.id_sala%type:='&id';
    tabel_cu_clienti clienti_tabel_ex8:=clienti_tabel_ex8();
begin
    tabel_cu_clienti:=exercitiu_8_v2(id);
    for i in 1..tabel_cu_clienti.count() loop
        if tabel_cu_clienti(i).nr_zile >= 0 then
            DBMS_OUTPUT.PUT_LINE('Abonamentul clientului ' || tabel_cu_clienti(i).nume || ' ' || tabel_cu_clienti(i).prenume || ' este valid');
        else
            DBMS_OUTPUT.PUT_LINE('Abonamentul clientului ' || tabel_cu_clienti(i).nume || ' ' || tabel_cu_clienti(i).prenume || ' nu este valid');
        end if;
    end loop;
end;

-- 9.Formulați în limbaj natural o problemă pe care să o rezolvați folosind un subprogram stocat independent 
-- de tip procedură care să aibă minim 2 parametri și să utilizeze într-o singură comandă SQL 5 dintre tabelele create. 
-- Definiți minim 2 excepții proprii, altele decât cele predefinite la nivel de sistem. Apelați subprogramul 
-- astfel încât să evidențiați toate cazurile definite și tratate.

-- Procedura:

create or replace procedure exercitiul_9(id_s sala.id_sala%type, v_pret NUMBER)
AS
    exceptie1 EXCEPTION; -- verificam daca exista sau nu sala data
    nrSali NUMBER;
    
    exceptie2 EXCEPTION; -- verificam daca exista sau nu produse in sala data
    nrProduse NUMBER;
    
    type t_client is record(
        c_nume client.nume%type,
        c_prenume client.prenume%type,
        p_nume produse.nume%type,
        p_pret produse.pret%type
    );
    
    type tabel_clienti is table of t_client;
    tab_clienti tabel_clienti;
    exceptie3 EXCEPTION;
begin
    select count(id_sala)
    into nrSali
    from sala 
    where id_sala = id_s;
    
    if nrSali = 0 then
        raise exceptie1;
    end if;
    
    select count(p.id_produse)
    into nrProduse
    from produse p
    join detine d on d.id_produse = p.id_produse
    join sala s on s.id_sala = d.id_sala
    where s.id_sala = id_s;
    
    if nrProduse = 0 then
        raise exceptie2;
    end if; 
    
    select c.nume, c.prenume, p.nume, p.pret
    bulk collect into tab_clienti
    from client c
    join achizitie a on c.id_client = a.id_client
    join detalii_achizitie da on da.id_achizitie = a.id_achizitie
    join produse p on p.id_produse = da.id_produse
    join detine d on d.id_produse = p.id_produse
    join sala s on d.id_sala = s.id_sala
    where s.id_sala = id_s and p.pret > v_pret;
    
    
    if tab_clienti.count() = 0 then
        raise exceptie3;
    end if;
    
    dbms_output.put_line('Clientii care au cumparat produse din sala: ' || id_s || ' cu un pret mai mare de ' || v_pret || ' sunt:');
    
    for i in 1..tab_clienti.count loop
        dbms_output.put_line(tab_clienti(i).c_nume || ' ' || tab_clienti(i).c_prenume || ' ' || tab_clienti(i).p_nume || ' ' || tab_clienti(i).p_pret);
    end loop;
    
exception
    when exceptie1 then
        dbms_output.put_line('Nu exista sala data');
    
    when exceptie2 then
        dbms_output.put_line('Nu exista produse in sala data');
    when exceptie3 then
        dbms_output.put_line('Nu exista clienti');
end exercitiul_9;

-- Blocul apel:
declare
    id_s sala.id_sala%type:='&id_sala';
    v_pret NUMBER:='&pret';
begin
    exercitiul_9(id_s, v_pret);
end;

-- 10.Definiți un trigger de tip LMD la nivel de comandă. Declanșați trigger-ul.
CREATE OR REPLACE TRIGGER trigger_comanda
BEFORE INSERT OR DELETE OR UPDATE on facturi
BEGIN
    IF (TO_CHAR(SYSDATE, 'D') NOT IN (2, 3, 4, 5, 6)
        OR (TO_CHAR(SYSDATE, 'HH24') NOT BETWEEN 9 AND 17)) THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20001, 'Insert-uri se fac de luni pana vineri, de la 9:00 la 17:00');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002, 'Stergeri se fac de luni pana vineri, de la 9:00 la 17:00');
        ELSE 
            RAISE_APPLICATION_ERROR(-20003, 'Update-uri se fac de luni pana vineri, de la 9:00 la 17:00');
        END IF;
    END IF;
END;

--11.Definiți un trigger de tip LMD la nivel de linie. Declanșați trigger-ul.

CREATE OR REPLACE TRIGGER trigger_facturi_utilitati
BEFORE INSERT ON Facturi_Utilitati
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- prima data verific daca id_ul este unic in cadrul tabelului facturi_produse
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Produse
    WHERE id_facturi = :NEW.id_facturi;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Factura cu acest id_facturi deja exista in Facturi_Produse.');
    END IF;
    
    -- verific daca exista deja un id_facturi in Facturi_Utilitati
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Utilitati
    WHERE id_facturi = :NEW.id_facturi;

    -- daca exista cel putin o inregistrare, exceptie
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Factura cu acest id_facturi deja exista in Facturi_Utilitati.');
    END IF;

    -- la fel si pentru tabelul Facturi_Abonament
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Abonament
    WHERE id_facturi = :NEW.id_facturi;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Factura cu acest id_facturi deja exista in Facturi_Abonament.');
    END IF;
END;

CREATE OR REPLACE TRIGGER trigger_facturi_produse
BEFORE INSERT ON Facturi_Produse
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- prima data verific daca id_ul este unic in cadrul tabelului facturi_produse
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Produse
    WHERE id_facturi = :NEW.id_facturi;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Factura cu acest id_facturi deja exista in Facturi_Produse.');
    END IF;
    
    -- verific daca exista deja un id_facturi in Facturi_Utilitati
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Utilitati
    WHERE id_facturi = :NEW.id_facturi;

    -- daca exista cel putin o inregistrare, exceptie
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Factura cu acest id_facturi deja exista in Facturi_Utilitati.');
    END IF;

    -- la fel si pentru tabelul Facturi_Abonament
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Abonament
    WHERE id_facturi = :NEW.id_facturi;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Factura cu acest id_facturi deja exista in Facturi_Abonament.');
    END IF;
END;


CREATE OR REPLACE TRIGGER trigger_facturi_abonamente
BEFORE INSERT ON Facturi_Abonament
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    -- prima data verific daca id_ul este unic in cadrul tabelului facturi_produse
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Produse
    WHERE id_facturi = :NEW.id_facturi;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Factura cu acest id_facturi deja exista in Facturi_Produse.');
    END IF;
    
    -- verific daca exista deja un id_facturi in Facturi_Utilitati
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Utilitati
    WHERE id_facturi = :NEW.id_facturi;

    -- daca exista cel putin o inregistrare, exceptie
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Factura cu acest id_facturi deja exista in Facturi_Utilitati.');
    END IF;

    -- la fel si pentru tabelul Facturi_Abonament
    SELECT COUNT(*) 
    INTO v_count
    FROM Facturi_Abonament
    WHERE id_facturi = :NEW.id_facturi;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Factura cu acest id_facturi deja exista in Facturi_Abonament.');
    END IF;
END;

--12. Definiți un trigger de tip LDD. Declanșați trigger-ul.     

CREATE TABLE istoric_tranzactii
(baza_de_date VARCHAR2(50),
user_logat VARCHAR2(30),
eveniment VARCHAR2(20),
tip_obiect_referit VARCHAR2(30),
nume_obiect_referit VARCHAR2(30),
data TIMESTAMP(3));


create or replace trigger istoric_tranzactii
after create or drop or alter on schema
begin
insert into istoric_tranzactii values (sys.database_name, 
                                       sys.login_user, 
                                       sys.sysevent, 
                                       sys.dictionary_obj_type, 
                                       sys.dictionary_obj_name, 
                                       systimestamp(3));
end;
