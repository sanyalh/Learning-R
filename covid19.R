#install.packages("COVID19")

library(tidyverse)
library(lubridate)


#library(COVID19)

#covid19 <- covid19()
#covid19India <- covid19 %>% filter(administrative_area_level_1 == "India")
#View(covid19India)

## source data files
filenames <- c('time_series_covid19_confirmed_global.csv',
               'time_series_covid19_deaths_global.csv',
               'time_series_covid19_recovered_global.csv')
url.path <- paste0('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/',
                   'master/csse_covid_19_data/csse_covid_19_time_series/')

## download files to local
download <- function(filename) {
  url <- file.path(url.path, filename)
  dest <- file.path('./data', filename)
  print("hello")
  download.file(url, dest)
}

for (i in seq_along(filenames)) {
  download(filenames[i])
}
#bin <- lapply(filenames, download)

raw.data.confirmed <- 
  read_csv("./data/time_series_covid19_confirmed_global.csv")
raw.data.deaths <- 
  read_csv("./data/time_series_covid19_deaths_global.csv")
raw.data.recovered <- 
  read_csv("./data/time_series_covid19_recovered_global.csv")

dim(raw.data.confirmed)

raw.data.confirmed[1:10, 1:10]

n.col = ncol(raw.data.confirmed)
n.col
dates <- names(raw.data.confirmed)[5:n.col] %>% substr(1,8) %>% mdy()
dates

min.date <- min(dates)
max.date <- max(dates)

x <- raw.data.confirmed %>% 
  pivot_longer(
    cols = ends_with("20"), 
    names_to = "date", 
    values_to = "cases",
  )

dates
range(dates)

View(raw.data.confirmed)

cleanData <- fuction(data) {
 data %>% select(-(Province.State:Long))  
}
x %>% select(-(Province.State:Long))


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
