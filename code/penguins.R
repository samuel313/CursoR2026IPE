library(tidyverse)
library(ggplot2)

dt <- penguins

# Eliminate sex NAs
dt_clean <- dt %>% filter_out(is.na(sex))

# Plot 'bill_len' vs 'body_mass' per 'sex' and 'species'
ggplot(dt_clean, aes(x = body_mass, y = bill_len, color = sex)) +
  geom_point() +
  facet_wrap(~ species) +
  geom_smooth(method = lm)

# GLM without interaction
m1 <- lm(bill_len ~ body_mass + sex + species, data = dt_clean)
summary(m1)

#relación entre el flipper_len y el body_mass
ggplot(dt, aes(body_mass, flipper_len, colour = sex)) + 
  geom_point() +
  facet_wrap(~species)

#relación de las medidas del pico
ggplot(dt, aes(bill_len, bill_dep, colour = species)) + 
  geom_point()

m1 <- lm(bill_dep ~ bill_len * species, data = dt)
summary(m1)


# Load renv library
library(renv)

# To set up the R dependency management
renv::init()

# To update the dependency management
renv::snapshot()
