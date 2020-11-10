PROJECT TITLE: PostgreSQL.sql
PURPOSE OF PROJECT: Stage 2 of University, Databases Systems ~ Assignment 3
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


PROJECT TITLE: In Class Assessment.sql
PURPOSE OF PROJECT: Stage 2 of University, Databases Systems ~ In Class Assessment 4
VERSION or DATE: 18/03/2020
AUTHORS: Wai Shan (Karen) Yip
EXPLANATION: 
This focuses on the implementation of PostgreSQL.
A hotel booking system uses a relational database to store information about hotels and bookings by customers for a particular room.
A relational schema for the database is:
customer ( cid, forename, surname, gender, town)
hotel ( hid, name, town)
room ( hid, num, type)
booking ( hid, cid, dstart, ndays, room)
num represents room number.
type represents room type.
dstart represents start date.
ndays represents the number of days of a booking.
Gender of the customer is either 'F' or 'M'.
Types of rooms are 'Single', 'Double' or 'Family'.
Hotels in the same town must have distinct names.

1.
Create 3 tables called customer, hotel and room using the information provided.

2.
Create the booking table using the information provided.

3. 
Register yourself as a customer.

4. 
Add a hotel named Hamlets in London.

5.
Record a double room in the Hamlets hotel just added.

6. 
Make a booking by you as the customer for the double room just created from 20th-25th June 2020.

7. 
Find out how many other customers who have also booked in the same hotel as you have done.
