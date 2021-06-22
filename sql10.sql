--10:
create procedure sp_birthday_employees_zhou 
as
	begin
		create table birthday_employees_zhou(EmployeeID int,LastName nchar(20), FirstName nchar(20));
		insert into birthday_employees_zhou select EmployeeID,LastName,FirstName from Employees where MONTH(BirthDate)=2
	end

go
exec sp_birthday_employees_zhou