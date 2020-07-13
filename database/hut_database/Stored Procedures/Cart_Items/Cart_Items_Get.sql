
CREATE PROCEDURE Cart_Items_Get (
	@id AS INT
)
AS
BEGIN
	SELECT * FROM Cart_Items WHERE id = @id;
END;