all: updfilegen.cc build.sh
	make clean
	g++ -std=c++11 -O3 -w updfilegen.cc -o ../bin/upd
	bash build.sh

clean:
	-rm ../bin/upd ../data/init/files
	-sudo rm ../data/raw/*
	mysql -uroot -ppassword < tables.sql