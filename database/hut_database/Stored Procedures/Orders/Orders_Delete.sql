
CREATE PROCEDURE Orders_Delete (
	@id AS INT
)
AS
BEGIN
	DELETE FROM Orders WHERE id = @id;
END;