DROP TABLE Centre CASCADE;
DROP TABLE Car CASCADE;
DROP TABLE School CASCADE;
DROP TABLE AdminStaff CASCADE;
DROP TABLE Instructor CASCADE;
DROP TABLE Client CASCADE;
DROP TABLE Lesson CASCADE;
DROP TABLE Test CASCADE;

CREATE TABLE Centre (
CentreID CHAR (4) PRIMARY KEY NOT NULL,
Name VARCHAR (225) NOT NULL,
Address VARCHAR (225) NOT NULL, 
PhoneNo VARCHAR (20) NOT NULL
);

CREATE TABLE Car (
CarID CHAR(3) PRIMARY KEY NOT NULL,
RegNo VARCHAR (8) NOT NULL,
Model CHAR (225) NOT NULL,
UNIQUE (RegNo)
);

CREATE TABLE School (
SchoolID CHAR(4) PRIMARY KEY NOT NULL,
Address VARCHAR (225) NOT NULL
);

CREATE TABLE AdminStaff (
EmpID CHAR(4) PRIMARY KEY NOT NULL,
Forename CHAR (225) NOT NULL,
Surname CHAR (225) NOT NULL,
Gender CHAR (1) CHECK (Gender IN ('M', 'F', 'O')) NOT NULL,
PhoneNo VARCHAR (20) NOT NULL,
Address VARCHAR (225) NOT NULL,
Role CHAR (225) NOT NULL,
SchoolID CHAR(4) NOT NULL,
FOREIGN KEY (SchoolID) REFERENCES School (SchoolID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Instructor (
EmpID CHAR(4) PRIMARY KEY NOT NULL,
Forename CHAR (225) NOT NULL,
Surname CHAR (225) NOT NULL,
Gender CHAR (1) CHECK (Gender IN ('M', 'F', 'O')) NOT NULL,
PhoneNo VARCHAR (20) NOT NULL,
Address VARCHAR (225) NOT NULL,
LicenceNo VARCHAR (18) NOT NULL,
SchoolID CHAR(4) NOT NULL,
CarID CHAR(3) NOT NULL,
UNIQUE (LicenceNo),
FOREIGN KEY (SchoolID) REFERENCES School (SchoolID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (CarID) REFERENCES Car (CarID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Client (
ClientID CHAR(4) PRIMARY KEY NOT NULL,
Forename CHAR (225) NOT NULL,
Surname CHAR (225) NOT NULL,
Gender CHAR (1) CHECK (Gender IN ('M', 'F', 'O')) NOT NULL,
DoB DATE NOT NULL,
PhoneNo VARCHAR (20) NOT NULL,
Address VARCHAR (225) NOT NULL,
ProvLicenceNo CHAR (18) NOT NULL,
UNIQUE (ProvLicenceNo)
);

CREATE TABLE Lesson (
OnDate DATE NOT NULL,
OnTime TIME NOT NULL,
ClientID CHAR(1) NOT NULL,
EmpID CHAR(4) NOT NULL,
PRIMARY KEY (OnDate, OnTime, ClientID),
FOREIGN KEY (ClientID) REFERENCES Client (ClientID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (EmpID) REFERENCES Instructor (EmpID) ON UPDATE CASCADE ON DELETE CASCADE,
UNIQUE (OnDate, OnTime, EmpID)
);

CREATE TABLE Test (
OnDate DATE NOT NULL,
OnTime TIME NOT NULL,
ClientID CHAR(1) NOT NULL,
EmpID CHAR(4) NOT NULL,
CentreID CHAR(4) NOT NULL,
Status CHAR (10) CHECK (Status IN ('Not Taken', 'Passed', 'Failed')) NOT NULL,
Reason VARCHAR (225),
UNIQUE (OnDate, OnTime, EmpID),
PRIMARY KEY (OnDate, OnTime, ClientID),
FOREIGN KEY (ClientID) REFERENCES Client (ClientID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (EmpID) REFERENCES Instructor (EmpID) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (CentreID) REFERENCES Centre (CentreID) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO Centre 
VALUES ('1', 'Canterbury', '12 Meryl Street', '+44 1227-968-5287'), 
('2', 'Whitstable', '5 The Strand, Whitstable', '01227457012'), 
('3', 'Faversham', '1 High Street', '01795 865129');

INSERT INTO Car
VALUES ('124', 'BD51 SMR', 'VW Polo'),
('653', 'WS62 QWE', 'Ford Focus'),
('912', 'FD52 TGF', 'VW Polo'),
('167', 'FD52 YTR', 'VW Polo');

INSERT INTO School
VALUES ('1', '12 Whitechapel, Canterbury'),
('2', '9 Middle Wall, Whitstable');

INSERT INTO AdminStaff
VALUES ('1006', 'Fred', 'Grimes', 'M', '012275435665', '27 Cherry Street', 'assistant', '2'), 
('1009', 'Jill', 'Joffries', 'F', '+44776618645', '27 Cherry Street', 'manager', '1'),
('1019', 'Justine', 'Joffries', 'F', '(01227) 812035', '19 Creosote Road', 'assistant', '1');

INSERT INTO Instructor
VALUES ('2009', 'James', 'Joffries', 'M', '01227543665', '27 Cherry Street', 'FTR76398', '1', '124'),
('2011', 'Jim', 'Adams', 'M', '065490125674', '4 The Vale', 'TGY98555a', '2', '912'), 
('2013', 'Trinny', 'Vair', 'F', '0044587208725', '17 High Street, Chartham','YHF7665467', '1', '653');

INSERT INTO Client
VALUES ('1', 'Andy', 'Twill', 'M', '1998-02-01', '0044678412349876', '27 Cherry Street, CT4 7NF', 'TYH7890'),
('2', 'Sue', 'Adams', 'F', '1989-06-14', '0841-234-876', '45 Eggy Lane', 'CIO67891'),
('3', 'Jean', 'Adams', 'F', '2001-11-19', '01227765329', '4 Harkness Lane, Canterbury', 'RTY678923');

INSERT INTO Lesson
VALUES ('2017-06-24', '10:00:00', '1', '2011'),
('2019-06-07', '10:00:00', '2', '2009'),
('2017-07-12', '14:00:00', '1', '2011'),
('2017-08-19', '16:00:00', '1', '2011'),
('2020-08-17', '16:00:00', '2', '2011'),
('2020-08-01', '14:00:00', '1','2009');

INSERT INTO Test
VALUES  ('2018-03-01', '11:00:00', '1', '2009', '2', 'Passed', 'null'),
('2019-08-13', '13:00:00', '2', '2011', '3', 'Failed', 'Lack of Observation'),
('2019-10-21', '11:00:00', '2', '2011', '2', 'Failed', 'Speeding'),
('2020-08-19', '10:00:00', '2', '2009', '2', 'Not Taken', 'null');



TASK 2
--2.1) 
--List the date, time and instructor surname for all lessons with instructors who live on Cherry Street.
SELECT Lesson.OnDate, Lesson.OnTime, Instructor.Surname
FROM Instructor
INNER JOIN Lesson ON Instructor.EmpID = Lesson.EmpID
WHERE Instructor.Address LIKE '% Cherry Street';


--2.2) 
-- Output the status and the count of each status for tests taken by female 
--clients, if the count is greater than zero. 
SELECT Status, COUNT(Status)
FROM Test, Client
WHERE Client.Gender = 'F' AND Client.ClientID = Test.ClientID
GROUP BY Status
HAVING COUNT(Status) >=0;
 

--2.3) 
-- Output the employee ID, forename, and surname of all employees with surname 
--‘Joffries’, both AdminStaff and Instructors.
SELECT AdminStaff.EmpID, AdminStaff.Forename, AdminStaff.Surname FROM AdminStaff
WHERE AdminStaff.Surname = 'Joffries'
UNION
SELECT Instructor.EmpID, Instructor.Forename, Instructor.Surname FROM Instructor
WHERE Instructor.Surname = 'Joffries';


--2.4) 
-- Give the school address, school ID, forename and surname of all 
--Instructors who do not currently have a lesson in the database. 
SELECT School.Address, Instructor.SchoolID, Instructor.Forename, Instructor.Surname
FROM School, Instructor
WHERE School.SchoolID = Instructor.SchoolID AND NOT EXISTS (SELECT Lesson.EmpID FROM Lesson WHERE Lesson.EmpID = Instructor.EmpID);
 

--2.5) 
--For all tests at the 'Whitstable' centre, given the centre name, date, 
--time, test status, client forename, client surname, school address for the 
--accompanying Instructor and car model for the accompanying instructor.
--Sort alphabetically A to Z by client surname then client forename.
SELECT Centre.Name, Test.OnDate, Test.OnTime, Status, Client.Forename, 
Client.Surname, School.Address, Car.model
FROM Centre, Test, Client, School, Car, Instructor
WHERE Centre.Name = 'Whitstable' AND Test.ClientID = Client.ClientID 
AND Test.CentreID = Centre.CentreID AND Test.EmpID = Instructor.EmpID 
AND School.SchoolID = Instructor.SchoolID AND Car.CarID = Instructor.CarID
ORDER BY Client.Surname, Client.Forename DESC

 
--2.6)
¬-- Change all Lessons on or after 12/06/2020 with the Instructor James 
--Joffries to be with the instructor Jim Adams

UPDATE Lesson
SET EmpID = (SELECT Instructor.EmpID
            FROM Instructor
            WHERE Instructor.Forename = 'Jim' AND Instructor.Surname = 'Adams')
FROM Instructor
WHERE Instructor.Forename = 'James' AND Instructor.Surname ='Joffries'
AND Lesson.OnDate >= '2020-06-12';

