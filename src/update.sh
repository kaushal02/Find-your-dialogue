#!/bin/bash

cd /var/www/html/dbms

cp "data/raw/$1" data/temp

sed 's/[^A-Za-z[:space:]]//g' data/temp | sed 's/\s/\n/g' | sed '/^\s*$/d' > data/temp1
tr '[A-Z]' '[a-z]' < data/temp1 > data/temp
rm data/temp1

mysql -uroot -ppassword -e "use data; INSERT INTO ids(name) VALUES (\"$1\");"

mysql -uroot -ppassword -ss -N -e "use data; SELECT id FROM ids WHERE ids.name=\"$1\"" > data/temp1

./bin/upd data/temp data/temp1

mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len1' into table len1(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len2' into table len2(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len3' into table len3(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len4' into table len4(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len5' into table len5(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len6' into table len6(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len7' into table len7(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len8' into table len8(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len9' into table len9(id, str, occ);"
mysql --local-infile -uroot -ppassword -e "use data; load data local infile 'data/len10' into table len10(id, str, occ);"

rm data/len* data/temp*