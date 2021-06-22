--6

create procedure sp_product_order_city_zhou
	@ProductName int,
	@City nvarchar(20) OUTPUT,
	@TotalQuantity int OUTPUT
as 
	select @City=M.City,@TotalQuantity=M.quantity
	from (select top 5 C.City as City,Count(O.OrderID) as num,SUM(D.Quantity) as quantity
	from Orders O left join Customers C on O.CustomerID=C.CustomerID left join [Order Details] D on O.OrderID=D.OrderID left join Products P on D.ProductID=P.ProductID
	where P.ProductName=@ProductName
	group by C.City
	order by Count(O.OrderID) DESC
	)M
return

