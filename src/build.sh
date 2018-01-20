#!/bin/bash

cd ../data/init
for file in *; do
	echo "$file" >> files
done

sed -i '/~$/d' files

awk 'BEGIN{FS='\t'} {
	fname = $0
	system("cp " fname " ../raw/" fname)
	system("bash ../../src/update.sh " fname)
	print $0 " uploaded"
}' files
