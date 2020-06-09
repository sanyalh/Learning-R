#install.packages("COVID19")
library(COVID19)

covid19 <- covid19()
View(covid19)
covid19 %>% select(starts_with("administrative_area_level"))
View(covid19 %>% filter(administrative_area_level_1 == "India"))

covid19 %>% group_by(administrative_area_level_1) %>% 
  summarize(deaths = sum(deaths)) %>% 
  #select(Country, deaths) %>% 
  arrange(desc(deaths)) %>% 
  head(20) %>%
  mutate(Country = fct_reorder(administrative_area_level_1,deaths)) %>%
  ggplot(aes(Country,deaths, fill=Country)) +
  geom_bar(stat="identity") +
  labs(x="Country", 
       y="Deaths", 
       title="Coronavirus deaths per Country",
       fill="Country")

covid19 %>% group_by(administrative_area_level_1) %>% 
  summarize(confirmed = sum(confirmed)) %>% 
  #select(Country, deaths) %>% 
  arrange(desc(confirmed)) %>% 
  head(20) %>%
  mutate(Country = fct_reorder(administrative_area_level_1,confirmed)) %>%
  ggplot(aes(Country,confirmed, fill=Country)) +
  geom_bar(stat="identity") +
  labs(x="Country", 
       y="Confirmed Cases", 
       title="Coronavirus confirmed cases per Country",
       fill="Country")
