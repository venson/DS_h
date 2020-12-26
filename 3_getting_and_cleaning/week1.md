# The goal of this course

**Raw data -> Processing script -> tidy data** -> data analysis -> data communication

> Data are values of qualitative or quantitative variables, belonging to a set of items.

**Qualitative** : Country of origin, sex, treatment

**Quantitative** : Height, weight, length, blood pressure

## Raw VS processed

**Raw data**

- the original source of the data
- Often hard to use for data analysis
- Data analysis includes processing
- Raw data may only need to processed once

**Processed data**

- Data that is ready for analysis
- Processing can include merging, subsetting, transforming, etc.
- There may be standards for processing
- All steps should be recorded

## Four things should have

1. The raw data.
2. A tidy data set
3. A code book describing each variable and its value in the tidy data set
4. An explicit and exact recipe you used to go from 1 -> 2, 3.

## The Raw data

1. Ran no software on the data
2. Did not manipulate any of the numbers in the data
3. You did not remove any data from the data set
4. You did not summarize the data in any way

## The tidy data

1. Each variable you measure should be in one column
2. Each different observation of that variable should be in a different row
3. There should be one table for each kind of variable
4. If you have multiple tables, they should include a column in the table that allows them to be linked
   > - include a row at the top of each file with variable names
   > - Make variable names human readable
   > - data should be saved in one file per table

## The code book

1. information about the variables in the data set not contained in the tidy data
2. information about the summary choices you made
3. information about the experimental study design you used
4. a common formant for this document
5. section "study design" a thorough description of how you collected the data
6. section "code book" describes each variable and its units

# Downloading files

## working directory

- `getwd()` and `setwd()`
- relative and absolute paths
  - **Relative** `setwd("./data"), setwd("../")`
  - **absolute** `setwd("/Users/venson/data/")`
- Windows `setwd("c:\\Users\\andrew\\Downloads")`

## Checking for and creating directories

- `file.exists("directoryName")`
- `dir.create("directoryName")`

```
    if (!file.exists("data")) {
     dir.create("data")
    }
```

## Download a file from the web

```
fileUrl <- "https://..."
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl") # curl for mac os
list.files("./data")

dateDownloaded <- date() # in case for web information update
```

## Loading flat files -read.table()

- Flexible and robust but requires more parameters. default sep is tab
- file, header, sep, row.names, nrows

```
cameraData <- read.table("./data/cameras.csv", sep = ",", header = TRUE)
```

reading flat file have ' or " in data values, setting quote = "" often resolves this

## Reading Excel Files

read entire file

```
library(xlsx)
cameraData <- read.xlsx("./data/cameras.xlsx",sheetIndex = 1, header = TRUE)

```

read specific rows and columns

```
colIndex <- 2:3
rowIndex <- 1:4
cameraDataSubset <- read.xlsx("./data/cameras.xlxs", sheetIndex =1,
                              colIndex = colIndex, rowIndex = rowIndex)
```

**Further notes**

- `write.xlsx` write out a Excel file
- `read.xlsx2` is much faster, but for reading subsets of rows may be slightly unstable
- XLConnect package has more options for writing and manipulating Excel files

## Reading XML

**XML**

- Extensible markup language
- store structured data
- widely used in internet applications
- extracting XML is the basis for most web scraping
- components
  - Markup -labels that give the text structure
  - Content - the actual text of the document

**Structure**

- Tags correspond to general labels
  - Start tags`<section>`
  - end tags`</section>`
  - empty tags`<line-break />`
- Elements are specific examples of tags
  - `<Greeting> Hello, world </Greeting>`
- Attributes are components of the label
  - `<img src="jeff.jpg" alt="instructor"/>`
  - `<step number="3"> Connect A to B. </step>`

**Read file into R**

```
library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
download.file(fileUrl, destfile= "simple.xml")
## use url in xmlTreeParse may cause erro, download.file first
## useInternal is will create a XMLInternalDocument. or a XMLDocument file without it
## useInternal is partical ,useInternalNode is full
doc <- xmlTreeParse("simple.xml", useInternal = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
```

**XPath**

- `/node` Top level node
- `//node` Node at any level
- `node[@attr-name]` Node with an attribute name
- `node[@attr-name='bob']`Node with attribute name attr-name='bob'
  get the items on the menu and prices

```
xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)
```

## Data.table Package
