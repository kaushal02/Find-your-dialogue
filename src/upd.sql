use data;
drop table IF EXISTS upd;

create table upd (
	sno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	str varchar(100) NOT NULL,
	id int NOT NULL REFERENCES ids(id),
	occ int NOT NULL);