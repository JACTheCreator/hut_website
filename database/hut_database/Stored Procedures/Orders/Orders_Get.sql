
CREATE PROCEDURE Orders_Get (
	@id AS INT
)
AS
BEGIN
	SELECT * FROM Orders WHERE id = @id;
END;