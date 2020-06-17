#install.packages("lubridate")

library(tidyverse)
library(lubridate)
library(nycflights13)

mpg
View(ggplot2::mpg)

g <- ggplot(mpg, aes(class)) 
g + geom_bar()

m1 <- mpg %>% group_by(class,displ) %>% 
  summarize(count=n())
m2 <- m1 %>% group_by(class) %>% summarize(count=n())
m2

View(recent_grads)

###

abc <- tribble(
  ~Major, ~Median, ~Sample_size,
  #--/--/--
  "aaa", 75000, 100,
  "bbb", 50000, 3,
  "zzz", 45000, 90
)

abc

abc %>% 
  ggplot(aes(Sample_size, Median)) +
  geom_point() +
  geom_text(aes(label = Major), check_overlap = TRUE, vjust=1, hjust=1)


abc <- tribble(
  ~x, ~y, ~z,
  #--/--/--
  "a", 10, 5,
  "b", -2, 3)
abc  

read_delim("a|b|c\n  1| 10| 5\n  2| 2| 3", delim="|")

read_delim("a,b\n  1,'a,b'", delim=",", quote = "\'")

abc <- tribble(
  ~name, ~id, ~xxx,
  #--/--/--
  "aaa", 1, 100,
  "bbb", 7, 3,
  "aaa", 2, 90
)

abc %>% count(name,id)

abc %>% group_by(name,id) %>% summarize(count = n())


cocktails <- boston_cocktails <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-26/boston_cocktails.csv')

# test1 -------------------------------------------------------------------


cocktails %>% group_by(name) %>% 
  summarize(ids = n_distinct(row_id)) %>% 
  filter(ids > 1)

# test2 -------------------------------------------------------------------


cocktails %>% 
  count(name) %>% count(n)


# ### ---------------------------------------------------------------------
abc <- tribble(
  ~name, ~id, ~xxx,
  #--/--/--
  "aaa", NA, 100,
  "bbb", 7, 3,
  "aaa", 2, 90
)

abc %>% filter(!is.na(id)) %>% summarize(n = n())
abc %>% filter(is.na(id)) %>% count()

is.na(abc)
colSums(is.na(flights))


# ### ---------------------------------------------------------------------

def <- tribble(
  ~a, ~b, ~c,
  #--/--/--
  1000, 40, 100,
  2000, 45, 3,
  3000, 41, 90
)

def %>% ggplot(aes(a,b)) +
  geom_point() +
  scale_x_continuous() 

def %>% ggplot(aes(a,b)) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous(limits = c(0,95))

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  mutate(r = min_rank(desc(dep_time))) %>% 
  filter(r %in% range(r)) %>% 
  select(r,everything())

?min_rank
x <- c(5,1,3,2,2)
         
min_rank(x)
min_rank(x) %>% range 
Swamij41
?range

def <- tribble(
  ~a, ~b, ~c,
  #--/--/--
  'A', NA, 100,
  'A', 45, NA,
  'B', 41, 90
)

def %>% group_by(a) %>% 
  summarize(cases=sum(b,c, na.rm=TRUE))
def %>% group_by(a) %>% 
  summarize(cases=sum(b,c))
def %>% group_by(a) %>% 
  summarize(cases=sum(b,c)) %>% 
  filter(!is.na(cases))


# ### ---------------------------------------------------------------------
install.packages("COVID19")
library(COVID19)

covid19 <- covid19()
View(covid19)
covid19 %>% select(starts_with("administrative_area_level"))
View(covid19 %>% filter(administrative_area_level_1 == "India"))


# ### ---------------------------------------------------------------------
def <- tribble(
  ~a, ~b, ~c,
  #--/--/--
  'A', 33, 100,
  'A', 45, 77,
  'B', 41, 90
)

def %>% count(a)

def %>% count(a, wt=b)
def %>% group_by(a) %>% summarize(sum=sum(b))


# ### ---------------------------------------------------------------------

recent_grads <- 
  covid19 <- 
  read_csv("data/time_series_covid19_confirmed_global.csv")
  #read.csv("https://github.com/CSSEGISandData/COVID-19/blob/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv")
  
View(covid19)
dim(covid19)
covid19[1:10, 1:10]
n.col = ncol(covid19)
n.col
dates <- names(covid19)[5:n.col] %>% substr(1,8) %>% mdy()
dates
range(dates)
?read_csv

col_names(covid19)
x <- c(1,2,3)
x
names(x) <- c('bb', 'qq', 'aa')
names(x)[1] <- 'aa'
x

df = data.frame(year = 2000:2002,
                cat1 = c(0,0,1),
                cat2 = c(1,0,0),
                cat3 = c(0,1,0))
df


df = data.frame(year = 2000:2002,
                cat1 = c(0,0,1),
                cat2 = c(1,0,0),
                cat3 = c(0,1,0))
df
df2 <- df %>% pivot_longer(c(cat1,cat2,cat3), names_to =category, values_to =cases)
#df2 <- df %>% select starts_with(cat) %>% gather( key=category, value=cases)
df2
?pivot_longer
vignette("pivot")

df %>% 
  pivot_longer(
  cols = starts_with("cat"), 
  names_to = "category", 
  values_to = "cases",
  values_drop_na = TRUE)

covid19

covid19 %>% 
  pivot_longer(
    cols = ends_with("20"), 
    names_to = "date", 
    values_to = "cases",
    )

## source data files
filenames <- c('time_series_covid19_confirmed_global.csv',
               'time_series_covid19_deaths_global.csv',
               'time_series_covid19_recovered_global.csv')
filenames
url.path <- paste0('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/',
                   'master/csse_covid_19_data/csse_covid_19_time_series/')
url.path
## download files to local
download <- function(filename) {
  url <- file.path(url.path, filename)
  dest <- file.path('./data', filename)
  download.file(url, dest)
}
bin <- lapply(filenames, download)


# ### ---------------------------------------------------------------------

ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point() 
  scale_x_log10()
