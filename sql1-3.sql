--1
 insert into Region values(5,'Middle Earth')
 insert into Territories values(98300,'Gondor',5)
 insert into Employees values(10,'Aragorn','Aragorn','Mr.','1966-02-26 00:00:00.000','address','city','Region')
 insert into EmployeeTerritories values(10,98300)

--2
update Territories
set TerritoryDescription='Arnor'
where TerritoryID=98300

--3
delete from Employees where EmployeeID=10
delete from EmployeeTerritories where EmployeeID=10
delete from Territories where RegionID=5
delete from Territories where TerritoryID=5


