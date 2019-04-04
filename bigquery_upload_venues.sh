#!/bin/bash

VENUES_TABLE=opensource-202114:openacademicgraph.venues

echo "creating table venues"
bq mk --schema schemas/venues.schema.json -t ${VENUES_TABLE}

MAX_ERRORS=10000

echo "mag_venues"
bq load --schema schemas/venues.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${VENUES_TABLE} gs://osgv2/raw/mag_venues.txt.gz

echo "aminer_venues"
bq load --schema schemas/venues.schema.json --noreplace --max_bad_records=${MAX_ERRORS} --source_format=NEWLINE_DELIMITED_JSON ${VENUES_TABLE} gs://osgv2/raw/aminer_venues.txt.gz
