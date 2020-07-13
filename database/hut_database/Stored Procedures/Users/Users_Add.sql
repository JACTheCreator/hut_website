

CREATE PROCEDURE Users_Add (
	@email AS VARCHAR(320),
	@first_name AS VARCHAR(255),
	@last_name AS VARCHAR(255),
	@dob AS date,
	@phone_number AS VARCHAR(11),
)
AS
BEGIN
	INSERT INTO Users (email, first_name, last_name, dob, phone_number)
	VALUES (@email, @first_name, @last_name, @dob, @phone_number);
END;
