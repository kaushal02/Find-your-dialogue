#!/bin/bash

cd /var/www/html/dbms

sed 's/[^A-Za-z[:space:]]//g' data/temp | sed '/^\s*$/d' | sed 's/^\s*//g' | sed 's/\s*$//g' | sed 's/\s\+/ /g' > data/temp1
tr '[A-Z]' '[a-z]' < data/temp1 > data/temp

mysql -uroot -ppassword < src/scr.sql

awk '{
	tname = "len" NF
	sname = $0
	system("mysql -uroot -ppassword -ss -N -e \42use data; SELECT id, occ, 1+length(T.str)-length(replace(T.str,\47 \47,\47\47)) FROM " tname " T WHERE T.str=\47" sname "\47\42")
}' data/temp > data/temp1

mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/temp1' into table query(id, occ, len);"

mysql -uroot -ppassword -ss -N -e "use data; SELECT id, sum(occ*len) as weight FROM query GROUP BY id ORDER BY weight DESC;" > data/temp1
head -3 data/temp1 > data/temp

cut -f1 < data/temp | awk '{
	eid = $0
	system("mysql -uroot -ppassword -ss -N -e \42use data; select name from ids where ids.id=" eid "\42")
}' > data/temp1

cut -f2 < data/temp | tr '\n' ',' | awk 'BEGIN{FS=","}{
	a1 = $1
	a2 = $2
	a3 = $3
	asum = a1+a2+a3
	a1 = (100*a1)/asum
	a2 = (100*a2)/asum
	a3 = (100*a3)/asum
	print int(a1)"%"
	print int(a2)"%"
	print int(a3)"%"
}' > data/temp2

paste data/temp2 data/temp1 > data/temp