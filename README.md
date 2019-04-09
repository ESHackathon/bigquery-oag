# biquery-oag
Upload the [open academic graph](https://www.openacademic.ai/oag/) to google bigquery

## Open academic graph?

2 dataset of 150 Million papers each (aprox). This dataset are available for use, but is difficult to use it, because you have to download huge compressed files of 10GB each (40GB uncompressed).

## Main idea 
Is to make the dataset of references, accesible by anyone. Allowing to access more than 150M references.
For this we are going to use Bigquery

## Why bigquery?
Because it handle huge amounts of data, its meant for bigdata, can easily handle million or billion of records.
And the cost of the processing of this data is distributed between the one that upload the data, and the one that query the data. That mean each person that access the data is going to pay for they queries to the data (there is a free mode too)

## The process
To download the dataset, prepare it and upload it to bigquery. 

### Download data
```
bash download.sh
```

### Prepare and upload to google cloud storage 

```
bash upload_storage.sh
```

### Upload files to biquery

```
bash bigquery_upload_papers.sh > authors.log 2>&1
bash bigquery_upload_papers.sh > papers.log 2>&1
bash bigquery_upload_venues.sh > venues.log 2>&1
bash bigquery_upload_linking.sh > linking.log 2>&1
```

## Result

Was uploaded to bigquery in this dataset:  __openacademicgraph__

You can query the data in this url: [https://console.cloud.google.com/bigquery?project=opensource-202114&p=opensource-202114&d=openacademicgraph&t=papers&page=table](https://console.cloud.google.com/bigquery?project=opensource-202114&p=opensource-202114&d=openacademicgraph&t=papers&page=table)

## Your first query
Count the total of distinct DOI in the database:

```
SELECT COUNT(DISTINCT(doi)) as total_doi
FROM `opensource-202114.openacademicgraph.papers`
```

OUTPUT: __80,808,741__

## Second query
Lets find all references that mention Epistemonikos in the abstract


## Exploring the data

We created a google colab (like google drive, but for coding), with the link you should be able to review and explore the data in google bigquery. [Go to google colab](https://colab.research.google.com/drive/1LkgbnEEHsjIBOPL82tVJVv6JF8F5Q-C6)

