#install.packages("COVID19")
library(tidyverse)
library(COVID19)

covid19 <- covid19()

covid19 %>% filter(administrative_area_level_1 == "India")

# covid19 %>% count(administrative_area_level_1, wt=deaths, sort=TRUE) %>% 
#   head(20) %>%
#   mutate(Country = fct_reorder(administrative_area_level_1,n)) %>%
#   ggplot(aes(Country,n, fill=Country)) +
#   geom_bar(stat="identity") +
#   scale_y_continuous(labels = comma_format()) +
#   coord_flip() +
#   labs(x="Country", 
#        y="Deaths", 
#        title="Coronavirus deaths per Country",
#        fill="Country")


covid19 %>% group_by(administrative_area_level_1) %>% 
  summarize(deaths = sum(deaths)) %>% 
  arrange(desc(deaths)) %>% 
  head(20) %>%
  mutate(Country = fct_reorder(administrative_area_level_1,deaths)) %>%
  ggplot(aes(Country,deaths, fill=Country)) +
  geom_bar(stat="identity") +
  scale_y_continuous(labels = scales::label_comma()) +
  coord_flip() +
  labs(x="Country", 
       y="Deaths", 
       title="Coronavirus deaths per Country",
       fill="Country")

covid19 %>% group_by(administrative_area_level_1) %>% 
  summarize(confirmed = sum(confirmed)) %>% 
  arrange(desc(confirmed)) %>% 
  head(20) %>%
  mutate(Country = fct_reorder(administrative_area_level_1,confirmed)) %>%
  ggplot(aes(Country,confirmed, fill=Country)) +
  geom_bar(stat="identity") +
  scale_y_continuous(labels = scales::label_comma()) +
  coord_flip() +
  labs(x="Country", 
       y="Confirmed Cases", 
       title="Coronavirus confirmed cases per Country",
       fill="Country")
