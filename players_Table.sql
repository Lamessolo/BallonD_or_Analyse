use goldplayersdatabase;
/*
DROP TABLE IF EXISTS players90s;
CREATE TABLE players90s (
id INT PRIMARY KEY,
Rang INT NOT NULL,
Nom VARCHAR(50),
Club VARCHAR(50),
Selection VARCHAR(50),
Poste VARCHAR(50),
Points VARCHAR(50),
Confederation VARCHAR(50),
Type VARCHAR (50),
Pourcentagevote VARCHAR(50),
Annee  VARCHAR(50)
);
*/

SELECT * FROM players90s WHERE Rang = 1;
SELECT  Poste, SUM(Points) FROM Players90s GROUP BY Poste;
SELECT Selection,  COUNT(Selection) FROM players90s GROUP BY Selection ;

/* nous calculons la somme totale des points  pour chaque joueur et le MAX de point atteint par un joueur  */
SELECT * FROM PLAYERS90s;

SELECT  Nom, Selection, Points, 
SUM(Points) OVER (PARTITION BY Nom)  AS Total_pts,
MAX(Points) OVER (PARTITION BY Rang)  AS Max_pts
FROM Players90s;

SELECT Nom,Selection, SUM(Points) AS Sum_pts, COUNT(Nom),Club FROM PLAYERS
GROUP BY Nom,Selection HAVING Count(*) >= 1 ORDER BY Sum_pts DESC;

/* Le club qui a le plus de representant pour la table 2016_22 */
SELECT Club, COUNT(*)  FROM players GROUP BY Club;

/* Le club qui a le plus de representant pour la table 90_99 */
SELECT Club, COUNT(*)  FROM players90s GROUP BY Club;

/* Quelle joueur à marquer le plus de points depuis 2016 ? */
SELECT Nom,Selection,Poste, SUM(Points) AS total_pts FROM Players90s GROUP BY Nom ORDER BY  total_pts DESC;

/* Le club le plus representé */
SELECT  Club , COUNT(*) AS Point_obtenu FROM players90s GROUP BY Club  HAVING COUNT(*) >1 ORDER BY Point_obtenu DESC ;

