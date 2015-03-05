# Bootstrap
First run through fixed width format file to extract minimum fields for our use and output a tab delimited file.
```
awk -f data/api13gtx.txt > api.tsv
```

To find schools in each county that score >= 900 schools
```
cat api.tsv | awk -f percent.awk 
```

May be sorting it will give us an idea of *good* school districts.
```
cat api.tsv | awk -f percent.awk | sort -n
```
