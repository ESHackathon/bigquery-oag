#!/bin/bash


MAX_ERRORS=10000

TABLE=opensource-202114:openacademicgraph.papers_linking
echo "papers_linking"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/paper_linking_pairs.txt.gz

TABLE=opensource-202114:openacademicgraph.venues_linking
echo "venues_linking"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/venue_linking_pairs.txt.gz

TABLE=opensource-202114:openacademicgraph.authors_linking
echo "authors_linking"
bq load --autodetect --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${TABLE} gs://osgv2/raw/author_linking_pairs.txt.gz
