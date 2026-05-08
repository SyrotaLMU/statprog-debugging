install.packages("palmerpenguins")
library("palmerpenguins")
library(tidyverse)
data.frame("palmerpenguins")
df <- data("penguins")
df <- penguins
df <- df %>% 
  filter(species == "Adelie")
ggplot(
  data = df,
  mapping = aes(
    x = bill_length_mm,
    y = bill_depth_mm
  
  )
) + 
  geom_point() +
  labs(
    title = "Bill Length vs. Bill Depth for Adelie Penguins",
    x = "Bill Length (mm)",
    y = "Bill Depth (mm)"
  )

