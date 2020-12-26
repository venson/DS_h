##Subsetting and sorting

### Dealing with missing values

`X[which(X$var2 > 8)]`
after using `which`, it does not return NAs

## Sorting

```
sort(X$var2)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)
```

### ordering

```
X[order(X$var1, X$var3),]
```

### ordering with plyr

```
library(plyr)
arrange(X, var1)
arragen(X, desc(var1))
```

### Adding rows and columns

```
X$var4 <- rnorm(5)  ## define the colums name
Y <- cbind(X, rnorm(5))
```

## summarizing data

### Values with specific chararcteristics

```
table(restData$zipcode %in% c("21212"))
table(restData$zipcode %in% c("21212", "21213"))
restData[restData$zipcode %in% c("21212", "21213")]
```

### Cross tabs

```
data(UCBAdmissions)   ## the class of the data is table
DF <- as.data.frame(UCBAdmissions)
summary(DF)
## Freq Gender Admit are all the colum names
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
```

### Flat tables

```
ftable()
```

### size of data

`print(object.size(data),units= "Mb")`

### Creating new variables

`ifelse(data <0, TRUE, FALSE)`

### Creating categorical variables

`cut()` function
`cut(data,breaks = quantile(data))`
Easier cutting

```
library(Hmisc)
restData$zipGroups <- cut2(reatData#zipCode, g = 4)
```

### levels of factor variables

```
yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac <- factor(yesno, levels = c("yes", "no"))
as.numeric(yesnofac)
yesnofac <- relevel(yesnofac, ref= "no")
as.numeric(yesnofac)
```

## Reshaping Data

### The goal is tidy data

- Each variable forms a column
- Each observation forms a row
- Each table/file stores data about one kind of observation

### Melting data Frames

```
mtcars$carname <- rownames(mtcars)
car_melt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(car_melt, n =3)
tail(car_melt, n =3)

```

### casting data frames

```
cyl_data <- dcast(car_melt, cyl ~ variable)
cyl_data <- dcast(car_melt, cyl ~ variable, mean)

```

### Averaging values

```

head(InsectSprays)
tapply(InsectSprays#count, InsectSprays$spray, sum)

```

### another way - plyr package

```
ddply(InsectSprays, .(spray), summarize, sum = sum(count))
spray_sums <- ddply(InsectSprays, .(spray), summarize, sum = ave(count, FUN= sum))
```

### Managing data frame with dplyr basic tools

```
select(chicago, -(city:dptd))

i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
chicago[, -(i:j)]
```

### dplyr package

```
tbl_df
```
