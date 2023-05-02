--tablák össze kötése
alter table europa add
	constraint fk_europa_palya FOREIGN KEY (ut)
	REFERENCES palya(ut)
	
alter table vege add 
	constraint fk_vege_palya FOREIGN KEY (ut)
	REFERENCES palya(ut)
	
alter table telepules add 
	constraint fk_telepules_palya FOREIGN KEY (ut)
	REFERENCES palya(ut)	
	
alter table vege add 
	constraint fk_vege_telepules FOREIGN KEY (telepid)
	REFERENCES telepules(id)
	
--lekerdezesek
--a,



--b
--melyik útnak van a leghosszabb kész része
select p.ut
from palya p 
where p.kesz = (select max(p.kesz)
				from palya p)
				
				
--c
--Az európai út E60 és áthalad budaörsön --m0 melyik magyar út?
		   
select p.ut
from palya p
where p.ut in (select e.ut
			   from europa e
			   where e.eurout = "E60")
and
p.ut in(select t.ut
		from telepules t
		where t.nev = "Budaörs")
		
--d
--Válaszuk ki azokat az utakat ahol az európai út E60
select p.ut
from palya p
where p.ut in (select e.ut
			   from europa e
			   where e.eurout = "E60")	


--e 
--minden olyan út ami nem E579
select p.ut
from palya p
where p.ut not in (select e.ut
			   from europa e
			   where e.eurout = "E579")
			   
--f/g !!!!!!!!!!!!!
--válasszuk ki az össze olyan települést ami határon van
select *
from vege v
where v.telepid = any (select t.id
					   from telepules t
					   where t.hatar is not null)

select t.id
from telepules t
where t.hatar is not null

--h
