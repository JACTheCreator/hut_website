
CREATE PROCEDURE Users_Delete (
	@email AS VARCHAR(320)
)
AS
BEGIN
	DELETE FROM Users WHERE email = @email;
END;