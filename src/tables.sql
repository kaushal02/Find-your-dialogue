drop database data;
create database data;
use data;

create table ids (
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE);

create table len1 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len2 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len3 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len4 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len5 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len6 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len7 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len8 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len9 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));
create table len10 (
	id int NOT NULL REFERENCES ids(id),
	str varchar(100) NOT NULL,
	occ int NOT NULL,
	PRIMARY KEY (id, str));