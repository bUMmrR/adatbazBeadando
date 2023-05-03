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

insert into telepules values(
	(select max(t.id) + 1
	from telepules t), "M32", "Egy nagyon jó város név",null)

--b
--melyik útnak van a leghosszabb kész része
select p.ut
from palya p 
where p.kesz = (select max(p.kesz)
				from palya p)
				
--c
--melyik autopalyaknak van hosszab tervezet resze mint
--a leghoszabb autopályának a tervezet része 
		   
select p.ut
from palya p
where p.terv > (
	select p.terv
	from palya p
	where p.kesz = (
		select max(p.kesz)
		from palya p)
	)

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
			   
--g

--f: 
-- ird ki az összes utat amiknek a kész
--hossza nagyobb mint az m1-nek a kész hossza
select p.ut, p.kesz
from palya p
where kesz > ALL(
    select p.kesz
    from palya p
    where p.ut = "M1"
);

--g: NEM JÓ
--válasszuk ki az össze olyan települést ami határon van
select *
from vege v
where v.telepid = any (select t.id
					   from telepules t
					   where t.hatar is not null)

-- a feladatra ez a válasz lenne jó, de nincs benne any.
select t.nev FROM telepules t WHERE t.hatar IS NOT NULL;

-- talán jó
--g ird ki az m7-es autopalya két végén található települést
select t.nev
from telepules t
where t.id = ANY (
	select v.telepid
	from vege v
	where v.ut = 'M7'
);

--h
-- ird ki az összes olyan települést aminek az autopályája hosszabb mint 100

select distinct t.nev
FROM (
   select p.ut
   from palya p
   where p.kesz > 100
) AS p
join telepules t on p.ut = t.ut


--i/j meg kellenek !!!!!!!!!!!!!!!!!

--i
--utanként hány euroút van ami nagyobb mint 100km?
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.kesz >= 100
group by p.ut
order by p.kesz desc

--j
--melyek azok a megyar utak amelyek 3 európai úthoz kapcsolódnak és nagyobbak mint 100km?
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.kesz >= 100
group by p.ut
having count(p.ut) = 3
order by p.kesz desc

--k
-- ird ki az összes olyan települést ami nem határos semmivel, de az autopálya végén helyezkedik
select distinct t.nev
from telepules t
left join vege v on t.id = v.telepid
where t.hatar is null and v.id is not null;

--l
--ird ki az összes olyan települést ami nem határos semmivel, de az autopálya végén helyezkedik, azt is ird ki hogy hány autopályának a vége az a település
select t.nev, count(*)
from telepules t
left join vege v on t.id = v.telepid
where t.hatar is null and v.id is not null
group by t.nev;

--m 
--válasszuk ki azokat az európai utakat amelyeknek a település neve tartalmaz T-t

select e.eurout, t.nev 
from europa e left join palya p on e.ut = p.ut left join telepules t on p.ut = t.ut
where lower(t.nev) like "%t%"

--n
--melyek azok az autópályák amelyek nem részei az európai úthálózatnak

select distinct p.ut, e.eurout
from palya p left outer join europa e on e.ut = p.ut
where e.eurout is null

--o
--melyek azok a települések amelyek b-vel kezdődnek és azok amelyek t-vel kezdődőnek in és or clausok használata nélkül M0 és M3 utak rajtuk keresztül haladnak

select t.nev 
from telepules t, vege v 
where t.ut = v.ut 
and t.nev like "T%"
and v.ut = "M0"

Union 

select t.nev 
from telepules t, vege v 
where t.ut = v.ut 
and t.nev like "B%"
and v.ut = "M3"
