--4
create view view_product_order_zhou as
select P.ProductID as ProductID,sum(D.Quantity) as TotalQuantity
from Products P inner join [Order Details] D on P.ProductID=D.ProductID
group by P.ProductID

--5
go

create procedure sp_product_order_quantity_zhou 
	@ProductID int,
	@TotalQuantity int OUTPUT
as 
	select @TotalQuantity=TotalQuantity
	from view_product_order_zhou
	where ProductID=@ProductID
return 
