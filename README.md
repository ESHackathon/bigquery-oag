# biquery-oag
Upload the open academic graph to google bigquery

## Download data

```
bash download.sh
```

## Prepare and upload to google cloud storage 

```
bash upload_storage.sh
```

## Upload files to biquery

```
bash bigquery_upload_papers.sh > authors.log 2>&1 
bash bigquery_upload_papers.sh > papers.log 2>&1
```
