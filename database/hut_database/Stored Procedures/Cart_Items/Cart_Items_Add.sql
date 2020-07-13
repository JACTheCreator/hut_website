
CREATE PROCEDURE Cart_Items_Add (
	@product_id int,
	@quantity int,
	@total_cost float
)
AS
BEGIN
	INSERT INTO Cart_Items (product_id, quantity, total_cost)
	VALUES (@product_id, @quantity, @total_cost);
END;
