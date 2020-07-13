
CREATE TABLE Cart_Items (
    id int IDENTITY(1,1) NOT NULL,
	product_id int,
	quantity int,
	total_cost float,
	CONSTRAINT PK_CART_ITEM PRIMARY KEY (id),
	CONSTRAINT FK_PRODUCT FOREIGN KEY (product_id) REFERENCES Products(id),
);