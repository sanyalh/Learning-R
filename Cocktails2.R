library(tidyverse)

cocktails <- boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-26/boston_cocktails.csv')

# test1 -------------------------------------------------------------------


cocktails %>% group_by(name) %>% 
  summarize(ids = n_distinct(row_id)) %>% 
  filter(ids > 1)

# test2 -------------------------------------------------------------------


cocktails %>% 
  count(name) %>% count(n)

