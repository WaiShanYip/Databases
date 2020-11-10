PROJECT TITLE: PostgreSQL.sql
PURPOSE OF PROJECT: Stage 1 of University, Databases Systems ~ Assignment 3
VERSION or DATE: 26/02/2020
AUTHORS: Wai Shan (Karen) Yip
EXPLANATION: 
This assignment involves designing a database for a company that operates driving schools in the UK.
It is to store information about the driving schools, clients, instructors, cars and details of driving lessons and tests.

The driving school has a unique ID and address.
Several driving instructors and administration staff with various roles (Manager, Secretary, Assistant) are employed.

All members of staff have a unique ID, forename, surname, gender, contact phone number and address.
Instructors have their driving license number recorded.
Other staff have their role recorded.
Each instructor is allocated a specific car by the school.
Each car has a numeric identifier, registration number and model.

A client has a unique ID, forename, surname, gender, date of birth, address, contact phone number and provisional driving license number.
After clients register with a driving school, they can book lessons with a particular instructor.
Each driving lesson lasts an hour.
The client can change to a different instructor at any time.

A client can apply for a driving test at their nearest test centre. 
Each test centre has a unique ID, name, address and contact phone number.
There is no limit on the amount of driving test attempts.
The instructor should be able to drop off and pick up the client for every test.
If the client fails, the reason(s) for failure are recorded.

1. 
From the information supplied, implement the database tables in PostgreSQL making sure sensible data types are chosen for each column.
Insert the provided data into the tables.

2.
(2.1) List the date, time and instructor surname for all lessons with instructors who live on Cherry Street.
(2.2) Output the status and the count of each status for tests taken by female clients, if the count is greater than zero
(2.3) Output the employee ID, forename and surname of all employees with surname 'Joffries', both AdminStaff and Instructors.
(2.4) Give the school address, school ID, forename and surname of all instructors who do not currently have a lesson in the database.
(2.5) For all the tests at the 'Whitstable' centre, give the centre name, date, time, test status, client forename, client surname, 
school address for the accompanying instructor and the car model for the accompanying instructor.
Sort alphabetically A-Z by client surname and then client forename.
(2.6) Change all lessons on or after 12/06/2020 with the instructor James Joffries to be with instructor Jim Adams.
