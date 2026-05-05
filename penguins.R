library(tidyverse)

dt <- penguins

ggplot(dt, aes(x = body_mass, y = bill_len, color = sex)) +
  geom_point() +
  facet_wrap(~ species)
