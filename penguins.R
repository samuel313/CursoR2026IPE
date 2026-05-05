library(tidyverse)
library(ggplot2)

dt <- penguins

dt_clean <- dt %>% filter_out(is.na(sex))

ggplot(dt_clean, aes(x = body_mass, y = bill_len, color = sex)) +
  geom_point() +
  facet_wrap(~ species) +
  geom_smooth(method = lm)


m1 <- lm(bill_len ~ body_mass + sex + species, data = dt_clean)
summary(m1)

#relación entre el flipper_len y el body_mass
ggplot(dt, aes(body_mass, flipper_len)) + 
  geom_point() +
  facet_wrap(~species)
