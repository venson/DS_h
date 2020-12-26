library(httr)
## getting data off webpages
con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
html_code <- readLines(con)
close(con)

## Get from httr package
library(httr)
html2 <- GET(url)
content2 <- content(html2, as = "text")
parse_html <- htmlParse(content2, asText = TRUE)
xpathSApply(parse_html, "//title", xmlValue)

## accessing website with password
pg2 <- GET("http://httpbin.org/basic-auth/user/passwd",
            authenticate("user", "passwd"))
pg2

## using handles
google <- handle("http://google.com")
pg1 <- GET(handle = google, path = "/")
pg2 <- GET(handle = google, path = "search")
