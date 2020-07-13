CREATE DATABASE HUT_DATABASE;

INSERT INTO Users (email, password, first_name, last_name, dob, phone_number)
VALUES ('jermainecoates@outlook.com', '', 'Jermaine', 'Coates', '1996-12-08' , '1231231234');
SELECT * FROM Users;

INSERT INTO Products (name, desription, unit_price, image_link)
VALUES ('Automatic Pet Feeder', 'Feeds aniimals', 100.00, 'link');
SELECT * FROM Products;
