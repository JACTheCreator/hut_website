
CREATE PROCEDURE Orders_Add (
	@email AS varchar(320),
	@product_id AS int,
	@total_cost AS float,
	@quantity AS int
)
AS
BEGIN
	INSERT INTO Orders (email, product_id, total_cost, quantity)
	VALUES (@email, @product_id, @total_cost, @quantity);
END;
