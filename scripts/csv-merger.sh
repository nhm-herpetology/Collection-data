#!/bin/sh

echo "Downloading files from GitHub"

svn checkout https://github.com/nhm-herpetology/Collection-data/trunk/raw-data

cd raw-data

echo "Deleting header info"

for file in *.csv; do sed -i.bak '1d' "$file"; done

find . -name "*.bak" -type f -delete

echo "Concatenating data"

cat *.csv > nhm-herpetology-data.csv

cd ..

mv raw-data/nhm-herpetology-data.csv nhm-herpetology-data.csv

rm -rf raw-data

echo "Data output as nhm-herpetology-data.csv"
