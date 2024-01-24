use jayradadiya_db;


CREATE TABLE Products (
    ProductID int NOT NULL PRIMARY KEY,
    ProductName varchar(255) NOT NULL,
    SupplierID int,
    CategoryID int,
    QuantityPerUnit varchar(255),
    UnitPrice float,
    UnitsInStock smallint,
    UnitsOnOrder smallint,
    ReorderLevel smallint,
    Discontinued bit
);

INSERT INTO Products VALUES
	(1, 'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1),
	(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1),
	(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0),
	(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0),
	(5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, 1),
	(6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0),
	(7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0),
	(8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0),
	(9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1),
	(10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0),
	(11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0),
	(12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0),
	(13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0),
	(14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0),
	(15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0),
	(16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.45, 29, 0, 10, 0),
	(17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1),
	(18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0),
	(19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.2, 25, 0, 5, 0),
	(20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0)

	select * from Products;
	
	select ProductID,ProductName,UnitPrice from Products where UnitPrice < 20;

	select ProductID,ProductName,UnitPrice from Products where UnitPrice between 15 and 25;

	select ProductName,UnitPrice from Products where UnitPrice > (select avg(UnitPrice) from Products);

	select avg(UnitPrice) from Products;

	select top(10) ProductName,UnitPrice from Products order by UnitPrice desc ;

	select Discontinued,count(Discontinued) as 'count' from Products group by Discontinued;

	
select ProductName,UnitsOnOrder,UnitsInStock from dbo.Products where UnitsInStock < UnitsOnOrder