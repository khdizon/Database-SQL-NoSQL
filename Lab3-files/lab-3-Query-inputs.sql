# Lab 3 Query Constructions
# USER: Ken Dizon | March 14th 2023
# Dr. Bush | MSDS631
# Week 3: Inner/Outer Joins, Null Values, Aggregates and Indexing

USE sql_lab3;

-- Q1: Find the first reservation (i.e., lowest rdate) for each sailor with sid less than 5.
SELECT sid, MIN(rdate) AS first_reservation
FROM Reserve
WHERE sid < 5
GROUP BY sid;


-- Q2: Find the number of reservations by 18-year-old sailors.
SELECT COUNT(*) AS num_reservations
FROM Reserve
WHERE sid IN (SELECT sid FROM Sailors WHERE age = 18);


-- Q3: Find all attributes/fields of boats that are "pumpkin" color and have a ratingNeeded that is the maximum of all ratingNeeded for all boats.
SELECT *
FROM Boats
WHERE bcolor = 'pumpkin' AND ratingNeeded = (SELECT MAX(ratingNeeded) FROM Boats);

-- Q4: Find the name, rating, ratingNeeded, and bid of all reservations by 18-year-old sailors that have reserved a boat for which there rating is less than the rating needed. Sort the results by sid.
SELECT s.name, s.rating, b.ratingNeeded, r.bid
FROM Sailors s
JOIN Reserve r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE s.age = 18 AND s.rating < b.ratingNeeded
ORDER BY s.sid;

-- Q5: Find average rating for each age group of sailors who are 31...39 years old, but only include groups that have 30 or more sailors of that age.
SELECT age, AVG(rating) AS avg_rating
FROM Sailors
WHERE age BETWEEN 31 AND 39
GROUP BY age
HAVING COUNT(*) >= 30;