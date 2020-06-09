#install.packages("COVID19")
library(COVID19)

covid19 <- covid19()
View(covid19)
covid19 %>% select(starts_with("administrative_area_level"))
View(covid19 %>% filter(administrative_area_level_1 == "India"))

covid19 %>% group_by(administrative_area_level_1) %>% 
  summarize(deaths = sum(deaths)) %>% 
  select(administrative_area_level_1, deaths) %>% 
  ggplot(aes(administrative_area_level_1,deaths)) +
  geom_bar(stat="identity")
