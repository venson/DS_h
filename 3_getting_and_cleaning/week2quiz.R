
library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "360b8f775f4cf748fb5c",
                   secret = "f0252bc0ef848258558672a4717d3642a8b37d34"
)

# 3. Get OAuth credentials
options(browser = "google-chrome-stable")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
# stop_for_status(req)
jtleekjason <- content(req)
jtleek <- jsonlite::fromJSON(toJSON(jtleekjason))
