
CREATE PROCEDURE Products_Add (
	@name AS VARCHAR(320),
	@desription AS VARCHAR(MAX),
	@unit_price AS FLOAT,
	@image_link AS VARCHAR(MAX),
	@category AS VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO Products (name, desription, unit_price, image_link, category)
	VALUES (@name, @desription, @unit_price, @image_link, @category);
END;
