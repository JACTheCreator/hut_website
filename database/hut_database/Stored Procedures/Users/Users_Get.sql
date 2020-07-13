
CREATE PROCEDURE Users_Get (
	@email AS VARCHAR(320)
)
AS
BEGIN
	SELECT * FROM Users WHERE email = @email;
END;