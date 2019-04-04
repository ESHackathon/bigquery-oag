#!/bin/bash


MAX_ERRORS=10000

TABLE=opensource-202114:openacademicgraph.papers_linking
echo "mag_papers_${i}"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/paper_linking_pairs.txt

TABLE=opensource-202114:openacademicgraph.venues_linking
echo "mag_venues_${i}"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/venue_linking_pairs.txt

TABLE=opensource-202114:openacademicgraph.authors_linking
echo "mag_authors_${i}"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/author_linking_pairs.txt
