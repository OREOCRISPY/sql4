--8
create trigger movezhou on EmployeeTerritories
After insert,update
as
begin 
	declare @count int
	declare @target nchar='Stevens Point'
	select @count=count(distinct ET.EmployeeID)
	from EmployeeTerritories ET inner join Territories T on ET.TerritoryID=T.TerritoryID
	where T.TerritoryDescription=@target
	if @count>100
	begin
		update EmployeeTerritories set TerritoryID=(select TerritoryID from Territories where TerritoryDescription='Troy') 
		where TerritoryID=(select TerritoryID from Territories where TerritoryDescription=@target)
	end
end