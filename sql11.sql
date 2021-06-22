--11:
create procedure sp_zhou_1 
as	
	select M.City 
	from
	(select C.CustomerID as ID,C.City as City,count(distinct D.ProductID) as count
	from Customers C left join Orders O on C.CustomerID=O.CustomerID left join [Order Details] D on O.OrderID=D.OrderID
	group by C.CustomerID,C.City
	having count(distinct D.ProductID)<2)M
	group by City 
	having count(ID)>=2

go

create procedure sp_zhou_2 
as	
	with M as (
		select C.CustomerID as ID,C.City as City,count(distinct D.ProductID) as count
		from Customers C left join Orders O on C.CustomerID=O.CustomerID left join [Order Details] D on O.OrderID=D.OrderID
		group by C.CustomerID,C.City
		having count(distinct D.ProductID)<2
	)
	select M.City 
	from M
	group by City 
	having count(ID)>=2