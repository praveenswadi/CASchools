# Bootstrap
First run through fixed width format file to extract minimum fields for our use and output a tab delimited file.
```
awk -f parse.awk data/api13gtx.txt > api.tsv
```

How many school districts in California?
```
cat api.tsv| awk -F "\t" '{print $4}' | sort | uniq | wc -l
```

How many schools in each school district?
```
cat api.tsv| awk -F "\t" '{print $4}' | sort | uniq -c | sort -n
```

To find schools in each county that score >= 900 schools
```
cat api.tsv | awk -f percent.awk 
```

May be sorting it will give us an idea of *good* school districts.
```
cat api.tsv | awk -f percent.awk | sort -n
```
