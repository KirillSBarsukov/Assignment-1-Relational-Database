# Barsukov Kirill / 200395896
# Teacher Matthew Wilson
# Description: 1980's Movies Database

USE gc200395896;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS movies;

# Create a first table
CREATE TABLE studios (
		name VARCHAR(16),
		city VARCHAR(11), 
		state VARCHAR(2),
		year INT(4)
);

# Insert values
INSERT INTO studios VALUES("Paramount", "Hollywood", "CA", 1912);
INSERT INTO studios VALUES("Warner Bros.", "Burbank", "CA", 1918);
INSERT INTO studios VALUES("Columbia", "Los Angeles", "CA", 1919);
INSERT INTO studios VALUES("Disney", "Burbank", "CA", 1929);
INSERT INTO studios VALUES("Universal", "New York", "NY", 1912);
INSERT INTO studios VALUES("20th Century Fox", "Los Angeles", "CA", 1935);

# Create a second table
CREATE TABLE movies (
		title VARCHAR(36),
        year INT(4),
        five_star_rating INT(5),
        length INT(3),
		studio VARCHAR(16)
);
# Movies from the teacher's list
INSERT INTO movies VALUES("Star Wars: The Empire Strikes back", 1980, 5, 124, "20th Century Fox");
INSERT INTO movies VALUES("Airplane", 1980, 1, 88, "Paramount");
INSERT INTO movies VALUES("The Shining", 1980, 3, 146, "Warner Bros.");
INSERT INTO movies VALUES("The Terminator", 1984, 3, 107, "20th Century Fox");
INSERT INTO movies VALUES("Honey, I shrunk the kids", 1989, 5, 93, "Disney");
INSERT INTO movies VALUES("Die Hard", 1988, 4, 132, "20th Century Fox");
INSERT INTO movies VALUES("Superman II", 1980, 2, 127, "Columbia");
INSERT INTO movies VALUES("Back to the future", 1985, 5, 116, "Universal");
INSERT INTO movies VALUES("Raiders of the Lost Ark", 1981, 4, 115, "Paramount");
INSERT INTO movies VALUES("Blade Runner", 1982, 4, 117, "Warner Bros.");
INSERT INTO movies VALUES("Ghostbusters", 1984, 2, 105, "Columbia");

# My 15 favorite movies
INSERT INTO movies VALUES("Coming to America", 1988, 3, 116, "Paramount");
INSERT INTO movies VALUES("Scarface", 1983, 4, 170, "Universal");
INSERT INTO movies VALUES("Indiana Jones and the Last Crusade", 1989, 4, 127, "Paramount");
INSERT INTO movies VALUES("Indiana Jones and the Temple of Doom", 1984, 3, 118, "Paramount");
INSERT INTO movies VALUES("The Karate Kid", 1984, 3, 126, "Columbia");
INSERT INTO movies VALUES("Full Metal Jacket", 1987, 4, 116, "Warner Bros.");
INSERT INTO movies VALUES("Predator", 1987, 4, 107, "20th Century Fox");
INSERT INTO movies VALUES("E.T. The Extra-Terrestrial", 1982, 3, 115, "Universal");
INSERT INTO movies VALUES("Aliens", 1986, 4, 137, "20th Century Fox");
INSERT INTO movies VALUES("Batman", 1989, 3, 126, "Warner Bros.");
INSERT INTO movies VALUES("The Thing", 1982, 4, 109, "Universal");
INSERT INTO movies VALUES("Airplane!", 1988, 3, 88, "Paramount");
INSERT INTO movies VALUES("Sixteen Candles", 1984, 3, 93, "Universal");
INSERT INTO movies VALUES("Twins", 1988, 3, 107, "Universal");
INSERT INTO movies VALUES("Vacation", 1983, 3, 98, "Warner Bros.");

#SELECT * FROM movies;
#6
# Show all movies made in 1980 or 1981
SELECT title, year FROM movies
WHERE year >=1980 AND year <= 1981; 

# Show the longest 5 movies in the DB
SELECT title, length FROM movies
ORDER BY length DESC
LIMIT 5; 

# Show all movies ordered by year
SELECT title, year FROM movies
ORDER BY year DESC;

# Show all movies by Paramount or Universal newer than 1985
SELECT title, studio FROM movies
WHERE year >1985;

# Show all movies that include "the" in the title
SELECT title FROM movies
WHERE title LIKE '%the%';

# Show all movies longer than 2 hours with 3-star rating or better
SELECT title, length, five_star_rating FROM movies
WHERE length  >= 120  AND five_star_rating >= 3;

# Show how many movies each studios have and the average movie rating
SELECT  studio AS 'Studio', COUNT(title) AS 'Number of movies', ROUND(AVG(five_star_rating),1) AS 'Average rating' FROM movies
GROUP BY studio;

# Show all movies  thar where made in an odd number year (1981,1983 etc)
SELECT title, year FROM movies
WHERE (year % 2) = 1;

# 7
# Change studio and movies so “Warner Bros.” becomes “Warner Brothers” 
UPDATE  movies
SET studio = "Warener Brothers"
WHERE studio = "Warner Bros.";

# Add the text “Schwarzenegger “ before the title of any Terminator movies
UPDATE  movies
SET title = "Schwarzenegger The Terminator"
WHERE title LIKE "%Terminator";

# All 2 star movies become 3 star movies
UPDATE  movies
SET five_star_rating = 3
WHERE five_star_rating = 2;

# Add 1 minute to all movie lengths
UPDATE  movies
SET length = length + 1;
SELECT * FROM movies;

#8 Removing
# The Disney studio and any Disney movie
DELETE FROM movies
WHERE studio  = "Disney";

# Any movies that contain the letter “K”
DELETE FROM movies
WHERE title LIKE '%k%';

# Any movie with a 1 star rating
DELETE FROM movies
WHERE five_star_rating = 1;

#9 Additional functionality
# Show all movies  thar where made in an even number year (1982,1984 etc)
SELECT title, year FROM movies
WHERE (year % 2) = 0
ORDER BY year;

# Any movie with a 1 star rating and a 5 star rating
DELETE FROM movies
WHERE five_star_rating = 1
AND five_star_rating = 5;
 























































































































