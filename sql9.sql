drop table city_zhou
drop table people_zhou
create table city_zhou(ID int primary key, City nchar(20) not null)
insert into city_zhou values(1,'Seattle')
insert into city_zhou values(2,'Green Bay')

create table people_zhou(ID int primary key, name nchar(20) not null, City int not null)
insert into people_zhou values(1, 'Aaron Rodgers',2)
insert into people_zhou values(2, 'Russell Wilson',1)
insert into people_zhou values(3, 'Jody Nelson',2)



begin
	declare @people_live_in_Seattle table(pid int);
	insert into @people_live_in_Seattle
	select P.ID
	from city_zhou C inner join people_zhou P on C.ID=P.City
	where C.City='Seattle'
	if((select count(*) from @people_live_in_Seattle)>0)
	begin 
		insert into city_zhou values(3,'Madison');
		update people_zhou set City=3 where ID in (select * from @people_live_in_Seattle)
	end
end

go 
create view Packers_your_name as 
select P.ID,P.name,P.City as CityID,C.City as City
from people_zhou P inner join city_zhou C on P.City=C.ID

