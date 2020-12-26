# week2

## Reading from MySQL

**mySQL**

- free and widely used open source database software
- widely used in internet based applications
- Data are structured in
  - Databases
  - Tables within databases
  - Fields within tables
  - Fields within tables
- each row is called a record

**Connecting and listing databases**

```
## conneting to dbserver
ucscDb <- dbConnect(MySQL(), user = "genome",
                    host = "genome-mysql.cse.ucsc.edu")

## show databases is mysql command
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb)

## get the table list of database "hg19"
hg19  <- dbConnect(MySQL(), user = "genome", db = "hg19",
                    host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
dbListFields(hg19, "affyU133Plus2")

dbGetQuery(hg19, "select count(*) from affyU133Plus2")

## read data from mysql
affyData <- dbReadTable(hg19, "affyU133Plus2")

## select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where miMatches between 1 and 3")
affyMis <- fetch(query); quantitle(affyMis$misMatches)

affyMisSmall <- fetch(query, n = 10); dbClearResult(query);

dim(affyMisSmall)

## disconnect as soon as you do not need it
dbDisconnect(hg19)
```

## HDF5

- large data sets
- supports storing a range of data types
- Heirarchical data format
- groups containing zero or more data sets and metadata
  - a group header with group name and list of attributes
  - a group symbol table with a list of objects in group
- dataset multidmensinal array of data elements with metadata
  - have a header with name, datatype, dataspace, and storage layout
  - have a data array with the data

### R HDF5 package

**Installation**
new method for RHDF5 installation

```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("rhdf5")
```

file create

```
library(rhdf5)
created <- h5createFile("example.h5")
created <- h5createGroup("example.h5", "foo")
created <- h5createGroup("example.h5", "baa")
created <- h5createGroup("example.h5", "foo/foobaa")
```

## web scraping

**Notes and further resources**

http://www.r-bloggers.com/?s=Web+Scraping
cran httr package

## API

https://dev.twitter.com/apps
sing up
create new application

**Accessing twitter from R**

```
myapp <- oauth_app("twitter",
                    key = "yourconsumerkey", secret = "youconsumersecret")
sig <-sign_oauth1.0(myapp, token = "yourtoken",
                    token_secret = "yourtokensecret")
home_tl <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)
```

**Converting the json object**

```
json1 <- content(home_tl)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[1, 1:4]
```

## there is a package for that

"data storage mechanism R package"
