--7
create procedure sp_move_employees_zhou
as 
	begin 
		declare @target varchar(20)='Tory';
		declare @res int;

		declare @temtable table(EmployeeID int Primary key,TerritoryDescription varchar(20) not null);

		insert into @temtable(EmployeeID,TerritoryDescription)
		select E.EmployeeID as EmployeeID,T.TerritoryDescription as TerritoryDescription
		from Employees E inner join EmployeeTerritories ET on E.EmployeeID=ET.EmployeeID inner join Territories T on ET.TerritoryID=T.TerritoryID

		select @res=count(EmployeeID)
		from @temtable
		where TerritoryDescription = @target
		select @res;
		IF @res>0
		BEGIN
			insert into Territories values(98301,'Stevens Point',3)
			update EmployeeTerritories set TerritoryID=98301 where EmployeeID in (select * from @temtable where TerritoryDescription=@target)
		END
	END