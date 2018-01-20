use data;
drop table IF EXISTS query;

create table query (
	sno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id int NOT NULL REFERENCES ids(id),
	occ int NOT NULL,
	len int NOT NULL);