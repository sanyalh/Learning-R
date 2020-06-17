#install.packages("DBI");
#install.packages("RSQLite");

library(DBI)
library(RSQLite)

db <- dbConnect(SQLite(), dbname='thunderbird_manufacturing.db')
#db <- dbConnect(SQLite(), dbname='testdb2.db')

my_query <- dbSendQuery(db, "SELECT * FROM CUSTOMER")
#my_query <- dbSendQuery(db, "SELECT * FROM testtbl2")

my_data <- dbFetch(my_query, n = -1)

dbClearResult(my_query)
print(my_data)

remove(my_query)
dbDisconnect(db)
