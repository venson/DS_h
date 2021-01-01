---
title: "Week4 note"
output: html_document
___

# week4
## Editing Text Variables
### fixing character vectors- `tolower(), toupper()`


```r
if(!file.exists("./data")) {dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(filUrl, destfile = "./data/cameras.csv", method = "curl")
```

```
## Error in download.file(filUrl, destfile = "./data/cameras.csv", method = "curl"): object 'filUrl' not found
```

```r
cameraData <- read.csv("./data/cameras.csv")
```

```
## Warning in file(file, "rt"): cannot open file './data/cameras.csv': No such file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
names(cameraData)
```

```
## Error in eval(expr, envir, enclos): object 'cameraData' not found
```
