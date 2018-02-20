INSERT INTO studenti (`Cognome`, `Nome`, `DataNascita`, `CodiceClasse`) VALUES
("Tornesello", "Alessandro", "1999-07-19", "5"),
("D'Aquino", "Marco", "1999-05-26", "5");

INSERT INTO studenti (`Cognome`, `Nome`, `DataNascita`, `CodiceClasse`) VALUES
("Russo", "Mario", "1999-08-03", "5"),
("Muho", "Manuel", "1999-05-12", "5"),
("Loris", "Parata", "1999-09-21", "5"),
("Coronese", "Samuele", "1999-02-05", "5"),
("Lisi", "Simone", "1999-11-17", "5"),
("Branca", "Lorenzo", "1999-06-03", "5"),
("Leo", "Alberto", "1999-02-15", "5"),
("Antonazzo", "Sebastiano Rocco", "1999-10-28", "5");

INSERT INTO studenti (`Cognome`, `Nome`, `DataNascita`, `CodiceClasse`) VALUES
("Milano", "Gabriele", "1999-11-05", "6"),
("Longo", "Lorenzo", "1999-08-09", "21"),
("Spiri", "Nicolas", "1999-05-03", "12"),
("Giulia", "Fortunato", "1999-04-07", "4"),
("Rocca", "Francesco", "1999-08-03", "7"),
("Leopizzi", "Matteo", "1999-12-08", "9"),
("Pischietto", "Antonio", "1999-10-05", "31"),
("Scorrano", "Luigi", "1999-06-09", "25"),
("Mazzeo", "Antonio", "1999-04-05", "17"),
("Primiceri", "Edoardo", "1999-05-09", "19");


INSERT INTO professori (`CodiceProfessore`, `Cognome`, `Nome`, `ClasseConcorso`) VALUES 
(1, "Palombo", "Massimo", "A042"),
(2, "Orlando", "Maria Rosaria", "A050"),
(3, "Petrachi", "Maria Rosaria", "A042"),
(4, "Gargasole", "Giuseppina", "A047"),
(5, "Barone", "Antonio", "A042"),
(6, "Gervasi", "Antonio", "A042"),
(7, "Candido", "Abramo", "A042"),
(8, "Lionetto", "Romina", "A042"),
(9, "Meoli", "Serafino", "A042"),
(10, "Mussardo", "Maria Rosaria", "A346");

/*
ES 1
Visualizzare le valutazioni riguardanti le materie umanistiche
*/

SELECT * 
FROM `valutazioni` 
WHERE `Materia` IN ("ITALIANO", "STORIA", "INGLESE")

/*
ES 2
Visualizzare le valutazioni sufficienti nelle materie non umanistiche
*/

SELECT * 
FROM `valutazioni` 
WHERE "Voto" >= 6
    AND "Materia" NOT IN ("ITALIANO", "STORIA", "INGLESE")

/*
ES 3
Visualizzare le materie le cui valutazioni sono comprese tra 8 e 10
*/

SELECT * 
FROM `valutazioni` 
WHERE `Voto` BETWEEN 8 AND 10

/*
ES 4
Visualizzare le valutazioni di gennaio 2018
*/

SELECT * 
FROM `valutazioni` 
WHERE `DataVal` BETWEEN '2018-01-01' AND '2018-01-31'

/*
ES 5
Visualizzare le valutazioni delle materie di laboratorio
*/

-- SELECT * 
-- FROM `valutazioni` 
-- WHERE `Materia` LIKE 

/*
ES 6
Visualizzare gli studenti che inizionao con 'B'
*/

SELECT * 
FROM `studenti` 
WHERE `Cognome` LIKE 'B%'