library(tidyverse)

dt <- penguins

dt_clean <- dt %>% filter_out(is.na(sex))

ggplot(dt_clean, aes(x = body_mass, y = bill_len, color = sex)) +
  geom_point() +
  facet_wrap(~ species) +
  geom_smooth(method = lm)
