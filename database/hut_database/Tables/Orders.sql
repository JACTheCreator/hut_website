
CREATE TABLE Orders (
    id int IDENTITY(1,1) NOT NULL,
	email varchar(320) NOT NULL,
	product_id int,
	date datetime,
	CONSTRAINT PK_ORDER PRIMARY KEY (id),
	CONSTRAINT FK_USER FOREIGN KEY (email) REFERENCES Users(email),
	CONSTRAINT FK_PRODUCT_ORDERS FOREIGN KEY (product_id) REFERENCES Products(id),
);