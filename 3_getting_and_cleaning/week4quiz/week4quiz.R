if (!file.exists("fss06.csv")) {
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              destfile = "fss06.csv")
}
fss <- read.csv("fss06.csv")
if (!file.exists("gdp.csv")) {
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",
              destfile = "gdp.csv")
}
if (!file.exists("country.csv")) {
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              destfile = "country.csv")
}
country  <- read.csv("country.csv")
gdp <- read.csv("gdp.csv", skip = 3, nrows = 192)
gdpd <- gdp$US.dollars.[!gdp[,5] == ""]
gdpd <- gsub(",", "", gdpd)
gdpmean <- mean(as.numeric(gdpd))
grep("^United", gdp[, 4])
country_new <- country[country[, 1] %in% gdp[, 1],]
grep("^Fiscal.*end.*June", country_new[,10])
