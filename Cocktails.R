library(tidyverse)

cocktails <- 
  boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-26/boston_cocktails.csv')

cocktails
cocktails %>% count(name)
cocktails %>% count(name,row_id)
a <- cocktails %>% select(name,row_id, everything()) %>% arrange(name, row_id)
View(a)

cocktails %>% 
  group_by(name) %>% 
  summarize(ids = n_distinct(row_id))
