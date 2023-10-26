
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosures;


CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employee_number INT
);

CREATE TABLE assignment (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,

    enclosure_id INT REFERENCES enclosures(id)
);

-- Enclosure inserts
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Big Cats', 3, false);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Shell People', 5, true);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Bird People', 15, false);

-- Staff inserts
INSERT INTO staff (name, employee_number) VALUES ('Billie the BirdKeeper', 1);
INSERT INTO staff (name, employee_number) VALUES ('Albert the Big Cat Guy', 2);
INSERT INTO staff (name, employee_number) VALUES ('Charlie the Turtle Man', 3);
INSERT INTO staff (name, employee_number) VALUES ('Charlie the Turtle Woman', 4);
INSERT INTO staff (name, employee_number) VALUES ('Charles the Old Turtle Man', 5);

-- Assignment inserts
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (1, 3, 'Monday');
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (2, 1, 'Monday');
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (3, 2, 'Monday');
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (4, 2, 'Tuesday');
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (5, 2, 'Wednesday');

-- Animal inserts
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 59, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tibo', 'Tiger', 40, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tina', 'Liger', 30, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tommy', 'Turtle', 101, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Polly', 'Parrot', 25, 3);

-- Q1 
-- SELECT * 
-- FROM animals 
-- INNER JOIN enclosures
-- ON animals.enclosure_id = enclosures.id
-- WHERE animals.enclosure_id = 1;

-- Q2
-- SELECT staff.name 
-- FROM enclosures 
-- INNER JOIN assignment
-- ON enclosures.id = assignment.enclosure_id
-- INNER JOIN staff
-- ON employee_id = staff.id
-- WHERE enclosures.name = 'Big Cats';

-- extension 
-- SELECT *
-- FROM enclosures 
-- INNER JOIN assignment
-- ON enclosures.id = assignment.enclosure_id
-- INNER JOIN staff
-- ON employee_id = staff.id
-- WHERE enclosures.closed_for_maintenance = true AND day = 'Tuesday';

-- to find the enclosure of the oldest animals
-- SELECT *
-- FROM animals
-- ORDER BY age DESC;

-- SELECT enclosures.name
-- FROM enclosures
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id
-- WHERE age = '101'



-- number of diff. animal types a keeper has been assigned to work with.
-- SELECT COUNT(DISTINCT type)
-- FROM enclosures
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id
-- INNER JOIN assignment
-- ON assignment.enclosure_id = enclosures.id
-- INNER JOIN staff
-- ON employee_id = staff.id
-- WHERE staff.name = 'Albert the Big Cat Guy';


-- number of diff keepers assigned to an enclosure
-- SELECT COUNT(DISTINCT staff.name)
-- FROM enclosures
-- INNER JOIN animals
-- ON enclosures.id = animals.enclosure_id
-- INNER JOIN assignment
-- ON assignment.enclosure_id = enclosures.id
-- INNER JOIN staff
-- ON employee_id = staff.id
-- WHERE enclosures.name = 'Shell People';


SELECT enclosures.name, animals.name
FROM enclosures
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
INNER JOIN assignment
ON assignment.enclosure_id = enclosures.id
INNER JOIN staff
ON employee_id = staff.id
WHERE enclosures.name = 'Big Cats' AND animals.name != 'Tony'


-- The names of staff working in enclosures which are closed for maintenance.





-- animal
-- {
-- 	"id": 1,
-- 	"name": "Tony",
-- 	"type": "Tiger",
-- 	"age": 59,
-- 	"enclosure_id": 1
-- }

-- // enclosure

-- {
-- 	"id": 1,
-- 	"name": "big cat field",
-- 	"capacity": 20,
-- 	"closedForMaintenance": false
-- }

-- // staff

-- {
-- 	"id": 1,
-- 	"name": "Captain Rik",
-- 	"employeeNumber": 12345,
-- }

-- // assignment

-- {
-- 	"id": 1,
-- 	"employeeId": 1,
-- 	"enclosureId": 1,
-- 	"day": "Tuesday"