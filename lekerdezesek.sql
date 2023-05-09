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
-- ha több mint egy akkor az összeset
select p.ut
from palya p 
where p.kesz = (select max(p.kesz)
				from palya p)
				
--c
--melyik autopalyaknak van hosszab tervezet resze mint
--a leghoszabb autopályának a tervezet része 
-- ha több mint egy akkor az összeset
		   
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
--minden olyan euroút aminek nincs egyszerre tervezet része és epülö része
select e.eurout
from europa e
where e.ut not in (select p.ut
			   from palya p
			   where p.terv > 0 and p.epul > 0)
			   
--g

--f: 
-- ird ki az összes utat amiknek a kész
--hossza nagyobb mint az m1-nek, vagy az m0-nak a kész hossza
select p.ut, p.kesz
from palya p
where kesz > ALL(
    select p.kesz
    from palya p
    where p.ut = "M0" or p.ut = "M1"
);

--g ird ki az m7-es autopalya két végén található települést
select t.nev
from telepules t
where t.id = ANY (
	select v.telepid
	from vege v
	where v.ut = 'M7'
);

--h
-- ird ki az összes olyan települést aminek az autopályája hosszabb mint 150 km

select t.nev
FROM (
   select p.ut
   from palya p
   where p.kesz > 150
) AS p
join telepules t on p.ut = t.ut


--i
--utanként hány euroút van aminek az épülő része kisseb mint a tervezet része
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.epul < p.terv 
group by p.ut
order by p.kesz desc

--j
--melyek azok a megyar utak legfeljebb 3 európai úthoz kapcsolódnak és a tervezett része kisebb mint 35?
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.terv < 35
group by p.ut
having count(p.ut) <= 3
order by p.kesz desc

--k
-- ird ki az összes olyan települést ami nem határos semmivel, vagy az autopálya végén helyezkedik
select distinct t.nev
from telepules t
left join vege v on t.id = v.telepid
where t.hatar is null or v.id is not null;

--l
--ird ki az összes olyan települést ami nem határos semmivel, vagy autopálya végén helyezkedik, azt is ird ki hogy hány autopályának a vége az a település
select t.nev, count(*)
from telepules t
left join vege v on t.id = v.telepid
where t.hatar is null or v.id is not null
group by t.nev;

--m 
--válasszuk ki azokat az európai utakat amelyeknek a település neve tartalmaz t-t

select e.eurout, t.nev 
from europa e left join palya p on e.ut = p.ut left join telepules t on p.ut = t.ut
where lower(t.nev) like "%t%"

--n
--melyek azok az autópályák amelyek nem részei az európai úthálózatnak

select distinct p.ut, e.eurout
from palya p left outer join europa e on e.ut = p.ut
where e.eurout is null

--o
--irja ki az összes olyan T-vel kezdodo telepulést ami az m0-ás mellet található, illetve az összes olyan B-vel kezdodo telepulést ami az m3-ás mellet található
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
