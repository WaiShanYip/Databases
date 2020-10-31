DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS hotel;

CREATE TABLE customer ( 
cid CHAR(4) PRIMARY KEY,
 firstName VARCHAR(255),
 lastName VARCHAR(255),
 gender CHAR(1) CHECK ( gender IN ('F', 'M') ),
 town VARCHAR(255)
);

CREATE TABLE hotel (
 hid CHAR(4) PRIMARY KEY,
 name VARCHAR(255),
 town VARCHAR(255),
 UNIQUE(name, town)
);

CREATE TABLE room (
 hid CHAR(4),
 num INTEGER CHECK (num > 0),
 type CHAR(6) CHECK (type IN ('Single','Double','Family')),
 PRIMARY KEY (hid, num),
 FOREIGN KEY (hid) REFERENCES hotel (hid)
);

CREATE TABLE booking (
hid CHAR (4),
cid CHAR (4), 
dstart DATE, 
ndays SMALLINT, 
room INTEGER,
PRIMARY KEY (hid, cid, dstart),
FOREIGN KEY (cid) REFERENCES customer (cid), 
FOREIGN KEY (hid, room) REFERENCES room (hid, num),
CONSTRAINT NO_DOUBLE_BOOKING
UNIQUE(hid, room, dstart)
);

INSERT INTO customer 
VALUES('0001', 'Karen', 'Yip', 'F');

INSERT INTO hotel
VALUES('0001', 'Hamlets', 'London');

INSERT INTO room
VALUES('0001', '1', 'Double');

INSERT INTO booking
VALUES('0001', '0001', '20/06/2020', '5', '1');

//Finds all the customers who have booked the same hotel as I have.
SELECT booking.hid, booking.cid
FROM booking, hotel
WHERE booking.hid = hotel.hid
AND hotel.hid = '0001';
