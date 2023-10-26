
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

-- Assignment inserts
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (1, 3, 'Monday');
INSERT INTO assignment (employee_id, enclosure_id, day) VALUES (2, 1, 'Monday');

-- Animal inserts
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tony', 'Tiger', 59, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tommy', 'Turtle', 101, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Polly', 'Parrot', 25, 3);






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