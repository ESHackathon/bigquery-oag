#!/bin/bash

AUTHORS_TABLE=opensource-202114:openacademicgraph.authors

echo "creating table authors"
bq mk --schema schemas/authors.schema.json -t ${AUTHORS_TABLE}

MAX_ERRORS=10000

for i in $(seq 0 14);
do
	echo "aminer_authors_${i}"
	bq load --schema schemas/authors.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${AUTHORS_TABLE} gs://osgv2/raw/aminer_authors_${i}.txt.gz
done

for i in $(seq 0 12);
do
	echo "mag_authors_${i}"
	bq load --schema schemas/authors.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${AUTHORS_TABLE} gs://osgv2/raw/mag_authors_${i}.txt.gz
done
