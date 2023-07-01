use mysql_learners;
/*
DROP TABLE IF EXISTS players;
CREATE TABLE players (
id INT PRIMARY KEY,
Rang INT NOT NULL,
Nom VARCHAR(50),
Club VARCHAR(50),
Selection VARCHAR(50),
Poste VARCHAR(50),
Points VARCHAR(50),
Pourcentagevote VARCHAR(50),
Annee  VARCHAR(50)
);
*/
SELECT * FROM players WHERE Rang = 1;
SELECT  Poste, SUM(Points) FROM Players GROUP BY Poste;
SELECT Selection,  COUNT(Selection) FROM players GROUP BY Selection ;

/* nous calculons la somme totale des points  pour chaque joueur et le MAX de point atteint par un joueur  */
SELECT * FROM PLAYERS;

SELECT  Nom, Selection, Points, 
SUM(Points) OVER (PARTITION BY Nom)  AS Total_pts,
MAX(Points) OVER (PARTITION BY Rang)  AS Max_pts
FROM Players;

SELECT Nom,Selection, SUM(Points) AS Sum_pts,Club FROM PLAYERS
GROUP BY Nom,Selection HAVING Count(*) >= 1 ORDER BY Sum_pts DESC;
