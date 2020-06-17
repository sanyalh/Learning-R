#install.packages("DBI")
#install.packages("pool")
#install.packages("RMySQL")

library(DBI)
library(pool)
library(RMySQL)

# NOT RUN {
# Connect to a MySQL database running locally
con <- dbConnect(RMySQL::MySQL(), dbname = "world")
# Connect to a remote database with username and password
con <- dbConnect(RMySQL::MySQL(), host = "localhost",
                 user = "root", password = "Swamiji01")
# But instead of supplying the username and password in code, it's usually
# better to set up a group in your .my.cnf (usually located in your home
# directory). Then it's less likely you'll inadvertently share them.
con <- dbConnect(RMySQL::MySQL(), group = "test")

# Always cleanup by disconnecting the database
dbDisconnect(con)
# }
# NOT RUN {
# All examples use the rs-dbi group by default.
if (mysqlHasDefault()) {
  con <- dbConnect(RMySQL::MySQL(), dbname = "test")
  summary(con)
  dbDisconnect(con)
}
# }