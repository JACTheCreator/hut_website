
CREATE TABLE Users (
    email VARCHAR(320) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    phone_number VARCHAR(11),
	CONSTRAINT PK_USER PRIMARY KEY (email),
);

