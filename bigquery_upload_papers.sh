#!/bin/bash

PAPERS_TABLE=opensource-202114:openacademicgraph.papers

echo "creating table papers"
bq mk --schema schemas/papers.schema.json -t ${PAPERS_TABLE}

MAX_ERRORS=10000

for i in $(seq 0 10);
do
	echo "mag_papers_${i}"
	bq load --schema schemas/papers.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${PAPERS_TABLE} gs://osgv2/raw/mag_papers_${i}.txt.gz
done

for i in $(seq 0 14);
do
	echo "aminer_papers_${i}"
	bq load --schema schemas/papers.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${PAPERS_TABLE} gs://osgv2/raw/aminer_papers_${i}.txt.gz
done