#Steg 1, Skapa vår databas och använd USE#
CREATE DATABASE songsdb;
USE songsdb;

#Steg 2, Skapa tables för artister och låtar#
CREATE TABLE artists(artistId INT PRIMARY KEY AUTO_INCREMENT, artistName VARCHAR(50), songsOnList INT);
CREATE TABLE songs(songId INT PRIMARY KEY AUTO_INCREMENT, artistId INT, songName VARCHAR(50), genre VARCHAR(50), highestPlacement INT, currentPlacement INT, weeksOnList INT);

#Steg 4, Skapa en Foreign Key för att koppla ihop songs och artists#
ALTER TABLE songs ADD FOREIGN KEY (artistId) REFERENCES artists (artistId);

#Steg 5, Skapa ett nytt table från datan i songs och artists#
CREATE TABLE toplist AS
SELECT s.songName, s.genre, a.artistName, a.songsOnList, s.highestPlacement, s.currentPlacement, s.weeksOnList
FROM songs s
LEFT JOIN artists a ON a.artistId = s.artistId;