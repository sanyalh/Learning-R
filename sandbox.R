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

