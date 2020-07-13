
CREATE TABLE Products (
    id int IDENTITY(1,1) NOT NULL,
	name varchar(255),
	desription varchar(255),
	unit_price float,
	image_link varchar(MAX),
	CONSTRAINT PK_PRODUCT PRIMARY KEY (id),
);
