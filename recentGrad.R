---
title: "Untitled"
output: html_document

---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r}
library(tidyverse)
theme_set(theme_light())

```
```{r}
recent_grads <- read_csv("https://raw.githubusercontent.com/sanyalh/tidytuesday/master/data/2018/2018-10-16/recent-grads.csv")
```

```{r}
recent_grads %>% 
  mutate(Major_category = fct_reorder(Major_category,Median)) %>% 
  ggplot(aes(Major_category,Median)) +
  geom_boxplot() +
  scale_y_continuous(labels = label_dollar)
  coord_flip()
```
