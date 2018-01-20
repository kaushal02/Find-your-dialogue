#!/bin/bash

fname=$(echo $1 | sed 's/[^A-Za-z]//g' | tr '[A-Z]' '[a-z]')
echo $fname
