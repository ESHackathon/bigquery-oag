#!/bin/bash

for zip_file in *.zip
do
	for in_zip_file in $(unzip -l $zip_file | grep ".txt" | awk '{print $4}')
	do
		echo "${in_zip_file}.gz"
		unzip -c $zip_file $in_zip_file | grep "{"| gzip > ${in_zip_file}.gz
		gsutil -o GSUtil:parallel_composite_upload_threshold=150M cp "${in_zip_file}.gz" gs://osgv2/raw/
		rm ${in_zip_file}.gz
	done
done