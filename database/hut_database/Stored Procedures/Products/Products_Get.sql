
CREATE PROCEDURE Products_Get (
	@id AS INT
)
AS
BEGIN
	SELECT * FROM Products WHERE id = @id;
END;