
--1.Names of companies that have an outlet in new york
SELECT p.Name
FROM city c,outlets o,companies p
WHERE c.Name='New York' and c.ctid=o.ctid and p.cmpid=o.cmpid

--2.Names of cities that have 3 or more outlets in them
SELECT c.Name
FROM city c
WHERE EXISTS 
(SELECT *
FROM outlets o1,outlets o2,outlets o3
WHERE c.ctid=o1.ctid and c.ctid=o2.ctid and c.ctid=o3.ctid and o2.cmpid<>o1.cmpid and o3.cmpid<>o2.cmpid and o3.cmpid<>o1.cmpid)

--3.In wich state and city can you find shoes like the ones sold on https://www.kixify.com/ 
SELECT c.Name,c.state
FROM city c , outlets o, Companies p,shoeType tp,shoes sh,retailers r, retailers_shoes rsh
WHERE c.ctid=o.ctid and p.cmpid=o.cmpid and p.cmpid=tp.cmpid and tp.stid=sh.typee 
and sh.sid=rsh.sid and r.rid=rsh.rid and r.site='https://www.kixify.com/'

--4.Find out the combined number of shoe types all athletes from each team are promoting
SELECT COUNT(sh.stid),a.team
FROM shoeType sh , athletes a
WHERE sh.atid=a.atid
GROUP BY a.team

--5.Show news sites  having more than 3 articles
SELECT COUNT(ar.stid),ns.site
FROM article ar,news_sites ns
WHERE ar.nsid=ns.nsid
GROUP BY ns.site
HAVING COUNT(ar.stid)>3

--6.Show the average price of the shoes on sites that have more than 2 shoes on sale
SELECT AVG(sh.price),r.site
FROM retailers_shoes rsh,retailers r,shoes sh
WHERE rsh.rid=r.rid and sh.sid=rsh.sid
GROUP BY r.site
HAVING COUNT(rsh.sid)>2

--7.Wich companies have outlets in California 
SELECT DISTINCT p.Name
FROM city c,outlets o,companies p
WHERE c.state='California' and c.ctid=o.ctid and p.cmpid=o.cmpid

--8.Wich sizes are the nike shoes on sale 
SELECT DISTINCT sh.size
FROM shoes sh,shoeType s,Companies p
WHERE p.cmpid=s.cmpid and p.Name='Nike' and s.stid=sh.typee

--9.Show the difference in price between new and worn shoes on sale on retail sites
SELECT AVG(sh1.price),sh1.status
FROM shoes sh1 
GROUP BY sh1.status

--10.Show the retailers that sell shoe types that the site http://www.complex.com/ writes about
SELECT DISTINCT r.site
FROM retailers r,retailers_shoes rsh,shoes sh,shoeType s,article a,news_sites ns
WHERE r.rid=rsh.rid and sh.sid=rsh.sid and sh.typee=s.stid and s.stid=a.stid and a.nsid=ns.nsid and ns.site='http://www.complex.com/'









