CREATE DATABASE shoeInfo
GO 
USE shoeInfo
GO
CREATE TABLE Companies
(cmpid int PRIMARY KEY,
CEO varchar(50),
equity int
)
CREATE TABLE athletes
(
atid int PRIMARY KEY,
name varchar(50),
team varchar(50)
)
CREATE TABLE shoeType
(
stid int PRIMARY KEY,
cushoning varchar(50) DEFAULT 'Fylon',
height varchar(30),
sole varchar(20) DEFAULT 'rubber',
cmpid int FOREIGN KEY REFERENCES Companies(cmpid),
atid int FOREIGN KEY REFERENCES athletes(atid)
)
CREATE TABLE shoes
(
sid int PRIMARY KEY,
size float,
status varchar(20) DEFAULT 'new',
price float NOT NULL,
type int FOREIGN KEY REFERENCES shoeType(stid)
)
CREATE TABLE retailers
(
rid int PRIMARY KEY,
site varchar(50),
country varchar(50) DEFAULT 'international'
)
CREATE TABLE retailers_shoes
(
sid int FOREIGN KEY REFERENCES shoes(sid),
rid int FOREIGN KEY REFERENCES retailers(rid),
CONSTRAINT pk_retailersshoes PRIMARY KEY(sid,rid)
)
CREATE TABLE news_sites
(
nsid int PRIMARY KEY,
site varchar(50) NOT NULL,
language varchar(20) DEFAULT 'english'
)
CREATE TABLE articles
(
arid int PRIMARY KEY,
author varchar(50),
published date,
nsid int FOREIGN KEY REFERENCES news_sites(nsid)
)
CREATE TABLE city
(
ctid int PRIMARY KEY,
state varchar(50) NOT NULL,
population int
)
CREATE TABLE outlets
(
cmpid int FOREIGN KEY REFERENCES Companies(cmpid),
ctid int FOREIGN KEY REFERENCES city(ctid),
CONSTRAINT pk_outlets PRIMARY KEY(cmpid,ctid)
)


ALTER TABLE articles
ADD stid int NOT NULL FOREIGN KEY REFERENCES shoeType(stid)


drop TABLE Companies
drop TABLE athletes
drop TABLE shoeType
drop TABLE shoes
drop TABLE retailers
drop TABLE retailers_shoes
drop TABLE news_sites
drop TABLE articles