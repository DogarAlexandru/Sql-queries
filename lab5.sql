USE shoeInfo
---111---------------------------------------------------------------------------------
GO 
CREATE PROCEDURE CreateRetailers
@rid int,
@site varchar(50),
@country varchar(50)
AS 
BEGIN
INSERT INTO retailers (
rid,
site,
country)
VALUES (
@rid,
@site,
@country)
END

EXECUTE CreateRetailers 10,'www.ex.com','slovenia'

GO
CREATE PROCEDURE ReadRetailers
@rid int
AS 
BEGIN
SELECT *
FROM retailers
WHERE (rid=@rid)
END

EXECUTE ReadRetailers 10

GO 
CREATE PROCEDURE UpdateRetailers
@rid int,
@site varchar(50),
@country varchar(50)
AS 
BEGIN
UPDATE retailers 
SET site=@site,
    country=@country
WHERE rid=@rid
END

EXECUTE UpdateRetailers 10,'www.replace.com','slovenia'


GO 
CREATE PROCEDURE DeleteRetailers
@rid int
AS 
BEGIN
DELETE 
FROM retailers
WHERE rid=@rid
END

EXECUTE CreateRetailers 12,'www.ex2.com','slovenia'
EXECUTE UpdateRetailers 12,'www.ex2.com','slovenia'
EXECUTE DeleteRetailers 12
EXECUTE ReadRetailers 12


CREATE function first3(@inp varchar(50))
RETURNS varchar(3)
 GO
 
 GO



 --222-------------------------------------------------------------------------------------


 GO
Create function TestSize(@s int)
RETURNS INT
AS
 BEGIN
 IF @s BETWEEN 6 AND 18 SET @s=1
 ELSE SET @s=0
RETURN @s
END

GO

CREATE PROCEDURE CreateShoes
@flag int output,
@sid int,
@size float,
@status varchar(20),
@price float,
@typee int
AS 
BEGIN
EXEC @flag=TestSize @size
IF @flag=1
INSERT INTO shoes(
sid,
size,
status,
price,
typee)
VALUES (
@sid ,
@size ,
@status ,
@price ,
@typee )
END



GO
CREATE PROCEDURE ReadShoes
@sid int
AS 
BEGIN
SELECT *
FROM shoes
WHERE (sid=@sid)
END



GO 
CREATE PROCEDURE UpdateShoes
@flag int output,
@sid int,
@size float,
@status varchar(20),
@price float,
@typee int
AS 
BEGIN
EXEC @flag=TestSize @size
IF @flag=1 UPDATE shoes
SET size=@size ,
status=@status ,
price=@price ,
typee=@typee
WHERE sid=@sid
END




GO 
CREATE PROCEDURE DeleteShoes
@sid int
AS 
BEGIN
DELETE 
FROM shoes
WHERE sid=@sid
END

Declare @flag int
EXECUTE CreateShoes @flag output,22,15,'new',220,6
if @flag=1 print 'Size is good'
else print 'Size does not exist'
EXECUTE ReadShoes 22
Declare @flag int
EXECUTE UpdateShoes @flag output,20,12,'wornnn',220,6
if @flag=1 print 'Size is good'
else print 'Size does not exist'

EXECUTE DeleteShoes 21



--333------------------------------------------------------------------------------------

 
GO 
CREATE PROCEDURE CreateCompanies
@cmpid int,
@CEO varchar(50),
@equity int,
@Name varchar(50) 
AS 
BEGIN
INSERT INTO Companies(
cmpid,
CEO,
equity,
Name)
VALUES (
@cmpid,
@CEO ,
@equity ,
@Name )
END



GO
CREATE PROCEDURE ReadCompanies
@cmpid int
AS 
BEGIN
SELECT *
FROM Companies
WHERE (cmpid=@cmpid)
END



GO 
CREATE PROCEDURE UpdateCompanies
@cmpid int,
@CEO varchar(50),
@equity int,
@Name varchar(50) 
AS 
BEGIN
UPDATE Companies
SET CEO=@CEO,
equity=@equity,
Name=@Name
WHERE cmpid=@cmpid
END




GO 
CREATE PROCEDURE DeleteCompanies
@cmpid int
AS 
BEGIN
DELETE 
FROM Companies
WHERE cmpid=@cmpid
END

EXECUTE CreateCompanies 20,'jhonn',125215,'samsung'
EXECUTE ReadCompanies 20
EXECUTE UpdateCompanies 20,'jhonn',2000000,'samsung'
EXECUTE DeleteCompanies 20


---444-------------------------------------------------------------------------------------

 
 GO 
CREATE PROCEDURE CreateCity
@ctid int,
@state varchar(50),
@population int,
@Name varchar(50) 
AS 
BEGIN
INSERT INTO City(
ctid,
state,
population,
Name)
VALUES (
@ctid,
@state ,
@population ,
@Name )
END



GO
CREATE PROCEDURE ReadCity
@cmpid int
AS 
BEGIN
SELECT *
FROM City
WHERE (ctid=@cmpid)
END



GO 
CREATE PROCEDURE UpdateCity
@ctid int,
@state varchar(50),
@population int,
@Name varchar(50)
AS 
BEGIN
UPDATE City
SET state=@state,
population=@population,
Name=@Name
WHERE ctid=@ctid
END




GO 
CREATE PROCEDURE DeleteCity
@cmpid int
AS 
BEGIN
DELETE 
FROM City
WHERE ctid=@cmpid
END

EXECUTE CreateCity 23,'Holland',125215,'Amsterdam'
EXECUTE ReadCity 20
EXECUTE UpdateCity 20,'Holland',2000000,'Amsterdam'
EXECUTE DeleteCity 20



---555--------------------------------------------------------------------------------------

GO 
CREATE PROCEDURE CreateAthletes
@atid int,
@name varchar(50),
@team varchar(50) 
AS 
BEGIN
INSERT INTO athletes(
atid,
name,
team)
VALUES (
@atid,
@name ,
@team )
END



GO
CREATE PROCEDURE ReadAthletes
@cmpid int
AS 
BEGIN
SELECT *
FROM athletes
WHERE (atid=@cmpid)
END



GO 
CREATE PROCEDURE UpdateAthletes
@atid int,
@name varchar(50),
@team varchar(50) 
AS 
BEGIN
UPDATE athletes
SET name=@name,
team=@team
WHERE atid=@atid
END




GO 
CREATE PROCEDURE DeleteAthletes
@cmpid int
AS 
BEGIN
DELETE 
FROM athletes
WHERE atid=@cmpid
END

EXECUTE CreateAthletes 20,'Beal','Wizards'
EXECUTE ReadAthletes 20
EXECUTE UpdateAthletes 20,'Beal','Warriors'
EXECUTE DeleteAthletes 20










GO


CREATE view [Crud added shoes]
AS
SELECT *
FROM shoes
WHERE sid>10

GO
SELECT * FROM [Crud added shoes]



GO
CREATE view [Crud added cities]
AS
SELECT *
FROM city
WHERE ctid>10

GO
SELECT * FROM [Crud added cities]







 