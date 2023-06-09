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
--melyik európai útnak van a leghosszabb kész része a hozzá tartozó magyar utat figyelembe véve
--egy magyar útnak több része lehet az európai úthálózatban és ezek közül minddel térjen vissza a lekérdezés
select e.eurout
from palya p, europa e
where e.ut = p.ut and p.kesz = (select max(p.kesz)
				from palya p)				
--c
--melyik autopalyaknak van hosszab tervezet resze mint a leghoszabb olyan autopályának amelynek a kész része osztható 2-vel a tervezet részénél?
--ha több mint egy akkor az összeset
		   
select p.ut
from palya p
where p.terv > (
    SELECT p.terv
    from palya p
    where p.kesz = (
        select max(p.kesz)
        from palya p
        where p.kesz % 2 = 0
    )
);

--d
--Válasszuk ki azokat a településeket amelyeknek a hozzá tartozó útjának a tervezett része 0km
select t.nev
from telepules t
where t.ut in ( select p.ut
				from palya p
				where p.terv = 0);

--e 
--Válasszuk ki az európai úthálózatnak azokat a részeit amelyeknek nincs egyszerre tervezet és epülö része.
select e.eurout
from europa e
where e.ut not in (select p.ut
			   from palya p
			   where p.terv > 0 and p.epul > 0);
		   

--f: 
--Válassza ki az összes utat amiknek a kész hossza nagyobb mint az m1-nek, vagy az m0-nak a kész hossza.
select p.ut, p.kesz
from palya p
where p.kesz > ALL(
    select p.kesz
    from palya p
    where p.ut = "M0" or p.ut = "M1"
);

--g
--mely települések vannak azoknak ez európai pályáknak a mentén amiknek a megnevezésében van 7-es szám?
select t.nev
from telepules t
where t.id = ANY (
	select v.telepid
	from vege v
	where v.ut in (select e.ut
				  from europa e
				  where e.eurout like "%7%")
);

--h
--Hány olyan település van amelynek autópályályának a kész része meghaladja a 50 km-t, van tervezett része és az adott terv hosszhoz hány település tartozik?
--Az allekérdezés mint tábla szerepeljen
select p.terv as tervhossza, count(t.nev) as db
FROM (
   select p.ut,p.terv
   from palya p
   where p.kesz > 50 
) AS p
inner join telepules t on p.ut = t.ut
where p.terv>0
group by p.terv


--i
--A magyar uthálózat utjaiként hány olyan európai úthálózathoz tartozó út van amelynek az épülő része kisebb mint a tervezett része? 
--csak az egy vagy annál nagyobb értékekkel térjen vissza a lekérdezés
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.epul < p.terv 
group by p.ut
order by p.kesz desc

--j
--melyek azok a magyar utak amelyek legfeljebb 3 európai úthoz kapcsolódnak és a tervezett része kisebb mint 35km és mennyi tartozik ezekhez?
--csökkenő sorrendben jelenjenek meg
select p.ut, count(p.ut) as darab
from palya p inner join europa e on e.ut = p.ut
where p.terv < 35
group by p.ut
having count(p.ut) <= 3
order by darab desc

--k
--melyik határon van a leghosszab kész út? csak olyannal térjen vissza ami határon van!

select distinct t.hatar
from telepules t left join palya p on p.ut = t.ut
where t.hatar is not null and p.kesz = (select max(p.kesz)
				from palya p)

--l
--Melyek azok a települések amelyek nem határosak semmivel, vagy a hozzájuk tartozó autopálya végén helyezkednek el ekkor az is térjen vissza hogy hány autopályának a vége az a település?
select t.nev, count(*)
from telepules t
left join vege v on t.id = v.telepid
where t.hatar is null or v.id is not null
group by t.nev;

--m 
--Melyek azok az európai utak amelyeknek a hozzájuk tartozó települése(i) tartalmaznak "t"-t?
--A lekérdezés térjen vissza az úttal és a hozzá tartotó, feltételnek megfelelő településsel.

select e.eurout, t.nev 
from europa e left join palya p on e.ut = p.ut left join telepules t on p.ut = t.ut
where lower(t.nev) like "%t%"

--n
--Melyek azok az autópályák amelyek nem részei az európai úthálózatnak?

select distinct p.*
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
