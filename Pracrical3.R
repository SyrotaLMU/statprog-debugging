library(palmerpenguins)
library(dplyr)
library(tidyverse)

Hello, here is my change
# 1. 
mean_mass_by <- function(data, group_var) {
   data  %>% 
    group_by(group_var)  %>% 
    summarise(mean_mass = mean(body_mass_g, na.rm = TRUE))
}

nmean_mass_by(penguins, species)

### You cant choice group. It thinks there is a column "group_var"

mean_mass_by <- function(data, group_var) {
  data  %>% 
    group_by({{ group_var }})  %>% 
    summarise(mean_mass = mean(body_mass_g, na.rm = TRUE))
}

mean_mass_by(penguins, species)

# 2.
summarise_species <- function(data) {
  data %>%
    group_by(species)  %>% 
    summarise(mean_mass = mean_body_mass(body_mass_g))

}
mean_body_mass <- function(x) {
  mean(x, na.rm = TRUE) ### TRUE, nor TREU
}

summarise_species(penguins)

# 3.
### First
my_factorial <- function(n) {
  if (n == 1) return(1)
  return(n * my_factorial(n - 1))
}

my_factorial <- function(n) {
  browser()
  if (n == 1) return(1)
  return(n * my_factorial(n - 1))
}

my_factorial(5)   # returns 120 — correct
my_factorial(0)   # hangs / errors
nmy_factorial(3.5) # also wrong

### Second
my_factorial <- function(n) {
  stopifnot(n >= 0, n == as.integer(n))
  if (n <= 1) return(1)
  return(n * my_factorial(n - 1))
}

my_factorial(5)   
my_factorial(0)   
my_factorial(3.5) # Double, not integer

# 4. 
standardise <- function(x) {
  if(!is.numeric(x))
    stop("It's should be numeric")
  (x - mean(x)) / sd(x)
}

standardise(c("a", "b"))   # fine
standardise(c(1, 2, 3, 4, 5))   # fine
standardise(c(1, 2, NA, 4, 5))  # returns all NAs — why?
