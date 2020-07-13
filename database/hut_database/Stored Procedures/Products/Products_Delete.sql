
CREATE PROCEDURE Products_Delete (
	@id AS INT
)
AS
BEGIN
	DELETE FROM Products WHERE id = @id;
END;