1)
select a.ename, a.street ,a.city
from Employees a, Works b
where a.ename = b.ename AND b.cname = "bank israel";

2)
select a.ename, a.street , a.city
from Employees a, Works b
where a.ename = b.ename AND b.cname = "bank israel" AND b.salary >10000;

3)
select a.ename
from Employees a, Works b, Companies c
where a.ename = b.ename AND b.cname = c.cname AND a.city = c.city;

4)
select a2.ename
from Employees a1, Manages m, Employees a2
where a1.ename = m.mname AND a2.ename = m.ename AND
	a1.street = a2.street AND a1.city = a2.city;

5)
select b.ename
from Works b
where b.cname != 'bank israel';

6)
select a.ename 
from Works a
where a.salary >= ALL
	( select a1.salary from Works a1 where a1.cname = 'bank israel');

7)
select a.ename
from Works a
where a.salary > 
	(select avg(a1.salary)
	 from Works a1
	 where a1.cname = a.cname );

8)
create view [ManagersSalaries] AS
select distinct c.mname, b.salary
from Manages c, Works b
where c.mname=b.ename;
select * 
from ManagersSalaries;

