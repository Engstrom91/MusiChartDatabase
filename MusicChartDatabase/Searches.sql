#Steg 6, kör önskad sökning#
SELECT currentPlacement, songName FROM toplist;
SELECT currentPlacement, songName FROM toplist WHERE currentPlacement <= 20;

SELECT artistName, songsOnList
FROM artists
WHERE songsOnList = (SELECT MAX(songsOnList) FROM artists);

SELECT songName, weeksOnList
FROM songs
WHERE weeksOnList = (SELECT MAX(weeksOnList) FROM songs);