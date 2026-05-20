# 1. Naming
library("tidyverse")

### Given name
f1 <- function(string, prefix) {
  str_sub(string, 1, str_length(prefix)) == prefix
}

### Changed name (long)
first_string_detector <- function(string, prefix) {
  str_sub(string, 1, str_length(prefix)) == prefix
}

### Given name
f3 <- function(x, y) {
  rep(y, length.out = length(x))
}

### Changed name
repeat_intenger <- f3 <- function(x, y) {
  rep(y, length.out = length(x))
}

# 2. Using Functions to Package Code 
library(palmerpenguins)

penguins

### What should be reproduced 
penguins %>%
  filter(species == "Adelie") %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm)) +
  geom_point() +
  labs(title = "Bill Length vs. Bill Depth for Adelie Penguins",
       x = "Bill Length (mm)",
       y = "Bill Depth (mm)")

### Function itself
scatter_penguins <- function(x_col, y_col, title, x_tit, y_tit) {
  penguins %>%
    filter(species == "Adelie") %>%
    ggplot(aes(x = {{ x_col }}, y = {{ y_col }})) +
    geom_point() +
    labs(title = title,
         x = x_tit,
         y = y_tit)
}

### Test function
scatter_penguins(x_col = flipper_length_mm, 
                 y_col = body_mass_g, 
                 title = "Flipper Lenght vs. Body Mass", 
                 x_tit = "Flipper Length (mm)", 
                 y_tit = "Body Mass (g)")

## Naming
#' @param x_col It's your x column
scatter_penguins <- function(x_col, y_col, title, x_tit, y_tit) {
penguins %>%
  filter(species == "Adelie") %>%
  ggplot(aes(x = {{ x_col }}, y = {{ y_col }})) +
  geom_point() +
  labs(title = title,
       x = x_tit,
       y = y_tit)
}