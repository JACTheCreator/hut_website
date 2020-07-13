
CREATE PROCEDURE Cart_Items_Delete (
	@id AS INT
)
AS
BEGIN
	DELETE FROM Cart_Items WHERE id = @id;
END;